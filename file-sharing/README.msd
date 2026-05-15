Practical 8 — Run Using Your Local Linux Machine
Aim

Securely transfer files between two AWS EC2 instances using your local Linux system.

In this method:

Your Linux PC acts as controller
EC2 instances communicate securely
.pem key is used for authentication
Architecture
Local Linux PC
       |
       | SSH/SCP using PEM
       |
--------------------------------
|                              |
EC2 Instance 1          EC2 Instance 2
(Sender)                 (Receiver)
Step 1 — Launch Two EC2 Instances

Create:

sender-instance
receiver-instance

Configuration:

Setting	Value
AMI	Ubuntu
Type	t2.micro
Key Pair	SAME .pem
Security Group	Allow SSH
Step 2 — Copy Public IPs

Example:

Instance	Public IP
Sender	54.xx.xx.xx
Receiver	18.xx.xx.xx
Step 3 — Place PEM File on Local Linux Machine

Example:

cloud.pem

Move it to your Linux home folder or Downloads.

Step 4 — Open Linux Terminal

Go to PEM location.

Example:

cd Downloads
Step 5 — Give PEM Permission

Run:

chmod 400 cloud.pem
Step 6 — Connect to Sender Instance

Run:

ssh -i cloud.pem ubuntu@SENDER_PUBLIC_IP

Example:

ssh -i cloud.pem ubuntu@54.xx.xx.xx

Type:

yes

if asked.

Step 7 — Create File

Inside sender instance:

nano sample.txt

Write:

Hello from Sender Instance

Save:

CTRL + O
Enter
CTRL + X
Step 8 — Transfer File to Receiver

Run:

scp -i cloud.pem sample.txt ubuntu@RECEIVER_PUBLIC_IP:/home/ubuntu/

Example:

scp -i cloud.pem sample.txt ubuntu@18.xx.xx.xx:/home/ubuntu/

Type:

yes

if asked.

Step 9 — Exit Sender

Run:

exit
Step 10 — Connect Receiver Instance

Run:

ssh -i cloud.pem ubuntu@RECEIVER_PUBLIC_IP
Step 11 — Verify File

Run:

ls

You should see:

sample.txt

Open file:

cat sample.txt

Output:

Hello from Sender Instance
Step 12 — Set Permissions

Run:

chmod 400 sample.txt

Check:

ls -l
