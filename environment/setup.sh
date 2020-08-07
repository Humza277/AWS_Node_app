#!/bin/bash



scp -i ~/.ssh/DevOpsStudents.pem -r ~/Documents/aws/app/ ubuntu@54.72.247.231:/home/ubuntu/

scp -i ~/.ssh/DevOpsStudents.pem -r ~/Documents/aws/environment/provision.sh ubuntu@54.72.247.231:/home/ubuntu/

ssh -i ~/.ssh/DevOpsStudents.pem ubuntu@54.72.247.231 -i $ ./provision.sh