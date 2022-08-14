

모든 도커 이미지 삭제(remove all docker images)
sudo docker rmi -f $(sudo docker images -q) 

docker-compose를 1.29.2에서 1.25.4로 다운그레이드하면

sudo docker container prune

