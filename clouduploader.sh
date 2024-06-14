#!/bin/bash

source=$1

checkSource (){
   if ! [ -e $1 ]; then
      echo "File/Directory does not exist."
   fi
}

checkDestination (){
    aws s3 ls s3://oladotun-first-bucket \
    --recursive | grep -w "file1.txt"
}

checkDestination $source


