# Atlas Automation

This directory contains automation scripts developed during the Atlas project.

The goal of these scripts is to automate common Atlas operational tasks such as deployment, application health checks, database backups, error handling, and scheduled tasks.

## Automation Scripts

### deploy_atlas.sh

Automates the Atlas deployment workflow.

The script is designed to:

1. Move into the Atlas project directory.
2. Update the project from Git.
3. Restart the Atlas systemd service.
4. Verify that the service is running.
5. Run the Atlas health check.
6. Report whether the deployment succeeded or failed.

### health.py

Checks whether the Atlas application is responding.

The health check uses Python and the `requests` library to send an HTTP request to the Atlas application.

A successful HTTP response indicates that the application is responding.

### backup_atlas_db.sh

Creates a backup of the Atlas PostgreSQL database.

The backup process uses:

text

PostgreSQL
    ↓

pg_dump
    ↓

gzip
    ↓

timestamped backup file


The database used by Atlas is `atlas_notes`.

Backups are stored locally for now. S3 storage will be introduced later in the project.

## Bash Automation Concepts

During this month, the Atlas automation work covered:

* Bash variables
* Command-line arguments
* `$1` and `$@`
* Conditionals
* Loops
* Functions
* Exit codes
* `set -euo pipefail`
* File checks
* `grep`
* `sed`
* `awk`
* Error handling
* Idempotent scripts
* Logging
* Cron jobs

## Python Automation Concepts

The Python automation work covered:

* Python functions
* The `requests` library
* HTTP health checks
* Environment variables
* `os`
* `sys.exit()`
* Python logging
* Bash calling Python

## Error Handling

Automation scripts should detect failures instead of continuing as though everything succeeded.

Successful operations use exit code `0`.

Failures use a non-zero exit code.

This allows other scripts and scheduled jobs to determine whether an operation succeeded or failed.

## Testing

The automation scripts are tested using:

* Manual execution
* ShellCheck for Bash scripts
* Python execution
* Pytest for Python testing
* HTTP health checks
* Service status checks
* Backup verification

## Scheduled Automation

Cron is used to schedule recurring tasks.

The database backup automation is designed to run automatically on a schedule rather than requiring the backup command to be executed manually every time.

## Secrets

Secrets must not be committed to Git.

Examples include:

* Database passwords
* `.env` files containing real secrets
* Webhook URLs
* API tokens
* Credentials

Example configuration files may be committed when they contain only placeholder values.

## Backup Files

Database backup files should not be committed to the Git repository.

They may contain application or database data and are treated separately from source code.

## Purpose of the Automation Directory

The `automation/` directory keeps Atlas operational scripts organized in one location.

The scripts automate repeatable tasks while the README documents their purpose, usage, testing, and failure behavior.

## Current Automation Flow

text
Atlas deployment
      ↓

deploy_atlas.sh
      ↓

systemd service
      ↓

health.py
      ↓

HTTP health check
      ↓

success / failure


Database backup:

text
PostgreSQL
      ↓

backup_atlas_db.sh
      ↓

pg_dump
      ↓

gzip
      ↓

timestamped backup

