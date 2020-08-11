#!/bin/bash


# Scp moves the file into the virtual machine. Sinking OS to app folder in VM
scp -i ~/.ssh/DevOpsStudents.pem -r ~/Documents/aws/app/ ubuntu@54.195.150.99:/home/ubuntu/
# Syncing provision folder to vm
scp -i ~/.ssh/DevOpsStudents.pem -r ~/Documents/aws/environment/app/provision.sh ubuntu@54.195.150.99:/home/ubuntu/

# Secure tunnel into the virtual machine on the EC2 instance
ssh -i ~/.ssh/DevOpsStudents.pem ubuntu@54.195.150.99 -i $ ./provision.sh
