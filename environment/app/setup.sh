#!/bin/bash


# Scp moves the file into the virtual machine. Sinking OS to app folder in VM
scp -i ~/.ssh/DevOpsStudents.pem -r ~/Documents/aws/app/ ubuntu@52.213.242.37:/home/ubuntu/
# Syncing provision folder to vm
scp -i ~/.ssh/DevOpsStudents.pem -r ~/Documents/aws/environment/app/provision.sh ubuntu@52.213.242.37:/home/ubuntu/

# Secure tunnel into the virtual machine on the EC2 instance
ssh -i ~/.ssh/DevOpsStudents.pem ubuntu@52.213.242.37 -i $ ./provision.sh
