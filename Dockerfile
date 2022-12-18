FROM node:alpine as teamalpha

WORKDIR /var/app

COPY package.json .

RUN npm install

COPY . .

RUN npm run build

FROM nginx as finalprod
EXPOSE 3000
COPY  --from=teamalpha /var/app/build /usr/share/nginx/html
