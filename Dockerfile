FROM node:carbon
WORKDIR /usr/src/app
COPY package*.json ./
RUN npm install
COPy . .
Expose 8080
CMD ["npm", "start"]

