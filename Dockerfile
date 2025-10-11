# ==========================
# 1️⃣ Stage 1: Build project
# ==========================
FROM maven:3.9.8-eclipse-temurin-21 AS builder

<<<<<<< HEAD
# Thư mục làm việc trong container
WORKDIR /app

# Copy toàn bộ source vào container
COPY . .

# Build ứng dụng, bỏ qua test cho nhanh
=======
WORKDIR /app
COPY . .

# Build ứng dụng, bỏ qua test
>>>>>>> 1f794fa7f1bbb5ceb357ada9c409a09f90fb47d0
RUN mvn clean package -DskipTests

# ==========================
# 2️⃣ Stage 2: Run application
# ==========================
FROM eclipse-temurin:21-jre-jammy

WORKDIR /app

# Copy jar từ stage 1
COPY --from=builder /app/target/*.jar app.jar

<<<<<<< HEAD
# Mở cổng 8080 (Render sẽ tự ánh xạ PORT)
EXPOSE 8080

# Thiết lập profile mặc định là 'prod'
=======
# Mở cổng 8080 (Render sẽ override bằng $PORT)
EXPOSE 8080

# Biến môi trường cho profile prod
>>>>>>> 1f794fa7f1bbb5ceb357ada9c409a09f90fb47d0
ENV SPRING_PROFILES_ACTIVE=prod

# ⚠️ Quan trọng: Render sẽ cấp biến PORT động, phải ép Spring Boot dùng nó
ENTRYPOINT ["sh", "-c", "java -Dserver.port=${PORT:-8080} -jar app.jar"]
