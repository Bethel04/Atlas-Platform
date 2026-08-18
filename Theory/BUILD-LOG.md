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
