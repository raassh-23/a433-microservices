# set base image
FROM node:14

# set working directory
WORKDIR /app

# copy all project file
COPY . .

# set environment variables to production mode
ENV NODE_ENV=production DB_HOST=item-db

# install dependencies and build
RUN npm install --production --unsafe-perm && npm run build

# expose port 8080
EXPOSE 8080

# start the app
CMD ["npm", "start"]
