FROM node:alpine as builder

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm install

COPY . .

FROM node:alpine

WORKDIR /usr/src/app

COPY --from=builder /usr/src/app .

EXPOSE 3000

CMD [ "node", "server.js" ]

# docker build -t k8s-test-node-app:v1.0 .
# docker run -it -e APP_VERSION=1.0.0 -p 3000:3000 --name k8s-test-node-app k8s-test-node-app:v1.0
