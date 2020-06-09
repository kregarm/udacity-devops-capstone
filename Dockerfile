FROM node:10

# Create app directory
WORKDIR /usr/src/app

# Copy and Install app dependencies
COPY package.json .
COPY package-lock.json .
RUN npm install

# Copy index.js
COPY index.js .
qwe
# Expose port
EXPOSE 8080asdasd
asdasd
# Start app
CMD [ "node", "index.js" ]