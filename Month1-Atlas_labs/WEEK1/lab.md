## Re-harden the existing Ubuntu VM specifically as the 'Atlas v0.1 host': create adedicated non-root deploy user, configure UFW, disable password-based SSH (key-only).

# WHY WE HARDEN OUR LAPTOP.

the goal is not  to make the machine unhackable. the goal is to reduce attack
surface and limit damage if something goes wrong.

FIRST.
I created a dedicated user for my Atlas.
using the command (**sudo adduser bethel**) ubuntu asked for a password for
my new user and some optional informations. 

adduser or sudo adduser is a command used to create user account, create 
home directory, 

After that i added my dedicated user to the sudo group. because i want my
user to perform authorized administrative tasks. 
using the command **sudo usermod -aG sudo bethel**. the whole command means add
bethel to the sudo group without removing its existing supplementary groups.

N/B
-aG is important because we do not not want to accidentally replace the user's
existing supplementary groups.-aG means append to group membership.

Inconclusion, my deploy user (bethel). was created as a normal user account 
that has authorized access to sudo, allowing it to execute specific commands 
with elevated privileges. example **sudo apt update, upgrade, install apt**.


 #        CONFIGURATION OF UFW
Uncomplicated firewall, provides a simpler commad-line interface for managing
firewall rules, the important 
concepts are: Allow. Deny. Reject. Incoming. Outgoing. Port. Protocol and
Default policy.

Ufw first rule: inspect before changing things blindly.
our first command is (**sudo ufw status verbose**).this checks the status of my
firewall in a more detailed way.
the command output shows if UFW is enable, and what rules are currently 
configured.
Why ufw start as 'inactive'. imagine turn a fire wall with no rules. it will 
block everthing  by default including my ssh, http, etc. i will lock my self 
out of my oen server or laptop. so linux keep ufw as inactive until i set the
rules and tell it what to allow.

ufw rule: 
i set the default policy.(**sudo ufw default deny incoming**).this means 
incoming connections are denied
unless a rule explicitly allows them. then we run (**sudo ufw default allow
outgoing**).this means outgoing connections are allowed by default. then we
allow the port we want to use like port 22 or Openssh. using
the command **sudo ufw allow port 22**
N/B sudo ufw show added: this lets us see the rule that have been added in our
firewall is not active.
now we enable UFW, using the command **sudo ufw enable**. our firewall is set
and active.
we can also disable the firewall using **sudo ufw disable**, this turn ufw off.
my pc/server will accept all traffic again. no rule eill be enforced.
to wipe out everything or to start from scratch, we use **sudo ufw reset**. 
ithis command does two thing it disable ufw and delete all rules i have created 
to a clean state. 
why we use it, when i messed up the rules or locked myself out, or just want to reconfigure everything from zero.
N/B disable turn off my ufw while reset delete the rules and turn off ufw.

#            SSH. disable password-based SSH (key-only).
First we create shh key using (**ssh-keygen**). we will see something like, 
(Enter file in which to save the key) we can skip it
or enter a file to save our ssh key.
AFTer that we create  passphrase for for our key or skip it.
after that we have generate two keys the private and public key. 
private key is what stay on my computer and it meant to be kept secret. and my
public key it what stay on the server. it can be shared.

Installing the public key to a server
we use (**ssh-copy-id the server@ip a**)
on the server we want to remotely connect to. this command copy our public key 
to the sever we want to connect.
password was ask i.e the server password, why? because we want to save the
public key to the server.

after that we connect to the server using the command (**ssh server@ip a**) it
will connect me without asking for password.

Disable password Authentication.
make sure the current ssh session is open.
then i open a second terminal. we will us that to test the new cofiguration.
ssh to the server again(**ssh bethel@ip a**). if that works, we have ssh key 
authentication.
our ssh server config is stored here (/etc/ssh/sshd_config.d).it is advisable we
make a copy of the ssh config file, so that if we make a mistake we till have a 
copy.
we go to the ssh config file to set some things inside the file such at the 
pubkeyAuthentication yes (this allow ssh keys)| passwordAuthentication no 
(disable ssh password) | permiRootlogin no (root cannot directly ssh in)|
kbdinteractiveAuthentication no (this disable keyboard_interactive 
authentication, which can otherwise provide another interactive authentication)
After that we save the config file and run th sudo sshd -t ( this actually text 
the ssh server config fil for errors). if it produce no output, thatb is a good
sign that the configuration syntax passed validation.
after that we reload our ssh, using systemd command(**sudo systemctl reload ssh)

N/B
we do not use sudo to create a ssh key for our user.

## INSTALLING AND CONFIGURE NGINX AS A REVERSE PROXY ON MY LAPTOP IP
NOTE;
Nginx is acting as a reverse proxy because the client communicates with Nginx,
while Nginx forwards the request to the backend application.

Installing Nginx:
we use the command **sudo apt update**. we run this command to update the package list about available software.
after that we run **sudo apt install nginx** this command is what install nginx webserver on the system.
then we use the sevice manager  to check the state of nginx **sudo systemctl status nginx**. this command or 
systemd service manger is use to start, restart, enable,stop, and check the status of any services.
then we check nginx configuration file ** ls /etc/nginx/**. we see many directories and files.
with nginx user hit http://ip a on port 80, app can hide behide nginx i.e apps can not be exposed directly.
nginx can run 10 apps with different domains. it can handles ssl, static files, proxying.

we need a need a backend so we can actually demonstrate reverse proxy.
i created an Atlas directory. using the command **mkdir -p atlas-backend**. after that i created a placeholder 
page inside my atlas-backend folder. using **nano atlas-backend/index.html** inside the file i imput (<h1>Atlas 
Reverse Proxy</h1>  <p> Request successfully reached the backend through niginx.</P>)
After we use the command **ython3 -m http.server 5000 --bind 127.0.0.1** this command means python, start a 
simple web server on this computer, listening on port 5000, and do not expose that server directly to the 
nextwork. 
i leave it running then i open a new terminal and run this command curl http://1270.0.1:5000
it will show the text we did in the index.html
now let configure nginx as a reverse proxy, first we open the config file with sudo nano /etc/nginx/
sites-available/atlas. this is where i build the configuration line by line.
