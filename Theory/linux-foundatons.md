# ATLAS FOUNDATION

This document consolidate my learning basics,linux administration, and networking fundamentals. it serves as a quick reference
for my Atlas Project.

## 1.Linux basics
## 2.Linux Administration
## 3.Networking fundamentals
## 4.Frequently used commands

## 1. linux basics.
### WHAT IS LINUX?
Linux is a Kernel. (os) that manages a compute's hardware and software resources, and provides a platform for program
to run. Linux originally refers to the kernel(the core part of the os) whlie systems like ubuntu or debain are the complete 
operating system built around the linux kernel. 

# HARDWARE= 
WHAT WE CAN SEE AND TOUCH SUCH AS THE KEYBOARD,CPU,RAM,DISK,ETC

# APPLICATIONS=
 THEY ARE SOFTWARES THAT  RUNS IN THE COMPUTER SOME RUN IN THE BACKGROUD WHILE OTHERS ARE VISIBLE SUCH AS
(VISIBLE SOFTWARE ARE CHROME,VS CODE, FIREFOX ETC) BACKGROUND SOFTWARE ARE (NGINX,GIT,SYSTEMD SERVICES ETC)

# OPERATING SYSTEM(LINUX)= 
THE MANAGER THAT COORDINATE EVERYTHING.

### A. WHY DO DEV0PS ENGINEERS USE LINUX?
MOST SERVERS ON THE INTERNET RUN LINUX BECAUSE IT IS: OPEN SOURCE,STABLE,FAST,RELIABLE,HIGHLY CUSTOMIZABLE.
EXCELLENT FOR AUTOMATION AND SCRIPTING.
SUCH AS CLOUD SERVER LIKE (AWS,AZURE,GOOGLE CLOUD,DIGITAL OCEAN,ETC.)

# B.WHAT IS THE LINUX KERNEL?
 The kernel is the core of linux, it act as a bridge between (THE HARDWARE AND THE SOFTWARE)FOR EXAMPLE YOU TYPE THE
COMMAND:(ls) THE SHELL RECEIVES YOUR COMMAND, THE KERNEL COMMUNICATES WITH THE DISK TO READ THE 
DIRECTORY, AND THE RESULTS ARE DISPLAYED ON THE SCREEN.SO WE CAB SAY;
# THE KERNEL MANAGES COMMUNICATION BETWEEN SOFTWARE AND HARDWARE.IS ALSO MANAGES;THE CPU USAGE,MEMORY(RAM)
STORAGE, DEVICES(KEYBOARD,MOUSE,DISKS) PROCESSES.

# C. WHAT IS A SHELL?
THE SHELL IS A PROGRAM THAT LETS YOU INTERACT WITH LINUX BY TYPING COMMANDS.WITHOUT THE SHELL YOU WOULDN'T BE ABLE TO RUN
COMMANDS LIKE: ls,pwd,cd,mkdir.THE SHELL READS YOUR COMMANDS AND PASSES THEM TO THE KERNEL.

# D.WHAT IS A BASH?
BASH STANDS FOR: BOURNE AGAIN SHELL. IT IS THE MOST COMMON SHELL ON LINUX SYSTEMS. BASH ALLOWS YOU TO, RUN COMMANDS
WRITE BASH SCRIPTS AND AUTOMATE REPETIVE TASKS

# E.TERMINAL VS SHELL
TERMINAL IS THE APPLICATION (WINDOWS) YOU OPEN TO TYPE IN YOU COMMNADS.EXAMPLE(GNOME TERMINAL,WINDOWS TERMINAL,XTERM)
SHELL IS THE PROGRAM RUNNING INSIDE THE TERMINAL. THINK OF IT LIKE YOUR PHONE=TERMINAL. SHELL=THE PHONE APP I'M USING.

# F. LINUX FILESYSTEM
A FILESYSTEM IS BASICALLY HOW YOUR COMPUTER ORGANIZES,STORES,AND FINDS FILES AND FOLDERS ON A STORAGE DEVICE.
LINUX ORGANZES FILES IN A SINGLE TREE THAT STARTS AT THE ROOT DIRECTORY;( / )
IMPORTANT DIRECTORIES INCLUDE;
/HOME == USER HOME DIRECTORIES.
/ETC == CONFIGURATION FILES.
/VAR == LOGS AND VARIABLE DATA.
/BIN == ESSENTIAL USER COMMAND.
/USER == INSTALLED PROGRAMS AND SHARED RESOURCES.
/TMP == TEMPORARY FILES.
/OPT == OPTIONAL THIRD-PARTY SOFTWARE.

# G.PATHS 
PATHS IS THE ADDRESSES THAT TELL YOUR COMPUTER WHERE FILE LIVES. THINK OF IT LIKE A CITY. FILE/FOLDER= A HOUSE
PATH= THE FULL ADDRESS TO FIND THAT HOUSE
WE HAVE TWO TYPES OF PATHS 

#1. ABSOULUTE PATH
THIS IS THE FULL ADDRESS, STARTING FROM THE VERY TOP/ROOT( / ). WORKS FROM ANYWHERE,NO MATTER WHERE YOU ARE THIS PATH ALWAYS
POINT TO THE SAME LOCATION. EXAMPLE; /HOME/STUDENT/DOCUMENTS.

#2.RELATIVE PATH
THE ADDRESS RELATIVE TO "WHERE YOU ARE RIGHT NOW"IN THE TERMINAL.EXAMPLE; DOCUMENT OR ../DOWNLOADS ITS MEANING DEPENDS ON WHERE
YOU CURRENTLY ARE.

## H.LINUX DISTRIBUTIONS (DISTROS)
linux is a complete operating system built around the linux kernel. it includes the kernel.package manager,system utilities,
libraries,and applications. example; ubuntu,debian, fedora,rocky linu,Arch linux

# I.LINUX CLI(COMMAND LINE INTERFACE)
The command line interface(CLI)is how you talk to your computer by typing text commands instead of using a graphical interface
(GUI) that's clicking buttons.
Devops engineers mainly work through the CLI because it is faster, consumes fewer resources, and is ideal for automation.

# J. GUI VS CLI
GUI stands for Graphical User Interface.it allows you to interact with the computer using;
windows,icons,menus,buttons,mouse.example are; ubuntu desktop, windows11,macos.when you click on the files application or open 
firefox with your mouse, your are using the GUI.

#WHAT IS CLI
CLI stands for command line interface.instead of clicking your mouse, you type commands into a terminal.
example are ls, pwd, cd Downloads, mkdir project.

### GUI VS CLI COMPARISON
GUI                              CLI
Uses a mouse                     Uses keyboard commands
Easy for beginners                Requires learning commands
slower for repetitive tasks      Faster for repetitive tasks
Uses more RAM and CPU             Uses fewer system resources
Good for desktop users             preferred by system administration and devops engineers

### WHY DO DEVOPS ENGINEERS PREFER THE CLI?
DevOps engineers prefer the CLI because it is faster, consumes fewer system resources, supports automation through scripting,
and is the primary way to manage remote linux servers.
most cloud servers do not have a desktop environmnet. they only provide terminal access over SSH.
for example,if you launch an ubuntu server on AWS,you will usually connect like this:
SSH USERNAME@SERVER-IP
Once connected,you manage the server using the CLI.
The CLI is preferred because it: is faster, uses fewer resources, is easy to automate with scripts,works well on remote servers
 
### The Linux Boot Process 
everytime you press the power button on a linux computer or server, serveral things happen before you see the login screen or
terminal.
Understanding this process is important because if a linux server fails to boot, a DevOps engineer needs to know where the 
failure occurred. 

### STEP 1; POWER ON
You press the power button.
The CPU wakes up and starts looking for instructions stored in the motherboard firmware.

### STEP2; BIOS OR UEFI
The firmware is either;BIOS(Older systems) UEFI(modern systems)its job is to:
check that the hardware is working(RAM,CPU,KEYBOARD, STORAGE,ETC.)This is called the Power-on self-Test(POST).
find a bootable storage device(SSD,HDD,USB).
Think of BIOS/UEFI as the manager that checks whether everything is ready before linux starts.

### STEP3; BOOTLOADER(GRUB)
After BIOS/UEFI finishes, it loads the bootloader. on most linux systems, the bootloader is GRUB(Grand Unified Bootloader).
GRUB(Grand Unified Bootloader). GRUB'S responsibilities are: find the linux kernel. load the kernel into memory.
Allow you to choose which operating system to boot if multiple operating systems are installed.

### STEP4; LINUX KERNEL
The kernel is loaded into memory.
mow it starts;
Managing the cpu.
Managing memory(RAM).
Detecting hardware.
Loading device drivers.
Mounting the root filesystem.
At this point,linux is biginning to take control of the computer.

### STEP5; SYSTEMD
Once the kernel is ready,it starts the first user-space process call SYSTEMD. this is very important concept.
SYSTEMD; starts system services. starts networking. starts logging. starts SSH. starts nginx, docker, databases,and many other
services if they are enabled.IN ubuntu, systemd has PID 1, which means it is the first process started by the kernel.
it uses commands like systemctl start nginx or systemctl start status ssh ( systemctl is a command use for systemd to start,
stop,enable,restart services or web servers).

### STEP6; LOGIN
After all the required services are running, linux present;A graphical login screen(GUI), OR A TERMINAL login prompt(CLI).
you enter your username and password, and the system is ready to use.

### WHY SHOULD A DEVOPS ENGINEER CARE?
Imagine a production server won't boot. we need to know: Did BIOS detect the disk?.Did GRUB load the kernel?
Did the kernel panic?.Did systemd fail to start networking?.Did SSH fail to start? 
knowing the boot process helps you identify where the problem occurred.

## TOPIC 3; The PATH Environmet varible 

### WHAT IS AN ENVIRONMENT VARIBLE?
An environment variable is a named piece of information that your computer stores and gives to every program you run,
think of it like a note that linux keeps in memory. example includes; HOME. USER.SHELL.PATH
you can see them by running printenv or env in your terminal.

### WHAT IS THE PATH VARIABLE?
The PATH variable tells Linux where to look for excutable programs(commands).imagine you tell your friend to "go and buy bread"
If you don't tell them which shop to visit, they won't know where to go. linux has the same problem. when you type;(ls),
linux has to find the(ls) program somewhere on the system.it checks the directories listed in the PATH variable until it
finds it.

### HOW CAN YOU SEE YOUR PATH?
RUN echo $PATH you will see something like; /user/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
each directory is separated by colon(:).
linux searches them from left to right.

### HOW DOES PATH WORK?
suppose the (ls) program is stored in:/bin/ls, when you type (ls) linux; checks the first directory in PATH. doesn't find (ls).
check te second dirctory.continues until it finds /bin/ls. then execute the command. this is why we do not need to type 
command /bin/ls everytime.

### THE which COMMAND TO FIND WHERE A COMMAND IS LOCATED, WE USE: which is 
exmple output: /bin/ls you can try this as well which nano, which bash,which git

### WHY IS PATH IMPORTANT?
Without PATH, linux woundn't know where to find commands. you would have to type the full path every time, for example
( /bin/is. /user/bin/git. /user/bin/nano. this would be very inconvenient. 

## TOPIC 4; LINUX FILE PERMISSION.

### WHAT IS FILE PERMISSIONS?
File permission determine who can read,write,or execute a file or directory. linux uses permissions to protect files from 
unauthorized access or modification.
think of a permissions as the security rules for files and folders.

### WE HAVE THREE PERMISSION TYPES
linux has three basic permissions:
1. READ(r)
SYMBOL; r this allows user to open a file, read its contents. example; cat file.txt
without read permission, you can not view the file.

2. WRITE(w)
SYMBOL; w this allows user to edit a file, add new content. delete or rename a file (depending on the directory permissions).
 example nano file.txt  without write permission, you cannot save changes.

3. EXECUTE(x)
SYSBOL; x this allows linux to run a file as a program or script. example ./note.sh without execute permission, linux won't
run the script

### WHO DO PERMISSION APPLY TO?
Every file has permission for three groups; 
USER(u); the owner of the file.
GROUP(g); users who belong to the file's group.
OTHER(o); Everyone else on the system.

### READING PERMISSIONS 
run the command ls -l,  an output:-rwxr-xr--, let us break it down: - rwx r-x r--
part       meaning
-           regular file(d would mean a directory)
rwx          owner permissions
r-x             group permissions
r--            other permissions

### NUMERIC PERMISSIONS
NUMBERS          MEANING
4                  THE PERMISSION FOR ONLY READ(r)
2                  THE PERMISSION FOR ONLY WRITE(w)
1                  THE PERMISSION FOR ONLY EXECUTE(X)
0                   FOR NO PERMISSION 
 
For owner to have full access you have to add all permission example 4(r) + 2(w) + 1(x) sum the total =7 that is owner have 
full access, same with if ypu want the group to reand and only execute we do the same 4(r) + 1(x) sum the total =5
the group can only read and execute but can not write 

### WHY ARE PERMISSION IMPORTANT?
Imagine a web server. you don't want everyone to: edit your website, delete configuration files,or run dangerous scripts.
permission hel secure the file system.

### COMMON PERMISSION COMMANDS; 
VIEWING PERMISSION; ls -l
CHANGE PERMISSION; chmod 755 file.txt
CHANGE OWNER; chown USER FILE.TXT
CHANGE GROUP; chgrp developers file.txt

chmod a+r filename.txt
a=all =user+group+others
+r= add read 
To make everyone read-only, no write/execute;
chmod a=r filename.txt
this sets is to r--r--r--
To make everyone read+execute, but no write 
chmod a+rw file.txt
To give permission to only owmer we use chmod u+r filename.txt
that is the write command for the owner
to remove write from owner we use chmod u-w file.txt
set exact permissions for owner only, leave others alone; chmod u=rwx filename.txt

### HIDDEN FILES 
Files beginning with a dot(.) are hidden. example .bashrc, .gitignore etc, to view them ls -la this files are often seen in
linux and in git

### WILDCARDS
these save a lot of time, example *.text means all .txt file. rm *.log removes all .log files.

### FILE REDIRECTION 
one of the most important linux skills. example. >, >> , < . example echo "hello">file.txt this create or overwrite a file
echo "world" >> file.txt append to the file meaning add to the end without deleting what is already in the folder,keep the
old stuff and write new stuff at the bottom

### PIPES(|) 
EXAMPLE cat file.txt | grep linux. A pipe sends the output of one command as the input to another command.
it very important.

### COMMAND HISTORY 
COMMNADS; history or !! OR !25, this make working in terminal much faster

### BASIC HELP COMMANDS
Every linux user should know; manuel for man example man ls. this shoow what the command ls is used for
another one ls --help

### 7 FILES AND DIRECTORIES 

## WHAT IS FILE?
A file is a collection of data stored on a computer.
a file contain; text (e.g. nots.txt), images (e.g, photo.png) music (e.g, song.mp3), videos (e.g movie.mp4)
programs and scripts (e.g, backup.sh). think of a file as a sheet of paper in a filing cabinet. the paper contains information.

## WHAT IS A DIRECTORY?
A directory (also called a FOLDER) is a container used to organize files and other directories.
for example /home/student
             |---DOCUMENTS
             |---DOWNLOADS
             |---PICTURES
             |---PROJECTS
here 
Documents is a directory
Downloads is a directory
pictures is a directory
projects is a directory

Directories help keep your file organized. 

### THE CURRENT WORKING DIRECTORY
Whenever you open a terminal, you are inside a directory. linux calls this your current working directory(CWD)
To see where you are, use(pwd)
FOR EXAMPLE; /home/student
pwd stands for PRINT WORKING DIRECTORY

### LISTING FILES AND DIRECTORIES
USES;(ls); THIS list the files and directories in your current location. example; Documents  Downloads  Pictures

### USEFUL (ls) OPTIONS 
ls -l; shows detailed information.
you will see; permisions, owner, Group, File size, Date modified, file name

ls -a ; shows all files, including hidden files.
ls -la; shows detailed information for all files, including hidden files.

### CHANGING DIRECTORIES
USE; cd ; example go into Downloads folder; cd Download, 
go back one directory; cd ..
go back to home directory; cd ~
go back to root directory; cd /

### CREATING DIRECTORIES
CREATE A DIRECTORY
mkdir Atlas 
To create multiple directories: mkdir project scripts backups

### REMOVING DIRECTORIES
REMOVE AN EMPTY DIRECTORY;
rmdir test
if the directory contains files, rmdir won't work.

### CREATING A FILE 
CREATE AN EMPTY FILE;
touch note.txt

### COPYING FILES
cp note.txt backup.txt
this creates a copy

### MOVING OR RENAMING FILES 
MOVE A FILE;
mv notes.txt Documents/
Rename a file;
mv notes.txt linux_notes.txt
notice that the same mv command is used for both move and renaming,

### REMOVING FILES
DELETE A FILE 
rm note.txt
Be carefull unlike the recycle bin in the windows, rm permanently deletes files unless you have backups or special recovery 
tools

### DIRECTORY TREE
Imagine your Atlas project;
Atlas/
 |__README.md
 |__linux-foundations.md
 |__infra/
 |     |__legacy/
 |___scripts/
This is called a directory tree because it branches like a tree.

## COMMAND               PURPOSE
     pwd                 show current directory
    ls                  list files and directories
     ls -l                long listing 
    ls -a                 show hidden files
    ls -la                 long listing including hidden files
    cd                     change directory
    mkdir                 create directory
    rmdir                 remove an empty directory
    touch                   create an empty file
    cp                        copy files
    mv                        move or rename files
    rm                      delete files

### WHAT IS SHELL BASICS 
WHAT IS THE SHELL?
The shell is a program that acts as an interpreter between you and the linux kernel.
when you type a command (ls) The shell; READ YOUR COMMAND. CHECKS IF IT IS VAILD. FINDS THE PROGRAM TO EXECUTE (USING THE
PATH VARIABLE). ASKS THE KERNEL TO RUN IT. DISPLAYES THE OUTPUT.
THIMK OF THE SHELL AS A TRANSLATOR.
YOU
 |
SHELL (BASH)
  |
KERNEL
  |
HARDWARE

### WHAT HAPPENS WHEN YOU TYPE A COMMAND?
SUPPOSE YOU TYPE;
pwd
here is what happens;
1. You press enter.
2. Bash reads theb command.
3. Bas looks for pwd.
4. it finds it using the PATH variable.
5. The kernel runs the program. 
6. the current directory is displayed.

### COMMAND SYNTAX
MOST LINUX COMMANDS FOLLOWS THIS PATTERN;
COMMAND (OPTION) (ARGUMENTS)

EXAMPLE; ls -l /home/student
let's break it down;
commands; ls
option; -l
argument; /home/student

Another example; cp file.tx backup.txt
command;cp
arguments file1.txt and backup.txt

### ARGUMENTS
Arguments tell the command what to work on 
example; cat note.txt
here;command=cat
Argument= note.txt
without this argument, cat doesn't know which file to display.

### COMMAND HISTORY 
Linux remembers the commands you have typed. to view the type (history) in your terminal, you can also  pree the (UP ARROW) key
to cycle through provius commands. this saves time bacause you don't have to type the same command again.

### TAB COMPLETION
ONE OF THE BIGGEST TIME-SAVERS.
SUPPOSE YOU HAVE ; Documents, Downloads, Desktop. it you type the command cd Doc and press TAB, Bash completes it to 
cd Documents, this saves time, reduce typing, prevents spelling mistakes.

### CLEAR THE SCREEN
If your terminal gets cluttered; we use the command (clear) on the terminal to clean the screen or simple press ctrl + L
Both clear the terminal screen.

### GET HELP 
Every linux user forget commands sometimes.
use;
man ls ; to read manual. or ls --help for shorter explanation 

# WHY SHELL BASICS MATTER
As a develops engineer, you'll spend a lot of time in the shell 
Managing servers over SSH.
Running Docker and Kubernetes commnads.
Writing Bash scripts.
Monitoring logs.
Automating deployments
A solid uderstanding of the shell makes all of these tasks easier.

### TOPIC 7: SSH BASICS(SECURE SHELL)
If linux is the language of devops, then SSH is the door that lets you access linux servers remotely. every dat, devops
engineers use SSH to connect to servers in the cloud.

### WHAT IS SSH?
SSH STANDS FOR SECURE SHELL.
it is a secure network protocol that allows you to connect to and manage another computer over a network.
for exaqmple, you can sit in Nigeria and securely connect to a ssrver in londown or the united states.
instead of being physically in front of the server, SSH let's you control it remotely.

### WHY DO WE NEED SSH?
imagine your company has a web server in a data center. you can not travel every time you need to:
restart nginx,
update software,
deploy a website,
or check logs.
instead you connect to SSH.with SSH, you can 
Manage remote linux servers,
Transfer file securely. 
Run commands remotely.
Deploy applications.
Troubleshoot servers.

### HOW SSH WORKS
Suppose your laptop wants to connect to a server.
YOUR LAPTOP(SSH CLIENT)
       |
    ENCRYTED CONNECTION
       |
linux server (ssh server)
everything sent between then is ENCRYPTED,which means attackers cannot easily read the data.

### SSH CLIENT VS SSH SERVER
SSH CLIENT
The SSH client is the computer initiating the connection.
example; Your ubuntu vm.
Your laptop.
You use the ssh command to connect.
 
SSH Server
The SSH server is the computer accepting the connection. it run a service called OpenSSH Server.
on ubuntu, you install it with;
sudo apt update
sudo apt install OpenSSH-server

to check if it running 
sudo systemctle status ssh

start it 
sudo systemctl start ssh

enable it to start automatically after boot
sudo systemctl enable ssh

### CONNECTING TO A SERVER 

BASIC SYNTAX;
ssh username@IP-ADDRESS

EXAMPLE ; ssh john@192.132.1.20
Here; john is the username 
192.132.1.20 is the server's ip address.

### PASSWORD AUTHENTICATION
The simplest way to log in is with a paaword. example john@192.132.1.20's password:
you enter the password, and if it's correct. you are logged in. this works, but it is not the most secure option.

### SSH KEY AUTHENTICATION
PROFESSIONALS usually usev SSH keys instead of Passwords. AN SSH key pair consists of;
Public Key
this can be shared, it is copied to the server, 
Think of it as a padlock that anyone can have.

PRIVATE KEY
THis must never be shared, it stays on your computer,think of it as the only keey that can open the padlock.
if someone gets your private key, they may be able to access your servers.

### GENERATING SSH KEYS
CREATE A KEY PAIR; (ssh-keygen)linux asks where to save the key. presss enter to accept the default location. after creation,
you will usually have; ~/.ssh/id_rsa   or ~/.ssh/id_rsa.pub
or newer systems; ~/.ssh/id_ed25519  or ~/.ssh/id_ed25519.pub
The file without .pub is the private key.
The file ending with .pub is the public key.

### WHY DISABLE PASSWORD AUTHENTICATION?
Remember your Atlas project?
ONE OF YOUR TASK IS DISABLE PASSWORD-BASED SSH AND USE KET-ONLY AUTHENTICATION
WHY? because; 
password can be guessed or stolen.
SSH keys are much harder to crack.
key-based authentication is the standard practice in DevOps.

### USEFULL SSH COMMANDS 
TO CONNECT TO A SERVER; ssh username@ip-address
GENERATE SSH KEYS; ssh-keygen
CHECK THE SSH SERVICE; sudo systemctl status ssh
START THE SSH SERVICE;sudo systemctl start ssh
ENABLE SSH AT BOOT; sudo systemctl enable ssh

## COMMON SSH PROBLEMS
1. CONNECTION REFUSED
POSSIBLE CAUSES;
ssh servuce is not running.
wrong ip address.
firewall is blocking port 22

2. permission Denied 
possible causes;
wrong username.
wrong password
public key hasn't been added to the server

3. No route to host
possible causes 
Network problem
wrong ip address
server is offline.

## WHY SSH MATTERS IN DEVOPS
Almost every cloud provider gives you an ip address for your server, the first thing you will often do is connect using SSH, 
WHETHER you are using; 
AWS
MICROSOFT AZURE 
GOOGLE CLOUD PLATFORM(GCP)
DIGITALOCEAN

SSH IS ONE OF THE MAIN WAYS YOU WILL MANAGE LINUX SERVERS. 
