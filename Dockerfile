# ==========================
# 1️⃣ Stage 1: Build project
# ==========================
FROM maven:3.9.8-eclipse-temurin-21 AS builder
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

# ==========================
# 2️⃣ Stage 2: Run application
# ==========================
FROM eclipse-temurin:21-jre-jammy
WORKDIR /app
COPY --from=builder /app/target/*.jar app.jar

# Mở cổng (Render sẽ gán PORT env var)
EXPOSE 8080

# Đặt profile production
ENV SPRING_PROFILES_ACTIVE=prod

# ⚠️ Quan trọng: Render gán PORT động -> bắt PORT biến môi trường
ENTRYPOINT ["sh", "-c", "java -Dserver.port=${PORT:-8080} -jar app.jar"]
