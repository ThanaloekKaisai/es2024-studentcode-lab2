#!/bin/bash

# Start MongoDB container
docker run -d --name mongodbklaztk -v ~/lab2/mongodb/init.js:/docker-entrypoint-initdb.d/init.js mongo

# Start Express container
docker build -t expressklaztk ~/lab2/express
docker run -d --name expressklaztk --link mongodbklaztk -p 3030:3030 expressklaztk

# Start Nginx container
docker run -d --name nginxklaztk -p 8080:80 -v ~/lab2/nginx/nginx.conf:/etc/nginx/nginx.conf -v ~/lab2/nginx/index.html:/usr/share/nginx/html/index.html nginx

