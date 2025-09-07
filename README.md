# Hướng dẫn chạy

Gồm 3 phần:
- Backend (Spring Boot) tại thư mục [jewelry](jewelry)
- Admin (React + Vite) tại thư mục [shiny-management](shiny-management)
- Website (React + Vite) tại thư mục [shiny-website-ui](shiny-website-ui)
- File DB dump: [jewelrywebappdb.sql](jewelrywebappdb.sql)
- Orchestration (tùy chọn): [docker-compose.yml](docker-compose.yml)

## Cách 1: Chạy nhanh bằng Docker Compose
1. Ở thư mục gốc, chạy:
   - Linux/macOS: `docker compose up`
   - Windows: `docker-compose up`
3. Dừng dịch vụ: `docker compose down -v`

## Cách 2: Chạy thủ công (local dev)

## Yêu cầu 
- Java 21, Maven
- Node.js 18+ và npm 9+
- Docker & Docker Compose (nếu chạy bằng container)

### 1) Backend: jewelry (Spring Boot)
- Chạy trực tiếp:
  - Linux/macOS:
    - `cd jewelry`
    - `./mvnw spring-boot:run`
  - Windows:
    - `cd jewelry`
    - `mvnw.cmd spring-boot:run`
- Build JAR và chạy:
  - `./mvnw clean package -DskipTests`
  - `java -jar target/*.jar`
- Mặc định chạy trên cổng 8080.
- Cấu hình DB (ví dụ biến môi trường Spring): `SPRING_DATASOURCE_URL`, `SPRING_DATASOURCE_USERNAME`, `SPRING_DATASOURCE_PASSWORD`

### 2) Admin: shiny-management (React + Vite + TypeScript)
- Cài và chạy:
  - `cd shiny-management`
  - `npm install`
  - `npm start`
- Mặc định Vite chạy cổng 5173
### 3) Website UI: shiny-website-ui (React + Vite)
- Cài và chạy:
  - `cd shiny-website-ui`
  - `npm install`
  - `npm run dev`

## Cơ sở dữ liệu
- Nhập dữ liệu mẫu (MySQL):
  - Mở cmd
  - Nhập: `mysql -u <user> -p <dbname> < jewelrywebappdb.sql`
- Đảm bảo backend kết nối đúng DB qua biến môi trường hoặc application properties.