##  Project Day + Milestone check: confirm Atlas v0.1 survives a full VM reboot with zero manual intervention.

What "zero manual intervention" means: is means when i reboot my computer i dont need to start using the service manger to start or enbale a 
service.

Pre-reboot check

Before rebooting, we're going to establish a baseline.

# Step 1 — Check Atlas

Run:

curl http://127.0.0.1/

i want my Atlas response, such as: {"message":"Atlas Notes API is running"}, This proves Atlas works before the reboot.

**Step 2 — Check nginx**

Run:

sudo systemctl status nginx

Look for: Active: active (running), That means nginx is currently running.

**Step 3 — Check PostgreSQL**

Run:

sudo systemctl status postgresql

i saw: Active: active (exited)

for the PostgreSQL wrapper service, while the actual cluster is running.

A better check is:

pg_lsclusterr

You want the cluster status to show:

online

For example:

Ver Cluster Port Status Owner    Data directory
16  main    5432 online postgres ...

The important word is:

online

##  What is a PostgreSQL "cluster"?

This word can be confusing.

In PostgreSQL, a cluster is basically a PostgreSQL database server instance and the collection of databases it manages.

For our Atlas setup, you can think of it like:

PostgreSQL cluster --> atlas_notes database

So when we created:

atlas_notes

that database lives inside a PostgreSQL cluster.

What does pg_lsclusters mean?

Break the name apart:

pg       → PostgreSQL

ls       → list

clusters → PostgreSQL clusters

So:

pg_lsclusters

basically means:

"List my PostgreSQL clusters and show me their status."

# what will it show?

When you run:

pg_lsclusters

you might see something like:

Ver Cluster Port Status Owner    Data directory
16  main    5432 online postgres /var/lib/postgresql/16/main

Let's understand it.

Ver
16

This is the PostgreSQL version.

Cluster
main

This is the name of the PostgreSQL cluster.

Ubuntu commonly creates a cluster called main.

Port
5432

This is PostgreSQL's normal network port.

That's why earlier we checked:

sudo ss -tulpn | grep 5432

Status

This is the most important part for our reboot test.

You want:

online

That means:

PostgreSQL's cluster is running and available.

If you see:

down

that means:

The PostgreSQL cluster isn't running.

Owner

Usually:

postgres

This is the Linux account that owns/runs the PostgreSQL data.

Data directory

For example:

/var/lib/postgresql/16/main

This is where PostgreSQL stores the cluster's data.

Step 4 — Check the Atlas service

Run:

systemctl list-units --type=service | grep -i atlas

Find the actual service name you created.

If it is:

atlas.service

then run:

sudo systemctl status atlas

You want:

Active: active (running)

Step 5 — Check whether Atlas is enabled at boot

This is critical.

Run:

sudo systemctl is-enabled atlas

You want:

enabled

What does enabled mean?

It means systemd has been configured to automatically start the service during boot.

There is a big difference between:

active

and:

enabled 

active Means: It is running right now.

enabled Means: Start this automatically when the system boots.

We need both.

Step 6 — Check nginx boot configuration

Run:

sudo systemctl is-enabled nginx

Expected:

enabled

Step 7 — Check PostgreSQL boot configuration

Run:

sudo systemctl is-enabled postgresql

Expected:

enabled.

##  N/B

How did i verify your application survives a reboot?

First, I verified that nginx, Atlas, and PostgreSQL were working. I then checked that their systemd services were enabled, not merely active. I rebooted the Ubuntu host and deliberately performed no manual service starts. After the machine came back, I tested the Atlas endpoint with curl and verified nginx, Atlas, and PostgreSQL were running. I also checked the expected listening ports with ss.

What's the difference between active and enabled?

active tells me the service is running now. enabled tells systemd to start that service automatically during boot. For reboot resilience, I need the required services to be both running and enabled.

Why did you use curl after the reboot?

curl tests the application from the HTTP layer. A service showing active isn't enough; I want to prove that a real HTTP request can actually reach Atlas and receive a valid response.

Why check the ports?

ss lets me verify that the expected services are actually listening. For Atlas v0.1, I expect nginx on port 80, the application on port 5000, and PostgreSQL on port 5432.

#  What is pg_lsclusters?


pg_lsclusters is a PostgreSQL utility on Debian and Ubuntu systems that lists the PostgreSQL clusters on the machine and shows information such as the PostgreSQL version, cluster name, port, status, owner, and data directory. I used it to verify that my PostgreSQL cluster was online after reboot.

N/B

systemctl status postgresql:   Is the PostgreSQL service managed by systemd?

pg_lsclusters:  Is the actual PostgreSQL cluster online?

And:

ss -tulpn | grep 5432:   Is something actually listening on PostgreSQL's port?