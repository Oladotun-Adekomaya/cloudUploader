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


getFileNameFromSourcePath (){
   IFS="/"
   read -ra sourcePathArr <<< "$source"
   local arrLength=${#sourcePathArr[@]}
   local n=$(($arrLength-1))
   local fileName=${sourcePathArr[$n]}
   echo $fileName

}



# Function to check if the file/directory to be uploaded to the cloud already exists
checkDestination (){
    local fileName=$(getFileNameFromSourcePath)
    aws s3 ls s3://oladotun-first-bucket/testFolder/ \
    --recursive | grep -w $fileName
}

getFileNameFromSourcePath
checkDestination
if 

