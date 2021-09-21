#!/binbash

# Update CentOs with any patches
yum update -y --exclude=kernel

# Tools
yum install -y nano git unzip screen

# Apache
yum install -y httpd httpd-devel httpd-tools
chkconfig --add httpd
chkconfig httpd on
service httpd stop

rm -rf /var/www/html
ln -s /vagrant /var/www/html

service httpd strt

# PHP
yum install -y php php-cli php-common php-devel php-mysql

#MySql
yum install -y mysql mysgl-server mysql-devel
chkconfig --add mysqld
chkconfig mysqld on

service mysqld start

mysql -u root -e "SHOW DATABASES";

# Download Starter Content
cd /vvagrant
sudo -u vagrant wget -q https://raw.githubusercontent.com/jakoblumpkin/vagrant/master/files/index.html
sudo -u vagrant wget -q https://raw.githubusercontent.com/jakoblumpkin/vagrant/master/files/info.php
service httpd restart