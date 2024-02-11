#! /bin/bash

# DEP="wget unzip http"
TMP="/tmp/webfiles"
URL="https://www.tooplate.com/zip-templates/2093_flight.zip"
ZIP="2093_flight"

yum --help &> /dev/null

if [ $? -eq 0 ]   # $? -> gives the status code of just previously executed command. If it is 0, it was executed correctly, anything else means it's a failure
then
echo "Running in Centos environment"

SVC="httpd"
DEP="wget unzip httpd"

#Install necessary dependencies
echo "======================================================="
echo "Installing dependencies"
echo "======================================================="
sudo yum install $DEP -y &> /dev/null 
echo "======================================================="
echo "Completed installing the dependencies"
echo "======================================================="
echo ""

#Https Service
echo "======================================================="
echo "Starting and enabling dependencies"
echo "======================================================="
sudo systemctl start $SVC
sudo systemctl enable $SVC
echo

#Creating artifactory depolyment
echo "======================================================="
echo "Creating tempory folder and documents"
echo "======================================================="
mkdir -p $TMP
cd $TMP
echo

wget $URL > /dev/null
unzip "$ZIP".zip > /dev/null
sudo cp -r $ZIP/* /var/www/html/

#Bounce service
echo "======================================================="
echo "Restarting service"
sudo systemctl restart $SVC
echo "======================================================="


#Clean Up
rm -rf $TMP
echo

#Print system status
sudo systemctl status $SVC
echo

#Print the contents of /var/www/html
ls /var/www/html/
echo
fi
