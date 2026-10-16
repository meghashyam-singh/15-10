FROM node:20-alpine3.22 AS builder
WORKDIR /app
COPY package*.json ./
RUN npm install --only==production
COPY . .

FROM node:20-alpine3.22
WORKDIR /app
COPY --from=builder /app /app
RUN addgroup -S roboshop && \
    adduser -S roboshop -G roboshop && \
    chown -R roboshop:roboshop /app
ENV REDIS_HOST="redis-cont" \
    CATALOGUE_HOST="catalogue-cont" \
    CATALOGUE_PORT="8080"
USER roboshop
EXPOSE 8080
ENTRYPOINT [ "node" ]
CMD [ "server.js" ]