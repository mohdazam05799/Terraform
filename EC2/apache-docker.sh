#! /bin/bash
sudo apt-get update
sudo apt-get install -y apache2
sudo systemctl start apache2
sudo systemctl enable apache2
sudo echo "<h1>Hello guys</h1>" > /var/www/html/index.html 
sudo apt-get install -y docker.io
