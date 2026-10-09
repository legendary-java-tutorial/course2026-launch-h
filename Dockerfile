# alpine: меньше пакетов — меньше уязвимостей
FROM node:26-alpine
WORKDIR /app
COPY package*.json ./
RUN npm ci --omit=dev
COPY . .
# папка тома — для node
RUN mkdir -p /data && chown node:node /data
EXPOSE 3000
# дальше всё — от пользователя node
USER node
CMD ["node", "server.js"]
