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

This will sync the app folder to the Ubuntu image file, the provision file  and finally it wil call the provision file to run
installing all of Modules needed to run the applications  

# To stop the application


Open GIT BASH as admin and run this command to access the VM
    
    ssh -i ~/.ssh/DevOpsStudents.pem ubuntu@34.254.180.111
    
To stop the application 
    
    cd app
    pm2 stop 0
 
# Making sure it runs on port 8080
 ssh into the VM 
    
    ssh -i ~/.ssh/DevOpsStudents.pem ubuntu@34.254.180.111
    
cd to the upper level, do this twice 

cd into etc 

cd into nginx 

cd into the conf.d

run the command sudo nano nodeapp.conf

add this 
    
    server {
        listen       80;
        server_name  development.local;

        location / {
            proxy_pass http://127.0.0.1:3000/;
        }
       }
cd back to top level 

cd into app 

runt the command 
    
    sudo systemctl restart nginx
    
Then run the command 
    
    pm2 start app.js
    
Go to 
    
    http://34.254.180.111/

It will be running without the : 3000


# Getting Posts to work 

In app provision file put this export here 
    
    echo "export DB_HOST=mongodb://DATABASE IPV4 GOES HERE:27017/posts" >> ~/.bashrc

Add the line to call the bashrc file 

Provision the DBec2 to have mongo running using the command 
    
    sudo systemctl start mongod

You should see a green light that tells you mongo is running 

Make sure your DB EC2 has the port 27017 and set to the security group of the webapp ec2

This is to make sure the servers are aware of each other 

ssh in to your web app 
    
    write env to see if your export command works 

cd into the app folder 

Then 
    
    npm install

The database should now be populated 

run 
    
    node app.js 
if that doesnt work run 
    
    npm test 
if it doesnt work run 
    
    pm2 kill 

then 
    
    pm2 start app.js     
    
Put in your web app ip address, it should be running now 