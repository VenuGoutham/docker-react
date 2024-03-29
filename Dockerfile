FROM node:alpine as builderPhase
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build


FROM nginx
EXPOSE 80
COPY --from=builderPhase /app/build /usr/share/nginx/html
