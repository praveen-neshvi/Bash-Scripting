#This script is for running a static website by using Apache server (httpd) for CentOS distros
#For ubuntu related distros need to use apt

#! /bin/bash

#Install necessary dependencies
echo "===================================================================="
echo "Installing dependencies"
sudo yum install wget unzip httpd -y > /dev/null                        #/dev/null is like a blackhole where any unnecessary data can be dumped
echo "===================================================================="

#Https Service
echo "===================================================================="
echo "Starting and enabling dependencies"
sudo systemctl start httpd
sudo systemctl enable httpd
echo "===================================================================="

#Creating artifactory depolyment
echo "===================================================================="
echo "Creating tempory folder and documents"
mkdir -p /tmp/webfiles
cd /tmp/webfiles
ls /tmp/
echo "===================================================================="

#Download the zip file of static html page
echo "===================================================================="
echo "Downloading and unzipping web page contents"
wget https://www.tooplate.com/zip-templates/2137_barista_cafe.zip > /dev/null
unzip 2137_barista_cafe.zip > /dev/null
sudo cp -r 2137_barista_cafe/* /var/www/html/
echo "===================================================================="


#Bounce service
echo "===================================================================="
echo "Restarting service"
sudo systemctl restart httpd
echo "===================================================================="


#Clean Up
echo "===================================================================="
echo "Cleaning all temporary files"
rm -rf /tmp/webfiles
echo "===================================================================="


#Print system status
echo "===================================================================="
echo "Status of the Service is:"
sudo systemctl status httpd
echo "===================================================================="

#Print the contents of /var/www/html
echo "===================================================================="
echo "The contents of html directory are"
ls /var/www/html/
echo "===================================================================="
