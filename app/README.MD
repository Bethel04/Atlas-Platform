Explaination of my Atlas_app deployment.
I deployed a Flask Notes API on an Ubuntu desktop.
 PostgreSQL stores the application's data, with a dedicated database user following least-privilege principles. 
 Gunicorn runs the Flask application, while Nginx acts as a reverse proxy and exposes the application over HTTP. 
 I created a systemd service so Atlas starts automatically at boot and can restart if it crashes. 
 I configured the VM's firewall and SSH access, and I use systemctl, ss, curl, journalctl and other networking tools to troubleshoot the deployment.