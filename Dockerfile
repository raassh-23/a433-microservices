FROM node:18-alpine AS base

WORKDIR /src

COPY package*.json ./

ENV NODE_ENV=production

ENV PORT=3000

ENV AMQP_URL=amqp://localhost:5672

RUN npm ci

COPY ./*.js ./

CMD ["node", "index.js"]
