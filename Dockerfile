# ==========================
# 1️⃣ Stage 1: Build project
# ==========================
FROM maven:3.9.8-eclipse-temurin-21 AS builder

WORKDIR /app
COPY . .

# Build ứng dụng, bỏ qua test
RUN mvn clean package -DskipTests

# ==========================
# 2️⃣ Stage 2: Run application
# ==========================
FROM eclipse-temurin:21-jre-jammy

WORKDIR /app

# Copy jar từ stage 1
COPY --from=builder /app/target/*.jar app.jar

# Mở cổng 8080 (Render sẽ override bằng $PORT)
EXPOSE 8080

# Biến môi trường cho profile prod
ENV SPRING_PROFILES_ACTIVE=prod

# Lệnh chạy ứng dụng
ENTRYPOINT ["java", "-jar", "app.jar"]
