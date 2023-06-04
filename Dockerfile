# Use Node.js 18 Alpine image as base
FROM node:18-alpine AS base

# Set working directory
WORKDIR /src

# Copy package files
COPY package*.json ./

# Set production environment
ENV NODE_ENV=production

# Set application port
ENV PORT=3001

# Set RabbitMQ URL
ENV AMQP_URL=amqp://localhost:5672

# Install dependencies
RUN npm ci

# Copy JavaScript files
COPY ./*.js ./

# Run Node.js application
CMD ["node", "index.js"]
