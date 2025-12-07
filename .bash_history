docker --version
sudo yum install -y docker amazon-efs-utils
sudo systemctl start docker
sudo systemctl enable docker
sudo systemctl status docker
sudo usermod -aG docker ec2-user
sudo reboot
sudo mkdir -p /mnt/efs
sudo mount -t efs fs-0f8e8807ad6413672:/ /mnt/efs
docker volume create myvol
sudo mount --bind /mnt/efs /var/lib/docker/volumes/myvol/_data
docker run -d --name wp -v myvol:/var/www/html -p 8081:80 wordpress
docker ps -a
docker exec -it wp bash
ls -l /mnt/efs
docker exec -it wp bash
ls /var/www/html
cat /var/www/html/test.txt
ls -l /mnt/efs/proof.txt
cat /mnt/efs/proof.txt
ls /mnt/efs/final-test
ls -l /mnt/efs/final-test
cat /mnt/efs/final-test/fileA.txt
cat /mnt/efs/final-test/fileB.txt
docker ps -a
docker images
docker volume ls
docker network ls
docker rm wp
docker rmi wordpress
docker ps -a
docker run -it --name web1 -volume myvol:/var/www/html -p 80808:80 -network mynetwork nginx
docker run -it --name web1 --volume myvol:/var/www/html --p 80808:80 --network mynetwork nginx
docker run -it --name web1 -p 8080:80 -v myvolume:/var/www/html --network mynetwork nginx
docker ps -a
docker rm web1
docker rmi nginx
docker images
docker ps -a
docker network create mynetwork
docker run -it --name web1 -p 8080:80 -v myvolume:/var/www/html --network mynetwork nginx
docker run -it --name db1 -p 8081:80 -v myvolume:/var/www/html --network mynetwork wordpress
docker ps -a
docker exec -it web1 bash
docker exec -it db1 bash
du -sh /var/www/html
docker commit web1 imageweb1
docker commit db1 imagedb1
docker images
docker tag imageweb1 syedsarfaraz179/imageweb1:latest
docker tag imagedb1 syedsarfaraz179/imagedb1:latest
docker login
docker push syedsarafraz179/imageweb1:latest
docker push syedsarfaraz179/imageweb1:latest
docker push syedsarfaraz179/db1:latest
docker push syedsarfaraz179/imagedb1:latest
