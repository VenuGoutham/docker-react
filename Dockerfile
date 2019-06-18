FROM node:alpine as builderPhase
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build


FROM nginx
COPY --from=builderPhase /app/build /usr/share/nginx/html
