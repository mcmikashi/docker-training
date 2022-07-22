FROM node:alpine as builder

WORKDIR /usr/app

COPY ./my-app/ ./

RUN npm install

RUN npm run build

FROM nginx

COPY --from=builder /usr/app/dist  /usr/share/nginx/html
