##    Scaffold the Atlas app itself - a simple Notes REST API (Flask or Node) backed by Postgres; run it locally first. 

Key ideal: 
We are building a small notes Rest API. think of it like this:
my laptop----->flask to (http)---->REST API to(SQL) ---->postgreSQL--->Notes

the user sends requests such as: POST  /note, use to create note or GET /notes to retrive notes.

# What does "scaffold" mean?

Scaffold means creating the basic structure of an application before building all its features.

#   What is Flask?

Flask is a python web framework. it allows python to receive HTTP requests and send HTTP responses. 
for example: brower/curl send GET /notes---flask---PosgreSQL---Flask----response---Browser/curl.

What is REST?

REST is a common way of designing APIs around resources. our resources is : notes
We can use http methods:

Method_______________________purpose 
- GET_______________________ Read
- PO_________________________create 
- PUT/PATCH__________________update
- DELETE_____________________delete

so: GET /notes. means: Give me the notes.

post /notes, means: create a new note

#    What is an API?

API means Application Programming Interface, Thiis is a set of rules that lets two software programs talk to each other.
example: client, i send "give me notes"----API, "database, give me the notes"----postgreSQL, give the note to---API--Client.

N/B

The client doesn't directly talk to PostgreSQL. the flask API sit in between.

#    PostgreSQL

PostgreSQL is a relational database management system. it stores our notes, the database persists the information. if flask stops running, the notes 
remain in PostgreSQL.

# fLASK VS PostgreSQL
Flask = application/API layer

PostgreSQL = database/data layer

they have two different jobs. (Clent ---Flask API --- Postgresql)

## Project- Build Atlas APP

step 1. create the Atlas application directory. using mkdir atlas-app, enter the directory using cd Atlas-app.
step 2. create a python virtual environment, because we do not want Atlas's Python packages mixed with ubuntu's system python.
run:
python3 -m venv .venv
think of .venv as a private python environment for atlas. we activate it using **source .venv/bin/activate** the .venv tells me: "i am currently using 
Atlas's private python environment.

step 3. install flask and postgreSQL libraries. RUN: pip install flask psycopg2-binary. were are installing two thing, the Flask.(this is the python 
frameworkk that will allow use to create our web API). psycopg2 psycopy2 allows Python/Flask to communicate with postgreSQL. 
step 4. create the application file RUN: touch app.py, to create an empty file, then we check it using ls.
step 5. put the first flask application in app.py using nano app.py, after that i run python app.py, is will show that the app is running locally
in my virtual enviroment.then we open another terminal and test it using curl http://127.0.0.1:5000. WE SEE THE MESSAGES ATLAS IS RUNNIG.

##    Install PostgreSQL directly on the VM; create the atlas_notes database and a dedicated least-privilege DB user.

What is PostgreSQL?

PostgreSQL is a database management system. Think of it like a very organized digital filing cabinet where your application can store information.

Your Atlas application will eventually do things like:

POST /notes
        ↓
Atlas API
        ↓
PostgreSQL
        ↓
Save the note

What does "least privilege" mean?

We do not want our application to connect to PostgreSQL as the powerful postgres administrator. Instead, we create a special user: atlas_app
That user gets only the permissions the Atlas application needs.
This is a security principle: Give an account only the permissions it actually need

#      PROJECT — Install PostgreSQL on your VM

Step 1 — Update Ubuntu's package information

I Ran. sudo apt update. What does this do? 

apt is Ubuntu's package manager.

Think: apt = Ubuntu's software manager, update does not install PostgreSQL. It simply asks Ubuntu: "What software packages and versions are currently
available?"

Then install PostgreSQL: sudo apt install postgresql postgresql-contrib

When Ubuntu asks: Do i want to continue? [Y/n]

I Typed Y and pressed Enter.

# Step 2 — Check PostgreSQL

Run:

sudo systemctl status postgresql

You want to see something similar to:

Active: active (exited)

or a PostgreSQL service showing that it is running/active.

Why systemctl?

systemctl
   ↓
controls systemd services

PostgreSQL is a service.

So: sudo systemctl status postgresql. means: "Ask systemd for the current status of the PostgreSQL service." If it isn't running, use:
sudo systemctl start postgresql

Then check again:

sudo systemctl status postgresql

# Step 3 — Enter PostgreSQL as the administrator

Ubuntu normally creates a PostgreSQL administrative Linux user called: postgres


Run: sudo -u postgres psql

Let's break this down:

sudo
 ↓
run something with elevated privileges

-u postgres
 ↓
run it as the postgres user

psql
 ↓
PostgreSQL's command-line client

You should see something like:

postgres=#

# Step 4 — Create the Atlas database

Inside psql, run: CREATE DATABASE atlas_notes;

You should get:

CREATE DATABASE

Now you have:

PostgreSQL
    │
    └── atlas_notes

# Step 6 — Give the user only the required access

Now we need to give atlas_app access to the Atlas database.

Run:

GRANT CONNECT ON DATABASE atlas_notes TO atlas_app;

This means:

atlas_app is allowed to connect to the atlas_notes database.

Then switch into the database:

\c atlas_notes

You should see something like:

You are now connected to database "atlas_notes" ...

Now grant the application user permission to use the public schema:

GRANT USAGE ON SCHEMA public TO atlas_app;

For our learning application, we also need it to be able to create/use the tables that Atlas will need.

Run:  GRANT CREATE ON SCHEMA public TO atlas_app;

And for tables that the application creates/uses:  GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA public TO atlas_app;

For sequences, which PostgreSQL commonly uses for auto-incrementing IDs:

GRANT USAGE, SELECT, UPDATE ON ALL SEQUENCES IN SCHEMA public TO atlas_app;

# Step 7 — Verify what we created

Still inside psql, run: \l

This lists databases.

You should find: atlas_notes

Now: \du

This lists PostgreSQL users/roles.

You should find:

atlas_app

You can also check the current database: SELECT current_database();

You should get: atlas_notes

#  Step 8 — Exit PostgreSQL

When finished:

\q

I'll return to your normal Ubuntu terminal.

## Deploy the app manually on the VM behind nginx; confirm it's reachable over HTTP from outside the VM.

What does "behind Nginx" mean?

Your Flask/Node application will not be the public-facing web server.

Instead:

- Nginx receives HTTP requests.
- Nginx forwards those requests to your Atlas API.
- The Atlas API communicates with PostgreSQL.

For example:

Browser
   │
   │ http://VM-IP
   ▼
Nginx :80
   │
   │ proxy
   ▼
Atlas API :5000
   │
   ▼
PostgreSQL :5432

This is called a reverse proxy.

#  2. PROJECT — Deploy Atlas manually

We're going to do this in stages.

# Stage A — Make sure your Atlas API works locally

First enter your Ubuntu VM. Go to your Atlas project: cd ~/atlas-platform

Check where you are:

pwd

You should see something similar to:

/home/your-user/atlas-platform

Then:

ls

You should see your Atlas files.

#  Stage B — Start the application manually

Because we're using the Atlas Notes API, first activate your Python virtual environment if you created one.

For example:

source .venv/bin/activate

What does source mean?

It tells your current shell to read and apply the commands/settings contained in a file.

What does .venv/bin/activate do?

It activates your Python virtual environment.

You should then see something like:

(.venv) user@ubuntu:~/atlas-platform$

Now start your Flask application.

Depending on how we created your application, this might be:

python app.py

or:

flask run --host=127.0.0.1 --port=5000

Don't randomly run both. Use the command matching the way your Atlas API was created.

If successful, you should see something similar to:

Running on http://127.0.0.1:5000

#  Stage C — Test the API from inside the VM

Open another terminal into the VM.

Run:

curl http://127.0.0.1:5000

Remember:

127.0.0.1
   ↓
this same computer

So you're asking:

"Is my Atlas application responding locally on this VM?"

If you get a response from your application, good

#  Stage D — Configure Nginx

Now Nginx will become the public entry point.

First check Nginx:

sudo systemctl status nginx

If it isn't running:

sudo systemctl start nginx

Now create an Nginx configuration for Atlas:

sudo nano /etc/nginx/sites-available/atlas

Put this inside:

server {
    listen 80;
    server_name _;

    location / {
        proxy_pass http://127.0.0.1:5000;

        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }
}
Don't just copy this blindly.

The important part is:

proxy_pass http://127.0.0.1:5000;

It means:

Nginx
  │
  │ "send this request to..."
  ▼
127.0.0.1:5000
  │
  ▼
Atlas API.

# Stage E — Enable the configuration

Run:

sudo ln -s /etc/nginx/sites-available/atlas /etc/nginx/sites-enabled/atlas

ln -s creates a symbolic link.

Think of it as telling Nginx:."Enable this configuration." Now remove the default Nginx site so it doesn't interfere: using the command

sudo rm /etc/nginx/sites-enabled/default

Then test the Nginx configuration before restarting it:

sudo nginx -t

You want: syntax is ok

test is successful

This is an important defensive habit:

Test configuration before applying it.

Then:

sudo systemctl reload nginx

reload tells Nginx to reread its configuration without unnecessarily stopping the service.

#  Stage F — Test Nginx from inside the VM

Run:

curl http://127.0.0.1

Notice something important.

Before:

curl http://127.0.0.1:5000

went directly to the application.

Now:

curl http://127.0.0.1

goes to:

Nginx :80
   ↓
Atlas :5000

If your API responds, your reverse proxy is working.

#  Stage G — Find the VM's IP address

Run:

ip -br a

You'll see something similar to:

enp0s3    UP    192.168.56.101/24

or perhaps:

enp0s3    UP    10.0.2.15/24

The important part is the IP address.

Do not use 127.0.0.1.

127.0.0.1 means "this machine itself."

We need the VM's network IP.

# Stage H — Check UFW

Because we've previously worked on UFW, check it:

sudo ufw status

If UFW is active and HTTP isn't allowed, allow HTTP:

sudo ufw allow 80/tcp

Then:

sudo ufw status

You should see an HTTP rule for port 80.

Why port 80?

HTTP normally uses:

TCP port 80

So the outside world needs to be able to reach:

# Stage I — Test from OUTSIDE the VM

This is the important part of the task.

From your host computer, open a browser and enter:

http://VM-IP

For example, if your VM's address was:

192.168.56.101

you would enter:

http://192.168.56.101

Or from your host terminal:

curl http://192.168.56.101

The traffic should be:

HOST COMPUTER
     │
     │ HTTP :80
     ▼
UBUNTU VM
     │
     ▼
NGINX :80
     │
     │ reverse proxy
     ▼
ATLAS API :5000
     │
     ▼
POSTGRESQL

# Write a systemd service unit for the Atlas app, so it starts on boot and restarts automatically if it crashes.

1. NOTE — What are we building?

Currently, if you start Atlas manually:

python app.py

and the application crashes, it stays down.

Also, after rebooting the VM, you would have to start it again.

systemd solves both problems.

Our architecture becomes:

Ubuntu VM
│
├── systemd
│     │
│     └── atlas.service
│            │
│            └── Atlas API :5000
│
└── Nginx :80
       │
       └── proxy → Atlas :5000

The service will tell Ubuntu:

Start Atlas automatically when the machine boots, and restart it if it crashes.

#  PROJECT — Create the systemd service
Step 1 — First, confirm your Atlas location

Run: cd ~/atlas-platform 

pwd

You should get something like: /home/bethel/atlas-platform

Then:

ls

We need to know the name of your Python application file.

If you see:

app.py

then we're good to use app.py.

# Step 2 — Make sure your virtual environment exists

Run:

ls -l .venv/bin/python

If it exists, you'll see something like:

-rwxr-xr-x ... .venv/bin/python

This is important because our service should use the Python environment where your Atlas dependencies are installed.

# Step 3 — Create the service unit

Run:

sudo nano /etc/systemd/system/atlas.service

Put this inside:

[Unit]
Description=Atlas Notes API
After=network.target postgresql.service

[Service]
User=bethel
WorkingDirectory=/home/bethel/atlas-platform
ExecStart=/home/bethel/atlas-platform/.venv/bin/python app.py
Restart=on-failure
RestartSec=5

[Install]
WantedBy=multi-user.target
Understand every important line
[Unit]

Describes the service and its dependencies.

Description=Atlas Notes API

Just gives our service a readable name.

After=network.target postgresql.service

This tells systemd:

Start Atlas after the network and PostgreSQL service have been started.

[Service]

This is where we tell systemd how to run Atlas.

User=bethel

This is important for security.

We're saying:

Run Atlas as the normal bethel user, not as root.

That's another example of least privilege.

WorkingDirectory=/home/bethel/atlas-platform

This tells Atlas:

Treat this directory as your working directory.

ExecStart=/home/bethel/atlas-platform/.venv/bin/python app.py

This is the actual command systemd will run.

Instead of you typing:

python app.py

systemd runs:

/home/bethel/atlas-platform/.venv/bin/python app.py

Using the full path is useful because systemd doesn't use your normal interactive shell environment.

The most important part:
Restart=on-failure

If Atlas crashes unexpectedly, systemd will restart it.

And:

RestartSec=5

means:

Wait 5 seconds before trying to restart it.

So:

Atlas crashes
     ↓
systemd notices
     ↓
wait 5 seconds
     ↓
start Atlas again
[Install]
WantedBy=multi-user.target

This allows the service to be enabled to start during normal system boot.

# Step 4 — Save the file

In Nano:

Ctrl + O
Enter
Ctrl + X
Step 5 — Tell systemd about the new file

Run:

sudo systemctl daemon-reload
What does this mean?

You just created a new service file.

systemd needs to reread its service definitions.

So:

daemon-reload
     ↓
systemd rereads service files

# Step 6 — Start Atlas

Run:

sudo systemctl start atlas

Then check:

sudo systemctl status atlas

You want something similar to:

Active: active (running)

# Step 7 — Make Atlas start automatically after reboot

Now run:

sudo systemctl enable atlas

You should see something similar to:

Created symlink ...

This means Atlas is now registered to start automatically during boot.

# Step 8 — Verify both properties

Check:

sudo systemctl is-enabled atlas

Expected:

enabled

Then:

sudo systemctl is-active atlas

Expected:

active

So:

is-enabled → enabled
is-active  → active

means:

Atlas is currently running and configured to start automatically at boot.