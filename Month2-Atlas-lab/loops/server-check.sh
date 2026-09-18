#!/bin/bash

for service in postgresql ssh nginx cron
do
   echo "checking $service"

if systemctl is-active --quiet $service;
then
   echo "$service is running"
else
    echo "$service is not running"
fi

done