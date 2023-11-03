#!/bin/bash

# Provide default values for variables
Username="tetra"
Password="password"
SourceFile="encrypted_backup.json"
DestinationPath="/home/tetra/backup.json"

# Accept IP address as a command line argument
ip="$1"

# Check if IP address is provided
if [ -z "$ip" ]; then
    echo "Please provide an IP address as an argument."
    exit 1
fi

readIV="sudo docker exec edgeAgent cat /tmp/edgeAgent/IOTEDGE_BACKUP_IV"
fileDeleteCommand="rm /home/tetra/backup.json"
fileCopyCommand="cp /home/tetra/api/encrypted_backup.json /home/tetra/backup.json"
dockerCopyCommand="sudo docker cp /home/tetra/backup.json edgeAgent:/tmp/edgeAgent/backup.json"
replaceCommand="../replace.sh"
# Execute script
# Execute Python script

echo "Read IV command: $readIV"
$readIV > /home/tetra/api/iv.txt
echo "Python command: python main.py $ip e"
python3 main.py "$ip" e
echo "File delete command: $fileDeleteCommand"
$fileDeleteCommand
echo "File copy command: $fileCopyCommand"
$fileCopyCommand
echo "SCP command: $dockerCopyCommand"
$dockerCopyCommand
echo "Replace command: $replaceCommand"
$replaceCommand

echo "Exit command: exit"
exit