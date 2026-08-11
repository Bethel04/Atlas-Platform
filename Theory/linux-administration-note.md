# LESSON 1                                WEEK 2. LINUX ADMINISTRATION ESSENTIAL

KEY TOPICS
1. Users and Groups
2. File ownership and permissions(advanced)
3. processes
4. service with systemd
5. package management
6. system logs
 

## USERS AND GROUPS

### USERS

WHY ARE USERS IMPORTANT?
imagine a company has one linux server used by:
1. Alice(Developer)
2. Bethel (system administrator)
3. Goodnews (devops engineer)
4. David (security engineer)

If everyone logged in as root, it would be dangerous, difficult to track who made changes, a security risk
Instead, linux gives each person their own user account.

## WHAT IS A USER?
A user is an account that allows a person or service to log in and use linux.
examples; root, www-data(used by web servers)
Three types of users.

TPES                 EXAMPLE                 What They do
Real human            Student,john              You login and use the pc
system                www-data,postgres          Runs programs in the background. no login
super user             root                     can do anything. god mode. needs sudo

Every user has; A username, A unique user id(UID), A home directory, A default shell

## WHAT IS A GROUP?
A group is a collection on users.
instead of giving permissions to users one by one, linux lets you assign permissions to a group
exampl; Developers
          |--ALICE
          |--BETHEL
          |--GOODNEWS
You can now grant the entire Developers group access to a project directory.

## WHY DO WE USE GROUPS?
Groups make administration easier. for example; everyone in the developers group can edit application files.
everyone in the sudo group can run administrative commands. everyone in the docker group can use Docker without sudo

## TYPES OF USERS 
1. ROOT USER
 The most powerful account.
can do anything
UID = 0

2. REGULAR USER
 This is the account you normally use, example; hp user
Regular users have limited permissions.

3. SYSTEM USERS 
This are created for services and applications. example; www-data, mysql, nobody
they usually cannot log in interactively.

IMPORTANT COMMANDS
COMMAND                 PURPOSE
whoami                  show the current user
id                      show the user's UID, GID,and groups
groups                  show the groups the current user belongs to
who                     show users user currently logged in 
users                   show usernames currently logged in

## SUMMARY
## EVIDENCE


## WEEK 2 LESSON 2                    FILE OWNERSHIP AND PERMISSIONS

This is one of the most important topics in Linux. if you understand permissions well, you will aviod many common peoblems 
as a Devops engineer.

# WHAT IS FILE OWNERSHIP
In linux every file and folder has an owner. just like every notebook has a name written on it. 
when you create a file; touch report.txt, linux automatically makes you the owner.
you can check it out with is -l.
 example output
-rw-rw-r-- 1 hp hp 0 Aug 4 14:00 report.txt

let's break it down 
-rw-rw-r-- 1 hp hp 0 Aug 4 14:00 report.txt
             |   |
         Owner  Group
The first Hp is the user who owns the file.
second hp is the group that owns the file


# THE THREE PERMISSION CLASSES
Linux divides permission into three categories; Owner   Group   Others
                                                rwx     rwx      rwx
Owners the person who created or owns the file.
Group users in the same group.
Others everyone else.

# THE THREE PERMISSION TYPES
There are only three basic permission;
SYMBOL      MEANING           WHAT IS ALLOWS 
 r           Read                view the file
 w            Write              Modify the file
 x            execute           Run the file as a program or enter a directory

# UNDERSTANDING PERMISSION
-rwxr-xr--
break it down;
- rwx r-x r--
  |    |   |
  |    |   |--Others
  |    |-----Group
  |----------owner

This means:
Owner; Read, write, Execute
Group; Read,  Execute
Others; Read only

## summary
## evidence

# WEEK 2  LESSON 3                       CHANGING FILE PERMISSIONS(CHMOD)
WHAT IS chmod?
chmod stands for change mode.
it is used to change the permissions of a file or directory.
Syntax; chmod (permissions) filename

#TWO WAYS TO USE CHANGE MODE(CHMOD)
SYMBOLIC MODE (LETTERS)
USES; U=USER(OWNER), g= Group, o=Others a=All
and: + = add permission, - = remove permission == set exact permission
EXAMPLES
GIVE THE OWNER EXECUTE PERMISSION:
chmod u+x 
REMOVE PERMISSION FROM THE GROUP
chmod g-w
GIVE EVERYONE READ PERMISSION
chmod a+r 

NUMERICA(OCTAL) MODE
This method is often used.
Each permission has a value;
permission     value
Read(r)         4
Write (w)       2
Execute (x)     1

Add them togetther

permission             number
rwx                      7
rw-                      6
r-x                      5
r--                      4
---                      0

example
chmod 755 means; Owner  Group   Others
                  7       5       5
                rwx      r-x     r-x
Another example; chmod 644
Owner  Group   Others
6        4        4
rw-     r--       r--

WHY IS 755 SO COMMON?
most linux uses directories use;
755
because: The owner can read, write, and execute.
everyone else can read and enter the directory but cannot modify it.

# N/B
YOU WILL USE chmod FREQUENTLY, ESPECIALLY WHEN;MAKING BASH SCRIPTS EXECUTABLE;
chmod +x fill.txt
FIXING ISSUES,
PREPARING APPLICATION FILES AND DIRECTORIES FOR DEPLOYMENT


## WEEK 2 LESSON 4                   CHANGING FILE OWNERSHIP(chown)
What is chown? 
chown stands for change owner. it changes who owns a file or directory. unlike chmod, which changes permissions,
chown changes the owner.
SYNTAX;
sudo chown owner filename
EXAMPLE;
sudo chown hp note.txt
this changes the owner of the note.txt to hp

# CHANGING BOTH OWNER AND GROUP
You can also change the owner and the group at the same time.
SYNTAX:
sudo chown owner:group filename
EXAMPLE:
sudo chown hp:hp note.txt

# WHEN DO WE USE chown?
As a Devops engineer, you will use chown when: deploying web applications.
fixing permission issues. Giving service (like nginx) ownership of files.
preparing project directories for teams.

for example, -R www-data:www-data /var/www/html

HERE:
-R means recursive (apply to all files and subdirectories).
www-data is the user and group that nginx/apache commonly use.

# CHECK OWNERSHIP 
Before changing ownership, view it: is -l note.txt
you will see something like;
-rwxr-xr-x 1 hp hp 0 Aug 15:30 note.txt
The two hp values means 
First hp=Owner
second hp=Group

# N/B
chown REQUIRES ANOTHER USER TO DEMONSTRATE PROPERLY. IF YOU HAVE ALREADY CREATED ANOTHER USER(SUCH AS HP)IN YOUR EARLIER LABS, 
USE THAT USER, IF NOT,  CREATE ONE LATER.

COMMAND                    PURPOSE
 chmod                   changes permissions(READ,WRITE,EXECUTE)
chown                    changes the owner(user and /group)

A simple way to remember them is:
chmod= What can this user do
chown= who owns this file?

it is easy to confuse these two commands.

#SUMMARY
#EVIDENCE 

## WEEK 2 LESSON 5                         PROCESSES
WHAT IS A PROCESS?
A process is a program that is currently running.for example: when you open firefox, Linux create a firefox process.
When you run top, Linux creates a top process. When you start Nginx, linux creates an Nginx process.

# PROGRAM                                 VS               PROCESS
A program is a file stored on the disk                A process is a program that is currently running in memory.

EXAMPLE: FIREFOX INSTALLED ON YOUR COMPUTER=PROGRAM
FIREFOX OPENED AND RUNNING = PROCESS

## WHAT IS A PID?
Every process has a unique number called a PID(process ID)
Think of it like a student's matriculation number:
EXAMPLE:
PID 1250 FIREFOX
PID 2012 BASH
PID 3501 NGINX
Linux uses the PID to identify and manage processes.

### VIEWING RUNNING PROCESSES
1. ps 
This shows the running processes running in your current terminal session.

2. ps aux
This displays all running processes on the system. you will see colums like USER, PID, CPU, MEMORY, COMMAND

3. top 
top shows live information about: the CPU Usage. Memory Usuage. Running processes
TO exit top, press q

4. htop 
htop is a more user-friendly version of top. if it is not installed,install it using
sudo apt update
sudo apt install htop
run it: htop 
exit by pressing f10 or q

### STOPPING PROCESSES
Sometimes a process freezes or uses too much CPU.
Linux lets you stop it.

USING kill
 Systax: kill PID
EXAMPLE: kill 2456
This tell process 2456 to stop.

Using kill -9
sometimes a process refuses to stop.
force it:
kill -9 PID
be careful this forces the process to terminate immediately.

# USING killall
instead of using a PID, you can stop a process by its name.
example:killall firefox 
This stops every running firefox process.

# N/B 
When a service such as nginx,Docker, or MYSQL is not working, one of the first things a Linux administrator checks is 
Whether its process is running. knowing how to inspect and manage processes. processes is a core troubleshooting skill.

# SUMMARY
# EVIDENCE



## WEEK 2 LESSON 6                              SERVICES AND SYSTEMD

Every Linux server runs services in the background. As a Devops engineer, you will constantly manage them.
EXAMPLES OF SERVICES;
SSH(ssh), NGINX(nginx), Docker(docker), MYSQL(mysql).
These services can start automatically when the server boots continue running in the background.

WHAT IS SYSTEMD?
systemd is the service manager used by most modern linux distributions.
Think of it as the manager of all backgroud services. its reponsibilities includes:
1. starting services 
2. stoping services
3. restarting services
4. enabling services to start at boot
5. checking service status


# WHAT IS SYSTEMCTL?
systemctl is the command you use to communicate with systemd. think of it like this; 
YOU 
  |
SYSTEMCTL
  |
SYSTEMD
  |
LINUX SERVICES

# IMPORTANT systemctl COMMANDS

CHECK THE STATUS OF A SERVICE 
SUDO SYTEMCTL STATUS SSH 
THIS TELLS YOU; is the service running?, is it stopped?, it is enabled?, are there any recent log messages?

# START A SERVICE
sudo systemctl start ssh
start the service if it isn't running.

# STOP A SERVICE
sudo systemctl stop ssh
stops the service.

# RESTART A SERVICE.
Common after changing a configuration file.

# RELOAD A SERVICE 
sudo systemctl reload ssh
Reloads configuration without completely stoping the service (only works foe services that support it).

# ENABLE A SERVICE
sudo systemctl enable ssh
start the service automatically every time the computer boots.

# DISABLE A SERVICE 
sudo  systemctle disable ssh 
prevent the service from starting automatically at boot.

# LIST RUNNING SERVICES
systemctl list-units
This shows all services currently running on your system.

# CHECK IF SSH IS ENABLED
sudo systemctl is-enabled ssh

# N/B 
IMAGINE YOUR WEBSITE SUDDENLY STOPS WORKING. ONE OF THE FIRST THINGS A LINUX ADMINISTARTOR DOES IS CHECK WHETHER
THE WEB SERVER IS STILL RUNNING.
sudo systemctl status nginx
if it's stopped, you can start it
sudo systemctl start nginx
then verify it's running again
sudo systemctl status nginx 
this simple workflow you will repeatedly use


## WEEK 2 LESSON 7                    PACKAGE MANAGEMENT(apt)
WHAT IS A PACKAGE?
A package is software that can be installed on your linux system. EXAMPLE; NGINX, GIT, DOCKER,VIM.CURL
Ubuntu uses the APT(Advanced Package Tool) package manager to install and manage software.

# IMPORTANT apt COMMANDS
1. update the package list
sudo apt update 
What it does; Downloads the latest list of available software from the configured repositories.
It does not install or upgrade anything.

THINK OF IT AS REFRESHING THE SOFTWARE CATALOG.

2. upgrade installed packages 
  sudo apt upgrade
What it does;
installs newer versions of packages that are already installed.

3. install a package
example;
sudo apt install tree
this install the tree program.

4. Remove a package
 sudo apt remove tree 
this removes the program but may leave behind configuration files.

5. remove a package completely
sudo apt purge tree
This removes both the program and its configuration files.

6. Remove unused packages 
sudo apt autoremove
this cleans up packages that are no longer needed.

7. verify it's installed 
tree --version

8. Display the help page
tree --help

# SUMMARY
# EVIDENCE




# WEEK 2 LESSON 8                       SYSTEM LOGS
WHAT ARE LOGS? 
A log is a record of events that happen on your linux system. log help us answer questions like;
why did a service fail?
who logged into the system?
what errors occurred? 
when did something happen?

## VIEWIMG LOGS WITH journalctl
view all system logs 
journalctl 
use; up/down arrow to scroll.
press q to quit.

## VIEWING LOGS FOR SSH SERVICE 
journalctl -u ssh
this shows only SSH-related logs.

## VIEWING THE MOST RECCENT LOG ENTRIES
journalctl -n 20
shows the last 20 log entries.

## WATCH LOGS IN REAL TIME
journalctl -f
this work like tail -f and updates as new log entries are written.
press CTRL + C to stop watching.

## LOG FILES IN /var/log
list the log directory;
ls /var/log

you will see files and directories such as;
syslog
auth.log
dkpg.log
kern.log

view a log file;
less /var/log/syslog
(some sytems may use journalctl instead of storing everything in syslog

