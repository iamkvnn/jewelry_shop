# Hướng dẫn chạy dự án

Monorepo gồm 3 phần:
- Backend (Spring Boot) tại thư mục [jewelry](jewelry)
- Admin (React + Vite) tại thư mục [shiny-management](shiny-management)
- Website UI (React + Vite) tại thư mục [shiny-website-ui](shiny-website-ui)
- File DB dump: [jewelrywebappdb.sql](jewelrywebappdb.sql)
- Orchestration (tùy chọn): [docker-compose.yml](docker-compose.yml)

## Yêu cầu
- Java 21, Maven Wrapper (đã có sẵn: [jewelry/mvnw](jewelry/mvnw), [jewelry/mvnw.cmd](jewelry/mvnw.cmd), cấu hình wrapper: [jewelry/.mvn/wrapper/maven-wrapper.properties](jewelry/.mvn/wrapper/maven-wrapper.properties))
- Node.js 18+ và npm 9+ (tham khảo script trong [shiny-management/package.json](shiny-management/package.json))
- Docker & Docker Compose (nếu chạy bằng container)

## Cách 1: Chạy nhanh bằng Docker Compose
1. Ở thư mục gốc, chạy:
   - Linux/macOS: `docker compose up --build`
   - Windows: `docker-compose up --build`
2. Kiểm tra mapping cổng trong [docker-compose.yml](docker-compose.yml) để truy cập các dịch vụ.
3. Dừng dịch vụ: `docker compose down -v`

Lưu ý:
- Backend listen mặc định 8080 (xem [jewelry/Dockerfile](jewelry/Dockerfile) và [jewelry/pom.xml](jewelry/pom.xml))
- Admin build và serve qua Nginx (xem [shiny-management/Dockerfile](shiny-management/Dockerfile), [shiny-management/nginx.conf](shiny-management/nginx.conf))

## Cách 2: Chạy thủ công (local dev)

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
- Cấu hình DB (ví dụ biến môi trường Spring): `SPRING_DATASOURCE_URL`, `SPRING_DATASOURCE_USERNAME`, `SPRING_DATASOURCE_PASSWORD` (tham khảo thêm trong [jewelry/pom.xml](jewelry/pom.xml)).

### 2) Admin: shiny-management (React + Vite + TypeScript)
- Cài và chạy:
  - `cd shiny-management`
  - `npm install`
  - `npm start` (script start dùng Vite trong [shiny-management/package.json](shiny-management/package.json))
- Mặc định Vite chạy cổng 5173 (xem [shiny-management/index.html](shiny-management/index.html), [shiny-management/tsconfig.json](shiny-management/tsconfig.json)).

### 3) Website UI: shiny-website-ui (React + Vite)
- Cài và chạy:
  - `cd shiny-website-ui`
  - `npm install`
  - `npm run dev` hoặc `npm start` (tùy script trong package.json)
- Nếu trùng cổng với Admin, đổi cổng khi chạy Vite (ví dụ: `vite --port 5174`).
- Tham khảo entry HTML: [shiny-website-ui/index.html](shiny-website-ui/index.html).

## Cơ sở dữ liệu
- Nhập dữ liệu mẫu (MySQL/MariaDB):
  - Tạo database trống.
  - Import: `mysql -u <user> -p <dbname> < jewelrywebappdb.sql`
- Đảm bảo backend kết nối đúng DB qua biến môi trường hoặc application properties.

## Build Docker từng service (tùy chọn)
- Backend:
  - `docker build -t jewelry-api:latest -f jewelry/Dockerfile jewelry`
- Admin:
  - `docker build -t shiny-management:latest -f shiny-management/Dockerfile shiny-management`
- Website UI:
  - `docker build -t shiny-website-ui:latest -f shiny-website-ui/Dockerfile shiny-website-ui`