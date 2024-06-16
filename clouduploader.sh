#!/bin/bash

source=$1

# Function to check if the file/directory to be uploaded is not available
checkSource (){
   #if ! [ -e $source ]; then
      #echo "File/Directory does not exist."
   #fi
   [ -e $source ]
}


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
    --recursive | grep -w "$fileName"
}


# Function to upload the file/directory to the cloud
upload (){
   aws s3 cp $source s3://oladotun-first-bucket/testFolder/
}


# Main Code

checkSource

if [ $? -ne 0 ];then
   echo "$source does not exist. Please check the path to make sure it's a correct path."
   exit 1
fi

echo "Please wait, checking the cloud to see if a file/folder like this already exists...\n"
checkDestination

if [ $? -ne 0 ];then
   echo "A file/folder like this already exists. "
   exit 1
fi

