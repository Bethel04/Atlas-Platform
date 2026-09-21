#!/bin/bash

set -euo pipefail

function_number() {

Number=$1

if [ $(( $Number % 2 )) -eq 0 ];
then
   echo "$Number is even"
else
   echo "$Number is odd"  
fi 
}
function_number 15