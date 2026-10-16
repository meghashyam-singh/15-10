FROM node:20-alpine3.22 AS builder
WORKDIR /app
COPY package*.json ./
RUN npm install --only=production
COPY . .

FROM node:20-alpine3.22
WORKDIR /app
COPY --from=builder /app /app
RUN addgroup -S roboshop && \
    adduser -S roboshop -G roboshop && \
    chown -R roboshop:roboshop /app
ENV MONGO="true" \
    MONGO_URL="mongodb://mongodb-cont:27017/catalogue"
USER roboshop
EXPOSE 8080
ENTRYPOINT [ "node" ]
CMD ["server.js"]