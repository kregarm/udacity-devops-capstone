FROM node:10

# Create app directory
WORKDIR /usr/src/app
asdfasfas
# Copy and Install app dependencies
COPY package.json .
COPY package-lock.json .
RUN npm install

# Copy index.js
COPY index.js .

# Expose port
EXPOSE 8080

# Start app
CMD [ "node", "index.js" ]