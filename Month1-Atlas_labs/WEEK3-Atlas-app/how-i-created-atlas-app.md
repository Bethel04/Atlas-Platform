
> **first, I updated the package information and installed the tools Atlas needs.**
using

sudo apt update

This refreshes Ubuntu's package index so I can obtain current package information.

then i ran 

sudo apt install git python3 python3-pip python3-venv curl

I installed Git for source-code management, Python for running Atlas, pip for Python packages, venv for an isolated Python environment, and curl for testing HTTP requests.

I entered my atlas- platform

using:

cd atlas-platform

I entered the Atlas project directory.

ls

I used `ls` to verify that the project files are present.


> **Next, I created an isolated Python environment for Atlas.**

using the commad

python3 -m venv .venv

This creates a Python virtual environment called `.venv` so Atlas's dependencies are isolated from the system Python environment.


source .venv/bin/activate

This activates the virtual environment.

bash

pip install -r requirements.txt
`

This installs the Python dependencies required by the Atlas application.


Next, I installed and configured PostgreSQL.**

 bash

sudo apt install postgresql postgresql-contrib


I installed PostgreSQL because Atlas needs a database to store its application data.

bash
sudo systemctl status postgresql


I checked that the PostgreSQL service is running.

Then I entered PostgreSQL:

bash
sudo -u postgres psql


 I opened the PostgreSQL command-line interface as the PostgreSQL administrator so I could create the application's database and user.

I created the database:

sql

CREATE DATABASE atlas_notes;


This creates the dedicated database for Atlas.

I created the application user:

sql

CREATE USER atlas_app WITH PASSWORD 'PASSWORD';


I created a dedicated database account for Atlas instead of allowing the application to use the PostgreSQL administrator account.

I granted the required permissions:

sql

GRANT CONNECT ON DATABASE atlas_notes TO atlas_app;


This allows `atlas_app` to connect to the Atlas database.

sql

\c atlas_notes
`
This switches my PostgreSQL session to the Atlas database.

sql

GRANT USAGE ON SCHEMA public TO atlas_app;


This allows the application user to use the schema.

sql

GRANT CREATE ON SCHEMA public TO atlas_app;


This allows the application to create the required database objects.

sql

GRANT SELECT, INSERT, UPDATE, DELETE
ON ALL TABLES IN SCHEMA public
TO atlas_app;

These permissions allow the application to read, create, modify, and delete data in its tables.

I did this according to the **principle of least privilege**, meaning I give the application only the permissions it needs rather than using the powerful PostgreSQL administrator account.

Then:

sql
\q


This exits PostgreSQL.


Before introducing Nginx, I tested the application directly.**

bash
source .venv/bin/activate


I activated the Atlas Python environment.

bash
python app.py


I started the Atlas application manually.

Then from another terminal:

bash
curl http://127.0.0.1:5000
`

I tested Atlas locally. `127.0.0.1` refers to the VM itself, and port `5000` is where Atlas is listening.

I do this test before Nginx because I want to prove that the application itself works before adding another layer.


Next, I created a systemd service for Atlas.**

bash
sudo nano /etc/systemd/system/atlas.service


I configured it with:

ini
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


User=bethel` means Atlas runs as a normal user rather than root, following least privilege.

WorkingDirectory` tells systemd where the Atlas project is located.

ExecStart` tells systemd exactly how to start Atlas using the Python interpreter inside the virtual environment.

Restart=on-failure` tells systemd to restart Atlas if it crashes.

RestartSec=5` makes systemd wait five seconds before restarting it.

Then:

bash

sudo systemctl daemon-reload


This tells systemd to reread the new service definition.

bash

sudo systemctl start atlas


This starts Atlas immediately through systemd.

bash

sudo systemctl status atlas


I check that Atlas is running successfully.

bash

sudo systemctl enable atlas


This configures Atlas to start automatically when the VM boots.


Next, I installed Nginx and configured it as a reverse proxy.**

basH

sudo apt install nginx


I installed Nginx because it will be the public-facing HTTP server and reverse proxy.

I created the Atlas configuration:

bash

sudo nano /etc/nginx/sites-available/atlas


with:

nginx

server {
    listen 80;
    server_name _;

    location / {
        proxy_pass http://127.0.0.1:5000;
    }
}


listen 80` tells Nginx to accept HTTP traffic on port 80.

proxy_pass http://127.0.0.1:5000` tells Nginx to forward incoming requests to the Atlas application running locally on port 5000.

So the traffic becomes:

```text
Client
   ↓
Nginx :80
   ↓
Atlas :5000
   ↓
PostgreSQL



I enabled the Atlas Nginx configuration.**

bash

sudo ln -s /etc/nginx/sites-available/atlas \
/etc/nginx/sites-enabled/atlas


This creates a symbolic link that enables the Atlas Nginx site.

I removed the default site:

bash

sudo rm -f /etc/nginx/sites-enabled/default

This prevents the default Nginx site from interfering with my Atlas configuration.



Before reloading Nginx, I tested the configuration.**

bash

sudo nginx -t
`

This checks the Nginx configuration for syntax and configuration errors.

I only reload Nginx if this test succeeds.

Expected:

text

syntax is ok
test is successful


Then:

bash

sudo systemctl reload nginx
`
This tells Nginx to apply the new configuration without unnecessarily stopping the service.



Next, I configured the firewall to allow HTTP.**

bash

sudo ufw status
`

I checked the current firewall rules.

If necessary:

bash

sudo ufw allow 80/tcp


 I allowed TCP port 80 because Nginx needs to receive HTTP traffic from outside the VM.



Finally, I verified that the application was reachable from outside the VM.**

First:

basH

ip -br a


I used this to find the VM's network IP address.

Then, from my **host computer**, not from inside the VM:

bash

curl http://VM-IP


This tests the complete network path from outside the VM to Nginx and then to Atlas.
