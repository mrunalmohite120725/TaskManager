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













(mrunal120725㉿kali)-[~]
└─$ cd downloads
bash: cd: downloads: No such file or directory

┌──(mrunal120725㉿kali)-[~]
└─$ cd download
bash: cd: download: No such file or directory

┌──(mrunal120725㉿kali)-[~]
└─$ cd Download
bash: cd: Download: No such file or directory

┌──(mrunal120725㉿kali)-[~]
└─$ cd Downloads

┌──(mrunal120725㉿kali)-[~/Downloads]
└─$ chmod 400 cloud.pem

┌──(mrunal120725㉿kali)-[~/Downloads]
└─$ ssh -i cloud.pem ubuntu@34.227.48.145
The authenticity of host '34.227.48.145 (34.227.48.145)' can't be established.
ED25519 key fingerprint is: SHA256:IRqUoWiDeYUis90/ieQU6lQvwVTWslVLci5sygWKaRY
This host key is known by the following other names/addresses:
    ~/.ssh/known_hosts:5: [hashed name]
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added '34.227.48.145' (ED25519) to the list of known hosts.
Welcome to Ubuntu 24.04.4 LTS (GNU/Linux 6.17.0-1012-aws x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/pro

 System information as of Fri May 15 00:31:13 UTC 2026

  System load:  0.0               Temperature:           -273.1 C
  Usage of /:   27.3% of 6.71GB   Processes:             110
  Memory usage: 24%               Users logged in:       0
  Swap usage:   0%                IPv4 address for ens5: 172.31.24.108


Expanded Security Maintenance for Applications is not enabled.                                                                                             
                                                                                                                                                           
0 updates can be applied immediately.                                                                                                                      

Enable ESM Apps to receive additional future security updates.
See https://ubuntu.com/esm or run: sudo pro status


The list of available updates is more than a week old.
To check for new updates run: sudo apt update

Last login: Thu May 14 19:00:59 2026 from 18.206.107.29
To run a command as administrator (user "root"), use "sudo <command>".
See "man sudo_root" for details.

ubuntu@ip-172-31-24-108:~$ Read from remote host 34.227.48.145: Connection reset by peer
Connection to 34.227.48.145 closed.
client_loop: send disconnect: Broken pipe

┌──(mrunal120725㉿kali)-[~/Downloads]
└─$ ssh -i cloud.pem ubuntu@34.227.48.145                                                                                                                  
Welcome to Ubuntu 24.04.4 LTS (GNU/Linux 6.17.0-1012-aws x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/pro

 System information as of Fri May 15 00:39:09 UTC 2026

  System load:  0.0               Temperature:           -273.1 C
  Usage of /:   27.3% of 6.71GB   Processes:             111
  Memory usage: 24%               Users logged in:       1
  Swap usage:   0%                IPv4 address for ens5: 172.31.24.108


Expanded Security Maintenance for Applications is not enabled.

0 updates can be applied immediately.

Enable ESM Apps to receive additional future security updates.
See https://ubuntu.com/esm or run: sudo pro status


The list of available updates is more than a week old.
To check for new updates run: sudo apt update

Last login: Fri May 15 00:31:14 2026 from 106.192.112.186
To run a command as administrator (user "root"), use "sudo <command>".
See "man sudo_root" for details.

ubuntu@ip-172-31-24-108:~$ ls
file.txt  file2.txt  file3.txt  file5.txt  sen  sen.pub  sender  sender.pub
ubuntu@ip-172-31-24-108:~$ exit
logout
Connection to 34.227.48.145 closed.

┌──(mrunal120725㉿kali)-[~/Downloads]
└─$ scp -i cloud.pem cloud.pem ubuntu@34.227.48.145 :/home/ubuntu
:/home/ubuntu: No such file or directory

┌──(mrunal120725㉿kali)-[~/Downloads]
└─$ scp -i cloud.pem cloud.pem ubuntu@34.227.48.145:/home/ubuntu                                                                                          
cloud.pem                                                                                                                100% 1678     3.1KB/s   00:00    

┌──(mrunal120725㉿kali)-[~/Downloads]
└─$ ssh -i cloud.pem ubuntu@34.227.48.145                                                                                          
Welcome to Ubuntu 24.04.4 LTS (GNU/Linux 6.17.0-1012-aws x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/pro

 System information as of Fri May 15 00:43:56 UTC 2026

  System load:  0.0               Temperature:           -273.1 C
  Usage of /:   27.3% of 6.71GB   Processes:             113
  Memory usage: 24%               Users logged in:       1
  Swap usage:   0%                IPv4 address for ens5: 172.31.24.108


Expanded Security Maintenance for Applications is not enabled.

0 updates can be applied immediately.

Enable ESM Apps to receive additional future security updates.
See https://ubuntu.com/esm or run: sudo pro status


The list of available updates is more than a week old.
To check for new updates run: sudo apt update

Last login: Fri May 15 00:39:10 2026 from 106.192.112.186
To run a command as administrator (user "root"), use "sudo <command>".
See "man sudo_root" for details.

ubuntu@ip-172-31-24-108:~$ scp -i sample.pem file5.txt ubuntu@98.80.6.113:/home/ubuntu
Warning: Identity file sample.pem not accessible: No such file or directory.
The authenticity of host '98.80.6.113 (98.80.6.113)' can't be established.
ED25519 key fingerprint is SHA256:tQ7RhSNBJFdTpwxN3qBiIS6kmzN6CKqJEpvRQucaDjs.
This key is not known by any other names.
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added '98.80.6.113' (ED25519) to the list of known hosts.
ubuntu@98.80.6.113: Permission denied (publickey).
scp: Connection closed
ubuntu@ip-172-31-24-108:~$ scp -i sample.pem file5.txt ubuntu@98.93.90.124:/home/ubuntu
Warning: Identity file sample.pem not accessible: No such file or directory.
The authenticity of host '98.93.90.124 (98.93.90.124)' can't be established.
ED25519 key fingerprint is SHA256:7leN61wjgBMbCiXbAYGNgnYu/8cCMxFS9BYI1tS/pTQ.
This host key is known by the following other names/addresses:
    ~/.ssh/known_hosts:1: [hashed name]
    ~/.ssh/known_hosts:2: [hashed name]
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added '98.93.90.124' (ED25519) to the list of known hosts.
ubuntu@98.93.90.124: Permission denied (publickey).
scp: Connection closed
ubuntu@ip-172-31-24-108:~$ ssh -i cloud.pem sample.txt ubuntu@98.93.90.124:/home/ubuntu/
ssh: Could not resolve hostname sample.txt: Name or service not known
ubuntu@ip-172-31-24-108:~$ ssh -i cloud.pem file5.txt ubuntu@98.93.90.124:/home/ubuntu/
ssh: Could not resolve hostname file5.txt: Name or service not known
ubuntu@ip-172-31-24-108:~$ ls
cloud.pem  file.txt  file2.txt  file3.txt  file5.txt  sen  sen.pub  sender  sender.pub
ubuntu@ip-172-31-24-108:~$ scp -i cloud.pem file5.txt ubuntu@98.93.90.124:/home/ubuntu/
file5.txt                                                                                                                100%   24    34.8KB/s   00:00    
ubuntu@ip-172-31-24-108:~$ 


























─(mrunal120725㉿kali)-[~]
└─$ ssh -i cloud.pem ubuntu@98.93.90.124
The authenticity of host '98.93.90.124 (98.93.90.124)' can't be established.
ED25519 key fingerprint is: SHA256:7leN61wjgBMbCiXbAYGNgnYu/8cCMxFS9BYI1tS/pTQ
This host key is known by the following other names/addresses:
    ~/.ssh/known_hosts:8: [hashed name]
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added '98.93.90.124' (ED25519) to the list of known hosts.
Welcome to Ubuntu 24.04.4 LTS (GNU/Linux 6.17.0-1012-aws x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/pro

 System information as of Fri May 15 00:47:36 UTC 2026

  System load:  0.0               Temperature:           -273.1 C
  Usage of /:   33.8% of 6.71GB   Processes:             109
  Memory usage: 29%               Users logged in:       0
  Swap usage:   0%                IPv4 address for ens5: 172.31.24.237

 * Ubuntu Pro delivers the most comprehensive open source security and
   compliance features.

   https://ubuntu.com/aws/pro

Expanded Security Maintenance for Applications is not enabled.

3 updates can be applied immediately.
To see these additional updates run: apt list --upgradable

Enable ESM Apps to receive additional future security updates.
See https://ubuntu.com/esm or run: sudo pro status


*** System restart required ***
Last login: Wed May 13 13:08:47 2026 from 223.228.45.220
To run a command as administrator (user "root"), use "sudo <command>".
See "man sudo_root" for details.

ubuntu@ip-172-31-24-237:~$ ls                                                                                                                              
file.txt  file2.txt  file3.txt                                                                                                                             
ubuntu@ip-172-31-24-237:~$ ls                                                                                                                              
file.txt  file2.txt  file3.txt  file5.txt
ubuntu@ip-172-31-24-237:~$ cat file5.txt
hello this is maharudra
ubuntu@ip-172-31-24-237:~$ 

