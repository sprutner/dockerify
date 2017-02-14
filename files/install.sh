sudo apt-get -y install docker.io
sudo usermod -a -G docker ec2-user
sudo service docker start
sudo curl -L https://github.com/docker/compose/releases/download/2.11.1/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
