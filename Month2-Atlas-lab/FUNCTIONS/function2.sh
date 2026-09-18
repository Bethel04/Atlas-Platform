#!/bin/bash

check_service () {
    service="$1"

if systemctl is-active --quiet "$service"
then 
   echo "$service is running"
else
echo "$service is not running"

fi 

}

check_service nginx
check_service postgresql
check_service ssh
check_service apache2