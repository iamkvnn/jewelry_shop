# Hướng dẫn chạy dự án

Dự án bao gồm các thành phần sau:

- **Backend** (Spring Boot): [`jewelry`](jewelry)
- **Admin Panel** (React + Vite): [`shiny-management`](shiny-management)  
- **User Website** (React + Vite): [`shiny-website-ui`](shiny-website-ui)
- **Database dump**: [`jewelrywebappdb.sql`](jewelrywebappdb.sql)
- **Docker Compose** (tùy chọn): [`docker-compose.yml`](docker-compose.yml)

---

## 🚀 Cách 1: Chạy nhanh với Docker Compose

### Yêu cầu
- Docker

### Các bước thực hiện

1. **Khởi động MySQL:**
    ```bash
    docker compose up -d mysql
    ```

2. **Đợi MySQL khởi động hoàn tất, sau đó chạy các service còn lại:**
    ```bash
    docker compose up -d backend fe-management fe-user
    ```

3. **Dừng tất cả service:**
    ```bash
    docker compose down -v
    ```

---

## 🛠️ Cách 2: Chạy thủ công (Local Development)

### Yêu cầu hệ thống
- **Java 21** + Maven
- **Node.js 18+** + npm 9+
- **MySQL**

### 1️⃣ Thiết lập cơ sở dữ liệu

**Nhập dữ liệu mẫu vào MySQL:**
```bash
mysql -u <username> -p <database_name> < jewelrywebappdb.sql
```

### 2️⃣ Backend: jewelry (Spring Boot)

**Chạy trực tiếp:**
```bash
cd jewelry
mvnw.cmd spring-boot:run
```

**Hoặc build JAR và chạy:**
```bash
./mvnw clean package -DskipTests
java -jar target/*.jar
```
**Cấu hình kết nối:** Đảm bảo backend kết nối đúng DB qua biến môi trường hoặc file [`application.properties`](jewelry/src/main/resources/application.properties)

**Biến môi trường cấu hình DB:**
- `SPRING_DATASOURCE_URL`
- `SPRING_DATASOURCE_USERNAME` 
- `SPRING_DATASOURCE_PASSWORD`

### 3️⃣ Admin Panel: shiny-management (React + Vite + TypeScript)

```bash
cd shiny-management
npm install
npm start
```

> 💡 Mặc định chạy trên cổng **5173**

### 4️⃣ User Website: shiny-website-ui (React + Vite)

```bash
cd shiny-website-ui
npm install
npm run dev
```