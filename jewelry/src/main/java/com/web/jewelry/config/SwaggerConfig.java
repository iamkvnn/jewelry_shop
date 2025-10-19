package com.web.jewelry.config;

import io.swagger.v3.oas.models.OpenAPI;
import io.swagger.v3.oas.models.info.Contact;
import io.swagger.v3.oas.models.info.Info;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class SwaggerConfig {
    @Bean
    public OpenAPI customOpenAPI() {
        return new OpenAPI()
                .info(new Info()
                        .title("Jewelry Shop API")
                        .version("1.0.0")
                        .description("API documentation for Jewelry Shop backend")
                        .contact(new Contact()
                                .name("Vũ Khoa")
                                .email("support@shinyjewelry.shop")));
    }
}