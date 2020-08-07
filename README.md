How to sync folders to an ubuntu instance running ion an ec2 instance 

# Creating an instance on AWS 
    Log into AWS 
    
    Navigate to the location and change to Ireland 
    
    Once that is Done navigate to the EC2 Instance and click launch
    
    Choose what Amazon image you want running on the machine 
    
    Then choose an Instance type, how big you want your machine to be
    
    Configure the instance details : Network is DevOps Student: Subnet is default and enable the public IP
    
    Add or remove storage at your discretion
    
    Add tags to your Instance : Name + Value
    
    Configure the Security Group : Needed for operational security 

You have now created an EC2 Instance running Ubuntu 16.04

Now to sync the files from your desktop to the vm 

# Syncing folders
Open up your AWS folder

Navigate to your environment folder 

Create a Provision.sh file 

Enter the modules you need in order to run your application then exit the file

To sync the folders, you will need to create a setup.sh file INSIDE your environment folder

Inside the setup file add the ssh links needed to sync your aws folder to the AWS environment 
    scp -i ~/.ssh/DevOpsStudents.pem -r ~/Documents/aws/app/ ubuntu@'    IP ADDRESS GOES HERE          ':/home/ubuntu/
    
Once this is done exit the file 

Inside the environment folder, run the setup.sh file by using the command
    ./ setup.sh 

This will Call the provision file 