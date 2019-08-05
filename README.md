
# Cloud9-Ide Dockerfile
This repository contains Dockerfile for the Cloud9 IDE SDK image. I am currently using this image for my Kubernetes Cloud9 deployments, but put this up there in case someone was having the same problems I had when trying to find a viable solution.   


### Base Docker Image
```docker
FROM ubuntu:16.04
```
### Image tracks:
The most up-to-date Cloud9-sdk build via https://github.com/c9/core.git
    
### Important Notes:
Updates to the following modules were made to secure vulnerabilities not 
covered in the initial install-sdk.sh script for Cloud9-SDK after the 
update of NODEJS and Ubunutu:16.04
    
- pug-cli
- minimatch@3.0.2

### Download the latest code from Github 
https://github.com/mst3v3nsn/cloud9-ide
#### Clone the repository 
<code>git clone https://github.com/mst3v3nsn/cloud9-ide</code>

<code>cd cloud9-docker/</code>

### Docker command to start a container with NFS and uid/gid mapping 
- replace "username" with the username for which the container is being created for and "uid/gid" respectively
- specify path to nfs export for "/path/to/nfs/export/for/username" including the server FQDN or IP in the full path
<code>
docker run -it -d \
--name username-c9 \
--user=uid:gid \
--mount type=volume,volume-driver=nfs,source=/path/to/nfs/export/for/username,target=/workspace/username \ 
-p 80:80 \
mstev0du/cloud9-ide:latest
</code>
NOTE: for this option to work docker-netshare-volume plugin must be installed and running on host machine.
https://github.com/ContainX/docker-volume-netshare

If installed correctly, run the plugin using with the command:
<code>
sudo service docker-netshare-volume start
</code>
For kubernetes deployments, specify:
<code>
nfs:
  server: serverName
  path: /path/on/server
</code>
### To run the container normally with defaults

<code> docker run -it -d --user=0:0 -p 80:80 mstev0du/cloud9-ide:latest </code>
