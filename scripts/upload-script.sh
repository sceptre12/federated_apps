#!/bin/bash

# Check if all required arguments are provided
if [ -z "$1" ]; then
  echo "Error: Container name is not provided."
  echo "Usage: $0 <container_name> <storage_account_name> <dest_path>"
  exit 1
fi

if [ -z "$2" ]; then
  echo "Error: Storage account name is not provided."
  echo "Usage: $0 <container_name> <storage_account_name> <dest_path>"
  exit 1
fi

if [ -z "$3" ]; then
  echo "Error: File path is not provided."
  echo "Usage: $0 <container_name> <storage_account_name> <dest_path>"
  exit 1
fi

if [ -z "$4" ]; then
  echo "Error: Dest path is not provided."
  echo "Usage: $0 <container_name> <storage_account_name> <file_path> <dest_path>"
  exit 1
fi

# Assign arguments to variables
CONTAINER_NAME=$1
STORAGE_ACCOUNT_NAME=$2
FILE_PATH=$3
DESTINATION_PATH=$4

# Execute the az storage blob upload-batch command
az storage blob upload-batch -d $CONTAINER_NAME -s $FILE_PATH --destination-path $DESTINATION_PATH --account-name $STORAGE_ACCOUNT_NAME --overwrite true

# Check if the command was successful
if [ $? -eq 0 ]; then
  echo "Files successfully uploaded to $CONTAINER_NAME in storage account $STORAGE_ACCOUNT_NAME."
else
  echo "Error: Failed to upload files."
  exit 1
fi