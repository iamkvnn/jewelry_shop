package com.web.jewelry.service.authentication;

import com.google.api.client.googleapis.auth.oauth2.GoogleAuthorizationCodeTokenRequest;
import com.google.api.client.http.javanet.NetHttpTransport;
import com.google.api.client.json.gson.GsonFactory;
import com.nimbusds.jose.*;
import com.nimbusds.jose.crypto.MACSigner;
import com.nimbusds.jose.crypto.MACVerifier;
import com.nimbusds.jwt.JWTClaimsSet;
import com.nimbusds.jwt.SignedJWT;
import com.web.jewelry.dto.request.AuthenticationRequest;
import com.web.jewelry.dto.request.IntrospectRequest;
import com.web.jewelry.dto.response.AuthenticationResponse;
import com.web.jewelry.dto.response.IntrospectResponse;
import com.web.jewelry.dto.response.UserResponse;
import com.web.jewelry.enums.EUserStatus;
import com.web.jewelry.exception.BadRequestException;
import com.web.jewelry.exception.ResourceNotFoundException;
import com.web.jewelry.model.Customer;
import com.web.jewelry.model.User;
import com.web.jewelry.model.Manager;
import com.web.jewelry.model.Staff;
import com.web.jewelry.repository.CustomerRepository;
import com.web.jewelry.repository.StaffRepository;
import com.web.jewelry.repository.ManagerRepository;
import com.web.jewelry.service.user.IUserService;

import lombok.RequiredArgsConstructor;
import lombok.experimental.NonFinal;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import java.io.IOException;
import java.text.ParseException;
import java.time.Instant;
import java.time.temporal.ChronoUnit;
import java.util.Date;
import java.util.Map;

@RequiredArgsConstructor
@Service
public class AuthenticationService {
    private final IUserService userService;
    private final PasswordEncoder passwordEncoder;
    private final CustomerRepository userRepository;
    private final StaffRepository staffRepository;
    private final ManagerRepository managerRepository;

    @NonFinal
    @Value("${jwt.signerKey}")
    private String SIGNER_KEY;
    @Value("${jwt.expireTime}")
    private Long EXPIRATION_TIME;
    @Value("${spring.security.oauth2.client.registration.google.client-id}")
    private String googleClientId;
    @Value("${spring.security.oauth2.client.registration.google.client-secret}")
    private String googleClientSecret;
    @Value("${spring.security.oauth2.client.registration.google.redirect-uri}")
    private String googleRedirectUri;
    @Value("${spring.security.oauth2.client.provider.google.user-info-uri}")
    private String googleUserInfoUri;


    public AuthenticationResponse authenticate (AuthenticationRequest request) {
        User user = switch (request.getRole().toString().toLowerCase()) {
            case "manager" -> userService.getManagerByEmail(request.getEmail());
            case "staff" -> userService.getStaffByEmail(request.getEmail());
            case "customer" -> userService.getCustomerByEmail(request.getEmail());
            default -> null;
        };
        assert user != null;
        if (user.getStatus() == EUserStatus.BANNED) {
            throw new BadRequestException("Your account has been banned");
        }
        if (user.getStatus() == EUserStatus.REMOVED) {
            throw new ResourceNotFoundException("User not found");
        }
        if(!request.isLoginWithGoogle() && !passwordEncoder.matches(request.getPassword(), user.getPassword())){
            handleFailedLogin(user);
            throw new BadRequestException("Invalid username or password");
        }
        resetFailedAttempts(user);
        String token = generateToken(user);
        UserResponse userResponse = userService.convertToUserResponse(user);
        return AuthenticationResponse.builder()
                .user(userResponse)
                .token(token)
                .build();
    }

    private void resetFailedAttempts(User user) {
        if (user.getFailedAttempts() > 0) {
            user.setFailedAttempts(0L);
            switch (user.getRole()) {
                case CUSTOMER -> userRepository.save((Customer) user);
                case STAFF -> staffRepository.save((Staff) user);
                case MANAGER -> managerRepository.save((Manager) user);
            }
        }
    }

    private void handleFailedLogin(User user) {
        long newAttempts = user.getFailedAttempts() + 1;
        user.setFailedAttempts(newAttempts);
        if (newAttempts >= 5) {
            user.setStatus(EUserStatus.BANNED);
        }
        switch (user.getRole()) {
            case CUSTOMER -> userRepository.save((Customer) user);
            case STAFF -> staffRepository.save((Staff) user);
            case MANAGER -> managerRepository.save((Manager) user);
        }
    }

    private String generateToken(User user) {
        JWSHeader header = new JWSHeader(JWSAlgorithm.HS512);
        JWTClaimsSet jwtClaimsSet = new JWTClaimsSet.Builder()
                .subject(user.getEmail())
                .issuer("shiny.com")
                .issueTime(new Date())
                .expirationTime(new Date(
                        Instant.now().plus(EXPIRATION_TIME, ChronoUnit.MILLIS).toEpochMilli()
                ))
                .claim("scope", user.getRole())
                .build();
        Payload payload = new Payload(jwtClaimsSet.toJSONObject());

        JWSObject jwsObject = new JWSObject(header, payload);

        try{
            jwsObject.sign(new MACSigner(SIGNER_KEY.getBytes()));
            return jwsObject.serialize();
        }
        catch (JOSEException e){
            throw new RuntimeException(e.getMessage());
        }
    }

    public IntrospectResponse introspect(IntrospectRequest request) throws JOSEException, ParseException {
        String token = request.getToken();
        JWSVerifier verifier = new MACVerifier(SIGNER_KEY.getBytes());
        SignedJWT signedJWT = SignedJWT.parse(token);
        Date expirationDate = signedJWT.getJWTClaimsSet().getExpirationTime();

        boolean verified = signedJWT.verify(verifier);
        return  IntrospectResponse.builder()
                .valid(verified && expirationDate.after(new Date()))
                .build();

    }

    public Customer verifyIDTokenAndGetUser(String idToken) throws IOException {
        RestTemplate restTemplate = new RestTemplate();
        String at = new GoogleAuthorizationCodeTokenRequest(
                new NetHttpTransport(),
                new GsonFactory(),
                googleClientId,
                googleClientSecret,
                idToken,
                googleRedirectUri
        ).execute().getAccessToken();

        restTemplate.getInterceptors().add((request, body, execution) -> {
            request.getHeaders().set("Authorization", "Bearer " + at);
            return execution.execute(request, body);
        });

        Map userInfo = restTemplate.getForObject(googleUserInfoUri, Map.class);

        if (userInfo == null || userInfo.isEmpty()) {
            throw new BadRequestException("Failed to retrieve user info from Google");
        }
        String email = (String) userInfo.get("email");
        return userRepository.findByEmail(email).orElseThrow(() -> new ResourceNotFoundException("User not found with email: " + email));
    }
}
