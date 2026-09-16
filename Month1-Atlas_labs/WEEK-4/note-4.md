## D eliberately break the deployment (stop the DB, close a port, misconfigure nginx); troubleshoot using ping/curl/dig/netstat/journalctl from the original Week 3.

First let understand something very important:

So if something breaks:

- nginx broken → browser/curl may fail at port 80
- Gunicorn/Flask broken → nginx may return 502 Bad Gateway
- PostgreSQL stopped → Flask may fail when it needs the database
- port blocked → network connection can fail
- DNS problem → dig can help investigate name resolution
- service/log problem → journalctl tells us what the service is saying.

# Break Atlas and troubleshoot it

Let break postgresql; we use the command: sudo systemctl stop postgresql.

What does this mean?

systemctl controls services on Linux.

stop tells Linux: "Stop running the PostgreSQL service."

After that we check if postgreSQL is actually stop. we use the command sudo systemctl status posgresql. this show if postgresql is running or not.

Step 2 — Test Atlas

Try: curl http://127.0.0.1

Depending on how your Flask application uses PostgreSQL, you may still get a response for endpoints that don't touch the database.

Test your actual Notes endpoint as well, for example:

curl http://127.0.0.1/notes

If that endpoint requires PostgreSQL, you should see an application/database error.

Step 3 — Check PostgreSQL

sudo systemctl status postgresql, this shows if postgresql is running?

Step 4 — Check the logs

sudo journalctl -u postgresql --no-pager -n 50

let's Breakdown:

journalctl → read system logs
-u postgresql → only PostgreSQL's logs
--no-pager → don't open the scrolling viewer
-n 50 → show the last 50 lines

After that i start my postgresql using sudo systemctl start postgresql, this start my progresql. to confirm that the database actually stopped
we  use sudo systemctl status postgresql. then we test it using curl http://127.0.0.1.

## Close the HTTP port

Now we'll deliberately create a firewall problem.

First check UFW:

sudo ufw status

You should see your current firewall rules.

If HTTP is currently allowed, remove it:

sudo ufw delete allow 80/tcp

Now port 80 is no longer allowed through UFW.

# Test from another machine

From another computer on your network:

curl http://YOUR_UBUNTU_IP

For example, if your Ubuntu machine is:

10.104.72.242

you would test:

curl http://10.104.72.242

It may now fail because the firewall is blocking HTTP.

# Troubleshoot it
Check your IP
ip a

Remember:

ip a shows the network interfaces and their IP addresses.

# Check connectivity

From the other machine:

ping YOUR_UBUNTU_IP

This is important.

If:

ping works

but:

curl http://YOUR_UBUNTU_IP

fails, we know the machine is reachable but HTTP may be blocked.

That's a very useful troubleshooting clue.

# Check the listening port

On Ubuntu:

sudo ss -tulpn

Look for something listening on:

:80

You might see nginx listening there.

This tells you:

Is a program actually listening on port 80?

# Check UFW again
sudo ufw status

You should notice that port 80 isn't allowed anymore.

# Fix it
sudo ufw allow 80/tcp

Then:

sudo ufw status

Test again:

curl http://YOUR_UBUNTU_IP

Atlas should respond again.

## LAB 3 — Misconfigure nginx

This one is extremely important because you already learned nginx.

First make a backup:

sudo cp /etc/nginx/sites-available/atlas /etc/nginx/sites-available/atlas.backup

# Deliberately break nginx

Open the configuration:

sudo nano /etc/nginx/sites-available/atlas

Find the proxy line that looks roughly like:

proxy_pass http://127.0.0.1:5000;

Temporarily change it to:

proxy_pass http://127.0.0.1:5999;

We are deliberately telling nginx:

"Send Atlas requests to port 5999."

But our Flask/Gunicorn application isn't listening there.

# Test the nginx configuration

Before reloading nginx:

sudo nginx -t

This is one of the most important commands.

If the syntax is correct, you'll get something like:

syntax is ok
test is successful

Notice something important:

nginx can have valid syntax but still point to the wrong application port.

That's why nginx -t alone isn't enough.

##  Reload nginx
sudo systemctl reload nginx

Now test:

curl http://127.0.0.1

You should likely get: 502 Bad Gateway

Now troubleshoot the 502

This is where the real learning happens.

Test nginx
sudo systemctl status nginx

this checks if the nginx is actually running or not. Maybe nginx itself is perfectly healthy. So don't immediately say: "nginx is down."

It might be running perfectly.

## Check what ports are listening
sudo ss -tulpn

Look for:

:80

and:

:5000

You should discover that your application is listening on 5000, while nginx is trying to reach 5999.

That's the problem.

## Test the application directly

Try:

curl http://127.0.0.1:5000

If Atlas responds, you've proven:

Flask/Gunicorn = working
nginx = working
nginx → wrong port = problem

That's excellent troubleshooting

# Check nginx logs

Run:

sudo journalctl -u nginx --no-pager -n 50

You can also inspect:

sudo tail -n 50 /var/log/nginx/error.log

You should find an error indicating nginx cannot connect to the upstream.

In simple terms:

nginx is alive, but the application it is trying to contact isn't available at the address/port configured.

##  Fix nginx

Open it again:

sudo nano /etc/nginx/sites-available/atlas

Change:

proxy_pass http://127.0.0.1:5999;

back to:

proxy_pass http://127.0.0.1:5000;

Save.

Then:

sudo nginx -t

If successful:

sudo systemctl reload nginx

Test:

curl http://127.0.0.1

Atlas should work again.

##  What did i do in the troubleshooting lab?


I deliberately introduced failures into my Atlas deployment instead of only testing when everything was working. I stopped PostgreSQL, blocked HTTP through UFW, and misconfigured the nginx upstream port. I then used Linux and networking tools from the earlier weeks to identify the failure rather than guessing.

How did i troubleshoot the database failure?

I checked the PostgreSQL service with systemctl status postgresql, examined its logs with journalctl -u postgresql, and restored the service with systemctl start postgresql.

How did i troubleshoot the port problem?

I used ping to verify basic network reachability, curl to test HTTP connectivity, ss -tulpn to see which ports were actually listening, and ufw status to inspect the firewall rules.

You received a 502 Bad Gateway. What did i do?


I didn't assume nginx was down. I checked nginx with systemctl status nginx, checked the listening ports with ss -tulpn, and tested the application directly with curl http://127.0.0.1:5000. The application was working, so I inspected the nginx configuration and logs and discovered that nginx was forwarding to the wrong upstream port.

What does curl tell me?

curl allows me to test HTTP communication directly. For example, curl http://127.0.0.1:5000 tests whether my application is responding directly, while curl http://127.0.0.1 tests the nginx layer.

What does ss tell me?

ss shows network sockets. I can use it to determine whether a service is actually listening on a particular port, such as port 80 for nginx or port 5000 for my application.

What does journalctl tell me?

journalctl lets me inspect systemd journal logs. I use it to understand what a service reported when it started, stopped, failed, or encountered an error.


## Set up basic log rotation; trace one real request end to end through the nginx and Atlas app logs together.

What is log rotation means automatically cleaning up old log file so they don't fill your whole hard drive.

1. Log rotation: Prevent nginx logs from growing forever.

2. Request tracing: Follow ONE request: curl → nginx → Atlas/Gunicorn → response

# Step 1 — See your nginx logs

Run: ls -lh /var/log/nginx/

What does it mean?
ls

= list files.

-l

= show detailed information.

-h

= show sizes in human-readable form, such as 4K, 20M, 1G.

And:

/var/log/nginx/

is the directory where nginx keeps its logs.

So the whole command means: "Show me the nginx log files, their sizes, ownership, permissions, and other details."

# Step 2 — Check nginx's logrotate configuration

Run: cat /etc/logrotate.d/nginx

cat

cat means:

Display the contents of a file.

/etc/logrotate.d/nginx

This is nginx's logrotate configuration.

So we're asking:

"How has Ubuntu configured log rotation for nginx?"

Important

Ubuntu commonly installs nginx with a logrotate configuration already present.

So if this file already exists, don't create another one.

That's already basic log rotation.

# Step 3 — Understand what log rotation does

Imagine this file keeps growing:

access.log

Logrotate can eventually produce something like:

access.log
access.log.1
access.log.2.gz
access.log.3.gz

Think of it this way:

access.log       ← current log

access.log.1     ← previous log

access.log.2.gz   ← older compressed log

access.log.3.gz   ← even older compressed log

This keeps your server from eventually filling its disk with logs.

# Step 4 — Check logrotate itself

Run:

logrotate --version

This tells you whether the logrotate program is installed and its version.

# step 5 — Test the nginx rotation configuration

Don't rotate the logs yet.

First test the configuration:

sudo logrotate -d /etc/logrotate.d/nginx

-d

means:

Debug / dry-run.

It shows what logrotate would do without actually rotating the logs.

That's safer for our first test.

# PART 3 — FIND YOUR ATLAS SERVICE

Before tracing the request, we need the actual name of your Atlas service.

Run:

systemctl list-units --type=service | grep -i atlas

Breakdown:

systemctl

= communicate with systemd.

list-units

= list units known to systemd.

--type=service

= only show services.

|

= pipe the output into another command.

grep

= search/filter text.

-i

= ignore uppercase/lowercase.

atlas

= search for services containing "atlas".

You might get:

atlas.service

or perhaps another name.

Use the name your computer actually shows.

# PART 4 — LOOK AT ATLAS'S LOGS

Suppose your service is:

atlas.service

Then run:

sudo journalctl -u atlas --no-pager -n 30

If your service has a different name, substitute that name.

For example:

sudo journalctl -u atlas-app --no-pager -n 30

Understand the command

journalctl

= read systemd's journal/logs.

-u atlas

= only show logs belonging to the Atlas service.

--no-pager

= print the result directly instead of opening a scrolling viewer.

-n 30

= show the last 30 lines.

So the whole command means:

"Show me the last 30 log entries produced by my Atlas service."

# PART 5 — TRACE ONE REAL REQUEST

Now we do the interesting part.

We want to watch the request travel through Atlas.

We'll use two terminals.

TERMINAL 1 — Watch nginx

Open another terminal.

Run:

sudo tail -f /var/log/nginx/access.log

What is tail?

tail displays the end of a file.

We don't want to read thousands of old log entries.

We want the newest ones.

What is -f?

-f means:

Follow the file.

It keeps watching the file for new entries.

So:

sudo tail -f /var/log/nginx/access.log

means:

"Keep watching nginx's access log and show me new requests as they arrive."

Leave this terminal running.

# TERMINAL 2 — Watch Atlas

In another terminal, run:

sudo journalctl -u atlas -f

Again, replace atlas with your actual service name if different.

This time -f

means:

Keep following the log and show new entries as they happen.

So this terminal is basically saying:

"Show me what Atlas is doing in real time."

Leave it running.

# TERMINAL 3 — Make the request

In your original terminal run:

curl http://127.0.0.1/

You should get something like:

{"message":"Atlas Notes API is running"}

Now look at the other terminals.

# What you're looking for

nginx terminal

You may see something similar to:

127.0.0.1 - - [...] "GET / HTTP/1.1" 200 ...

The important part is:

GET /

and:

200

GET means:

We requested something.

/ means:

We requested the root URL.

200 means:

The request succeeded.

Atlas terminal

Depending on how your Flask/Gunicorn logging is configured, you may see an application request log.

For example, something like:

GET / 200

or a Gunicorn access-log entry.

If nothing appears, that's not necessarily an error. It may mean your current Gunicorn/Flask configuration isn't logging HTTP requests to the systemd journal.

We'll verify that from your actual output rather than guessing.



- Log rotation is the process of periodically rotating and optionally compressing old log files so that logs don't grow indefinitely and consume all available disk space.

Why did i inspect /var/log/nginx/access.log?

The nginx access log records HTTP requests handled by nginx. I used it to see the request entering the reverse proxy.

Why did i use tail -f?

tail shows the end of a file, while -f continuously follows the file. This allowed me to see the nginx log entry immediately when I generated a request.

Why did i use journalctl?

Atlas is running as a systemd service, so journalctl allows me to inspect the logs produced by that service.

How did you trace the request?

I generated a real HTTP request using curl, watched the nginx access log with tail -f, and watched the Atlas service logs with journalctl -u ... -f. I correlated the timestamps and request information to follow the request from nginx into Atlas and back.

# COMMANDS i JUST LEARNED

Keep this list:

ls -lh /var/log/nginx/

Look at nginx log files and their sizes.

cat /etc/logrotate.d/nginx

Read nginx's logrotate configuration.

logrotate --version

Check logrotate installation/version.

sudo logrotate -d /etc/logrotate.d/nginx

Test what logrotate would do without actually rotating.

systemctl list-units --type=service | grep -i atlas

Find the Atlas service name.

sudo journalctl -u atlas --no-pager -n 30

Read the latest Atlas logs.

sudo tail -f /var/log/nginx/access.log

Watch nginx requests in real time.

sudo journalctl -u atlas -f

Watch Atlas logs in real time.

curl http://127.0.0.1/

Generate a real HTTP request to Atlas through nginx.