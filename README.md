Cloud9 v3 Dockerfile

This repository contains Dockerfile of Cloud9 IDE for Docker's automated build published to the public Docker Hub Registry.

Base Docker Image

kdelfour/supervisor-docker

Installation

Install Docker.

Download automated build from public Docker Hub Registry: docker pull mstev0du/cloud9-ide

(alternatively, you can build an image from Dockerfile: docker build -t="mstev0du/cloud9-docker" github.com/msteven101/cloud9-ide)

Usage

docker run -it -d -p 80:80 mstev0du/cloud9-ide
You can add a workspace as a volume directory with the argument -v /your-path/workspace/:/workspace/ like this :

docker run -it -d -p 80:80 -v /your-path/workspace/:/workspace/ mstev0du/cloud9-ide
Build and run with custom config directory

Get the latest version from github

git clone https://github.com/msteven101/cloud9-ide
cd cloud9-docker/
Build it

sudo docker build --force-rm=true --tag="$USER/cloud9-ide:latest" .
And run

sudo docker run -d -p 80:80 -v /your-path/workspace/:/workspace/ $USER/cloud9-ide:latest
Enjoy !!
