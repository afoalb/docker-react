FROM node:14.16.0-alpine3.13 as builder
WORKDIR /app
COPY package.json .
RUN npm install
COPY . . 
EXPOSE 3000
RUN ["npm", "run", "build"]

FROM nginx:1.12-alpine
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html
