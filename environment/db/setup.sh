#!/bin/bash


scp -i ~/.ssh/DevOpsStudents.pem -r ~/Documents/aws/environment/db/ ubuntu@52.19.33.20:/home/ubuntu/
# Scp moves the file into the virtual machine. Sinking OS to app folder in VM
# Syncing provision folder to vm
scp -i ~/.ssh/DevOpsStudents.pem -r ~/Documents/aws/environment/db/provision.sh ubuntu@52.19.33.20:/home/ubuntu/

# Secure tunnel into the virtual machine on the EC2 instance
ssh -i ~/.ssh/DevOpsStudents.pem ubuntu@52.19.33.20 -i $ ./provision.sh
