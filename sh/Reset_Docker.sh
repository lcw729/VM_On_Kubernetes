# Docker 초기화
docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)
docker rmi $(docker images -q) 
sudo systemctl restart docker

