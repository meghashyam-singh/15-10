FROM maven:3.9-eclipse-temurin-17-alpine AS builder
WORKDIR /app
COPY . .
RUN mvn clean package

FROM eclipse-temurin:17-jre-alpine
WORKDIR /app
COPY --from=builder /app/target/shipping-1.0.jar /app/shipping.jar
RUN addgroup -S roboshop && \
    adduser -S roboshop -G roboshop && \
    chown -R roboshop:roboshop /app
ENV CART_ENDPOINT="cart-cont:8080" \
    DB_HOST="mysql-cont"
USER roboshop
EXPOSE 8080
ENTRYPOINT [ "java", "-jar" ]
CMD [ "shipping.jar" ]
