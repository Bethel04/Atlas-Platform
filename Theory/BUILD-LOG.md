# Atlas Build Log

## 2026-08-17 — Nginx + GitHub Project Day

### Objective

Apply the full Git branching and Pull Request workflow to Atlas and add the Nginx reverse proxy configuration as tracked infrastructure code.

### Work completed

- Confirmed the Atlas backend is running on `127.0.0.1:8080`.
- Configured Nginx as a reverse proxy.
- Verified the Nginx configuration successfully.
- Created the `feature/nginx-config` feature branch.
- Added `infra/nginx/atlas.conf` to the Atlas repository.
- Committed the Nginx configuration with a meaningful commit message.
- Pushed the feature branch to GitHub.
- Opened and reviewed a Pull Request.
- Approved and merged the Pull Request into `main`.
- Created and pushed the `v0.1` Git tag.

### Nginx architecture

Browser
    ↓
Nginx :80
    ↓
Atlas backend :8080

### Git workflow

feature branch → commit → push → Pull Request → review → merge → tag

### Verification

The repository was updated successfully and the Nginx configuration is now tracked as code under:

`infra/nginx/atlas.conf`

### Weekly milestone

The week's Git branching and Pull Request workflow has been applied to the Atlas project.

Status: COMPLETE


## MONDAY WEEK 3 TASK 

Monday
- Created the Atlas app directory
- Created a Python virtual environment
- Discovered python3.14-venv was missing
- Installed python3.14-venv
- Activated .venv
- Installed Flask 3.1.3
- Created the initial Flask API
- Started the local development server
- Tested GET /
- Tested GET /notes
- Added .gitignore so .venv isn't tracked
- Committed the application scaffold

python3 -m venv .venv
→ failed because python3.14-venv was missing
→ installed the required package
→ recreated the environment successfully

### Verification

- Flask development server started successfully on 127.0.0.1:5000
- GET / returned {"message": "Atlas is running"}
- GET /notes returned {"notes": []}
- .venv is ignored by Git

### Weekly milestone

The Atlas Flask application scaffold is working locally. PostgreSQL integration remains to be completed as part of the database/deployment stage.

Status: IN PROGRESS

##       WEDNESDAY
Absolutely. Let's turn your **Wednesday build log** into a student-style record where **each task has the command you actually used underneath it**.

# Wednesday — Manual Atlas Deployment

### 1. Started Atlas Flask application on the Ubuntu host

**Command:**

```bash
python app.py
```

**What it did:**

Started your Flask application.

Expected output:

```text
* Serving Flask app 'app'
* Running on http://127.0.0.1:5000
```

---

### 2. Configured Nginx as a reverse proxy

**Created the Atlas Nginx configuration:**

```bash
sudo nano /etc/nginx/sites-available/atlas
```

**Configuration inside the file:**

```nginx
server {
    listen 80;
    server_name _;

    location / {
        proxy_pass http://127.0.0.1:5000;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    }
}
```

**Enabled the configuration:**

```bash
sudo ln -s /etc/nginx/sites-available/atlas /etc/nginx/sites-enabled/atlas
```

**Tested the configuration:**

```bash
sudo nginx -t
```

Expected:

```text
syntax is ok
test is successful
```

---

### 3. Nginx listens on HTTP port 80

**Command used to verify:**

```bash
sudo ss -tlnp | grep -E ':80|:5000'
```

You saw:

```text
0.0.0.0:80       nginx
127.0.0.1:5000   python
```

This means:

```text
Nginx → port 80
Flask → port 5000
```

---

### 4. Nginx forwards requests to Flask on `127.0.0.1:5000`

**Reloaded Nginx after configuration:**

```bash
sudo systemctl reload nginx
```

**Tested Nginx → Flask:**

```bash
curl http://127.0.0.1
```

Response:

```json
{
    "message": "Atlas is running"
}
```

This proved:

```text
curl
 ↓
Nginx :80
 ↓
proxy_pass
 ↓
Flask :5000
```

---

### 5. Confirmed local HTTP access with curl

**Direct Flask test:**

```bash
curl http://127.0.0.1:5000
```

Response:

```json
{
    "message": "Atlas is running"
}
```

**Nginx test:**

```bash
curl http://127.0.0.1
```

Response:

```json
{
    "message": "Atlas is running"
}
```

---

### 6. Confirmed external HTTP access from another device

First, we found the Ubuntu machine's IP:

```bash
ip a
```

Your Ubuntu IP was:

```text
10.125.95.242
```

We also allowed HTTP through UFW:

```bash
sudo ufw allow 80/tcp
```

Then from your **phone/another device**, you opened:

```text
http://10.125.95.242
```

And Atlas responded successfully.

---

### 7. Atlas returned `"Atlas is running"` successfully

**Command used on Ubuntu:**

```bash
curl http://10.125.95.242
```

Response:

```json
{
    "message": "Atlas is running"
}
```

And from your phone:

```text
http://10.125.95.242
```

also worked. ✅

---

# Your complete Wednesday command record

```bash
# Start Flask
python app.py

# Create Nginx Atlas configuration
sudo nano /etc/nginx/sites-available/atlas

# Enable Atlas site
sudo ln -s /etc/nginx/sites-available/atlas /etc/nginx/sites-enabled/atlas

# Test Nginx configuration
sudo nginx -t

# Reload Nginx
sudo systemctl reload nginx

# Check Nginx and Flask ports
sudo ss -tlnp | grep -E ':80|:5000'

# Test Flask directly
curl http://127.0.0.1:5000

# Test Nginx → Flask
curl http://127.0.0.1

# Check Ubuntu IP
ip a

# Allow HTTP through firewall
sudo ufw allow 80/tcp

# Test using Ubuntu's network IP
curl http://10.125.95.242
```

### And the Git work

```bash
# Check changes
git status

# Stage changes
git add .

# Stage requirements.txt from parent directory
git add ../requirements.txt

# Commit
git commit -m "Deploy Atlas behind nginx"

# Push to GitHub
git push origin main

# Final check
git status
```

**This is a very good Wednesday build-log entry because it records not just what you accomplished, but the commands you used to prove each part worked.**
