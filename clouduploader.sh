#!/bin/bash

source=$1

# Function to check if the file/directory to be uploaded is not available
checkSource (){
   if ! [ -e $source ]; then
      echo "File/Directory does not exist."
   fi
}

checkSource
# Function to check if the file/directory to be uploaded to the cloud already exists
checkDestination (){
    aws s3 ls s3://oladotun-first-bucket \
    --recursive | grep -w "file1.txt"
}


getFileNameFromSourcePath (){
   IFS="/"
   read -ra sourcePathArr <<< "$source"
   arrLength=${#sourcePathArr[@]}
   n=$(($arrLength-1))
   fileName=${sourcePathArr[$n]}
   echo {$fileName}

}

getFileNameFromSourcePath
