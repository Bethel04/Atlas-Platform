# Week 1 Practical Labs 

## Lab 4; Reading and searching File contents

### objective 
this is  how to create file content, view file contents, search for text, and locate files in linux.

### commands used

echo "linux is an operating system." > note.txt
echo "ubuntu is a linux distribution" > note.txt
echo "devops engineers use linux everyday" > note.txt
cat note.txt
less note.txt
head note.txt
tail note.txt
grep linux note.txt
grep ubuntu note.txt
grep devops note.txt
find ~ -name note.txt

### summary
used "echo" to write text into a file
learned that '>' overtwrite a file while '>>' appends txt.
used 'cat' to display the entire file.
used 'less' to view file contents interactively.
used 'head' to display the beginning of a file.
used 'tail' to display the end of a file.
used 'find' to locate a file by name.
used 'grep' to search for specific text.

### Evidence
screenshot: 

## Lab 5; SSH BASICS 

### OBJECTIVE
How i installed my SSH on my vm, How i enable,start,test the ssh service on my ubuntu
1. i installed my SSH  using the command; sudo apt update(this command update my ubuntu repositiory)
after my repositiory is done downloading i runned another command sudo apt install OpenSSH.

2. i used sudo systemctl   to start, stop, enable, or check the status of my ssh.

after that 

3. i make sure the device i want to connect to  also runs SSH.

4. i get the ip address of that device and also the username ( to get the ip address we simply use ip a or ifconfig)

5. we can connect simply typing in the terminal ssh username@ip-address

6. enter password of the server you want to ssh to and then successfully connect to the local machine using ssh.


 
