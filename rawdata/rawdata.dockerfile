
FROM datalift/dlbase:latest

# use this build command
#  docker build -f rawdata.dockerfile -t datalift/rawdata .

# use this run command
#  docker run -d -p 3002:3000 --name raw datalift/rawdata

#test server
# docker-machine ip

#push to hub
#  docker pull datalift/rawdata
#  docker push datalift/rawdata

#docker exec -it CONTAINER_ID /bin/bash
#docker exec -it raw /bin/bash
