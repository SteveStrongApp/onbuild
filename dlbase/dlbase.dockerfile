
FROM node:latest

# use this build command
#  docker build -f dlbase.dockerfile -t datalift/dlbase .

# use this run command
#  docker run -d -p 3001:3000  datalift/dlbase

#test server
# docker-machine ip

#push to hub
#  docker pull datalift/dlbase
#  docker push datalift/dlbase

ENV APP=/var/www

# Create app directory
RUN mkdir -p $APP
WORKDIR $APP

# Install app dependencies
COPY package.json $APP
RUN npm install --production

# Bundle app source
COPY . $APP
ONBUILD COPY ./data $APP/data
ONBUILD COPY ./extend $APP/extend

EXPOSE 3000
CMD [ "npm", "start", "--production", "--noquery" ]

