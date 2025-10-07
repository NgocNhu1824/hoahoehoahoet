# ==========================
        # 1️⃣ Stage 1: Build project
# ==========================
FROM maven:3.9.8-eclipse-temurin-21 AS builder

# Set thư mục làm việc trong container
WORKDIR /app

# Copy toàn bộ code vào container
COPY . .

        # Build ứng dụng, bỏ qua test cho nhanh
RUN mvn clean package -DskipTests

# ==========================
        # 2️⃣ Stage 2: Run application
# ==========================
FROM eclipse-temurin:21-jre-jammy

# Thư mục làm việc của app
WORKDIR /app

# Copy file jar từ stage 1 sang
COPY --from=builder /app/target/*.jar app.jar

# Mở cổng 8080 (Render sẽ tự dùng)
EXPOSE 8080

# Biến môi trường (Render sẽ override khi deploy)
ENV SPRING_PROFILES_ACTIVE=prod

# Lệnh chạy ứng dụng
ENTRYPOINT ["java", "-jar", "app.jar"]
