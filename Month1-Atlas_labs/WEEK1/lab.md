# Re-harden the existing Ubuntu VM specifically as the 'Atlas v0.1 host': create adedicated non-root deploy user, configure UFW, disable password-based SSH (key-only).

## WHY WE HARDEN OUR LAPTOP.

the goal is not  to make the machine unhackable. the goal is to reduce attack
surface and limit damage if something goes wrong.

FIRST.

I created a dedicated user for my Atlas. using the command (**sudo adduser bethel**) ubuntu asked for a password for my new user and some optional
 informations. 

adduser or sudo adduser is a command used to create user account, create 
home directory, 

After that i added my dedicated user to the sudo group. because i want my
user to perform authorized administrative tasks. 

i used the command **sudo usermod -aG sudo bethel** to add the user bethel is the sudo group. the whole command means add
bethel to the sudo group without removing its existing supplementary groups.

N/B

**-aG** is important because we do not not want to accidentally replace the user's existing supplementary groups.-aG means append to group membership.

**Inconclusion**

my deploy user (bethel). was created as a normal user account that have authorized access to sudo, allowing it to execute specific commands 
with elevated privileges, using **sudo*.  example **sudo apt update, upgrade, install apt**.


##        CONFIGURATION OF UFW

UFW stands for Uncomplicated firewall, provides a simpler commad-line interface for managing firewall rules, the important 
concepts are: Allow. Deny. Reject. Incoming. Outgoing. Port. Protocol and
Default policy.

Ufw first rule: inspect before changing things blindly.

our first command is (**sudo ufw status verbose**).this checks the status of my firewall in a more detailed way. the command output shows if UFW is 
enable, and what rules are currently configured.

**Why ufw start as 'inactive':**

Imagine turn a fire wall with no rules. it will block everthing, by default including my ssh, http, etc. i will lock myself out of my own server. so 
linux keep ufw as inactive until i set the rules and tell it what to allow.

**ufw rule:** 

- I set the default policy.(**sudo ufw default deny incoming**).this means incoming connections are denied unless a rule explicitly allows them. 
- then we run (**sudo ufw default allow outgoing**).this means outgoing connections are allowed by default. this means the server can go out the 
internet. so apt update, pip install, curl google.com will still work.(if you do it in wrong order you lock yourself out: example if you do deny 
incoming + sudo ufw enable Before you allow port 22, you will kick yourself out of ssh and can not login again.).
- then we allow the port we want to use like port 22 or Openssh. using the command **sudo ufw allow port 22** this allows ssh service.

**N/B**

1. sudo ufw show added : this ufw command  let us see the rule that have been added in our firewall is not active or active.

- now we enable UFW, using the command **sudo ufw enable**. our firewall is set and active.
- we can also disable the firewall using **sudo ufw disable**, this turn ufw off. my pc/server will accept all traffic again. no rule will be enforced.
- **sudo ufw reset**, disables ufw and deletes all rules, resetting to clean state. use it when you messed up your rules or want to reconfigure from
zero. you will need to add your rules again and enable UFW.

**N/B** 

disable turn off my ufw while reset delete the rules and turn off ufw.

#            SSH. disable password-based SSH (key-only).
First we create shh key using (**ssh-keygen**). this command create  two keys, the public key which we copy to the server and the private key that
stays on my system and must not be shared. it will ask for a file to save the key. press enter for default. then it asks for a passphrase ypu can 
create one or skip by pressing enter.

after that.i use (**ssh-copy-id the servername@ip a**) to copy the ssh pub key to the serve, we want to connect remotely. then a password was ask i.e
the server password, why? because we want to save the public key to the server.

after that we connect to the server using the command (**ssh server@ip a**) it will connect me without asking for password.(if we set a passphrase, 
it will ask for the passphrase).

**Disable password Authentication**

make sure the current ssh session is open.then i open a second terminal. we will us that to test the new cofiguration. we ssh to the server again
(**ssh bethel@ip a**). if that works, we have ssh key authentication. our ssh server config is stored here (/etc/ssh/sshd_config).it is advisable 
we make a copy of the ssh config file, so that if we make a mistake we still have a copy. using sudo cp /etc/ssh/sshd_config  /etc/ssh/sshd_config.b
we go to the ssh config file to set some things inside the file such at the **pubkeyAuthentication yes** (this allow ssh keys)| 
**passwordAuthentication no**(disable ssh password) | **permiRootlogin no**(root cannot directly ssh in)|**kbdinteractiveAuthentication no**
(this disable keyboard_interactive authentication, which can otherwise provide another interactive authentication) After that we save the config file
and run th **sudo sshd -t** ( this actually tests the ssh server config fil for errors). if it produce no output, that is a good sign that the 
configuration syntax passed validation.after that we reload our ssh, using systemd command(**sudo systemctl reload ssh)

N/B
we do not use sudo to create a ssh key for our user. if we use sudo is creates ssh key to the root. which we do not need. alway use ssh-keygen not 
sudo ssh-keygen.

## INSTALLING AND CONFIGURE NGINX AS A REVERSE PROXY ON MY LAPTOP IP

**NOTE;**

Nginx is acting as a reverse proxy because the client communicates with Nginx, while Nginx forwards the request to the backend application.

**Installing Nginx:**

**sudo apt update**. we run this command to update the package list about available software. after that we run **sudo apt install nginx** this
command is what install nginx webserver on the system.then we use the service manager to check the state of nginx **sudo systemctl status nginx**.
this command or systemd service manger is used to start, restart, enable,stop, and check the status of any services.then we check nginx configuration
file  **ls /etc/nginx/**. we see many directories and files. sudo not needed. with nginx, user hits http://ip a on port 80, app can hide behide nginx
i.e apps can not be exposed directly. nginx can run 10 apps with different domains. it can handles ssl, static files, proxying.

we need a backend so we can actually demonstrate reverse proxy. i created an Atlas directory. using the command **mkdir -p atlas-backend**
after that i created a placeholder page inside my atlas-backend folder. using **nano atlas-backend/index.html** inside the file i input (<h1>Atlas 
Reverse Proxy</h1>  <p> Request successfully reached the backend through niginx.</P>) After we use the command 
**python3 -m http.server 5000 --bind 127.0.0.1** this command means python, start a simple web server on this computer, listening on port 5000, and do 
not expose that server directly to the nextwork. i leave it running then i open a new terminal and run this command **curl http://127.0.0.1:5000**
it will show the text from the index.html

now let configure nginx as a reverse proxy, first we open the config file with sudo nano /etc/nginx/sites-available/atlas. this is where i build the
configuration line by line.then we Enable the Atlas Nginx site with sudo ln -s /etc/nginx/sites-available/atlas /etc/nginx/sites-enabled.
What this does: Creates a symbolic link so Nginx knows that the atlas configuration should be enabled.

test the Nginx configuration: sudo nginx -t. What this does: Checks the Nginx configuration for syntax errors before we reload Nginx.

You want to see something like: syntax is ok, test is successful.

Reload Nginx: sudo systemctl reload nginx. What this does: Tells the already-running Nginx service to load the new configuration without completely
stopping the web server.

test the Atlas reverse proxy: curl http://YOUR_SERVER_IP, Replace YOUR_SERVER_IP with your Ubuntu server's IP address.