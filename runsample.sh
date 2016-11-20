#!/bin/bash
#!/bin/bash
# Stop all containers
docker stop $(docker ps -a -q)
# Delete all containers
docker rm -f $(docker ps -a -q)
# Delete all images
docker rmi -f $(docker images -q)

#build the base image
cd dlbase
docker build -f dlbase.dockerfile -t datalift/dlbase .
docker run -d -p 3001:3000  datalift/dlbase

cd ..
cd rawdata
docker build -f rawdata.dockerfile -t datalift/rawdata .
docker run -d -p 3002:3000 --name raw datalift/rawdata

echo "browse to localhost:3002"