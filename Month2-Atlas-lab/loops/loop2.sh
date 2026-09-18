#!/bin/bash

for service in postgresql nginx atlas 
do
  echo checking $service

if systemctl is-active --quiet "$service";

then
  echo "$service is running"
else 
  echo "$service is not running"
fi

done