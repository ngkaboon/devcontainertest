FROM node:18-alpine AS build

WORKDIR /app

COPY package*.json ./

RUN npm ci --only=production && npm cache clean --force

FROM node:18-alpine AS production

WORKDIR /app

RUN addgroup -g 1001 -S nodejs && \
    adduser -S nodeuser -u 1001

COPY --from=build /app/node_modules ./node_modules
COPY --chown=nodeuser:nodejs . .

USER nodeuser

EXPOSE 8080

CMD ["npm", "start"]