#!/bin/bash

source=$1

# Function to check if the file/directory to be uploaded is not available
checkSource (){
   if ! [ -e $1 ]; then
      echo "File/Directory does not exist."
   fi
}

# Function to check if the file/directory to be uploaded to the cloud already exists
checkDestination (){
    aws s3 ls s3://oladotun-first-bucket \
    --recursive | grep -w "file1.txt"
}

checkDestination $source


