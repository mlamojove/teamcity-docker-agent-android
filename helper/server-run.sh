#!/bin/bash

# Pull image and run teamcity server.

docker pull jetbrains/teamcity-server

data_dir=/Users/martin/development/teamcity/data/
logs_dir=/Users/martin/development/teamcity/logs/

docker run -it --name teamcity-server-instance -v $data_dir:/data/teamcity_server/datadir -v $logs_dir:/opt/teamcity/logs -p 8111:8111 jetbrains/teamcity-server
