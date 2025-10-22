FROM node:20-alpine AS builder
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
ENV VITE_API_URL=http://localhost:8080/api/v1
RUN npm run build

FROM nginx:mainline-alpine AS runtime
RUN apk add --no-cache nginx-mod-http-headers-more
RUN find /usr/share/nginx/html -type f -exec touch -t 202510010000 {} +
# Copy React build
COPY --from=builder /app/dist /usr/share/nginx/html

# Copy Nginx config
COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
