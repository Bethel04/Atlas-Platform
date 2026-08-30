## RUNBOOK FOR MY ATLAS_APP FAILURE
Failure:
 sudo systemctl stop postgresql
PostgreSQL stopped

Symptom:
Atlas cannot access database

How I found it:
systemctl = systemd service manager
ss = socket statistics. this shows active 
connections. using ss -tulpn | grep 5432

curl = this is a tool to send requests to websites, APIs, or servers from the terminal.
curl http://localhost:5432

journalctl = used to read my system logs. to check the logs of my postgresql i used the command journalctl -u postgresql.

Root cause:
PostgreSQL was stopped

Fix:
Start PostgreSQL, using sudo systemctl start postgresql

Verification:
curl /notes
