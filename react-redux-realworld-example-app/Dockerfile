FROM node:16-bullseye

WORKDIR /app

COPY package.json package-lock.json ./
RUN npm ci

COPY . .

EXPOSE 4100

CMD ["npm", "start"]
