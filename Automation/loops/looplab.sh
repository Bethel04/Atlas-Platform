#!/bin/bash

for service in nginx postgresql ssh
do
   echo "checking $service"

   if systemctl is-active --quiet "$service";
   then 
      echo "$service is running"
    else
       echo "$service is not running"
    fi

done       