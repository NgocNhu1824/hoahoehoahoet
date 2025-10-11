# ==========================
# 1️⃣ Stage 1: Build project
# ==========================
FROM maven:3.9.8-eclipse-temurin-21 AS builder

# Thư mục làm việc trong container
WORKDIR /app

# Copy toàn bộ source vào container
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

# Mở cổng 8080 (Render sẽ tự ánh xạ PORT)
EXPOSE 8080

# Thiết lập profile mặc định là 'prod'
ENV SPRING_PROFILES_ACTIVE=prod

# ⚠️ Quan trọng: Render sẽ cấp biến PORT động, phải ép Spring Boot dùng nó
ENTRYPOINT ["sh", "-c", "java -Dserver.port=${PORT:-8080} -jar app.jar"]
