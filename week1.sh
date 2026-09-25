#!/bin/bash
set -euo pipefail
 
function_bye() {
  Name=bethel
  Age=25
    echo "my name is $Name"
    echo "i am $Age years old"

  if [[ "$Age" == "25" ]]
  then
    echo "My name is bethel and i am 25 years old"
  else
    echo "my name is bethel and i am not 25 years old"
  fi

  for Age in beans rice
  do 
    echo i like food such as "$Age"
   done
}
function_bye 