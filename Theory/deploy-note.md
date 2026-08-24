## Deploying a Real App on the VM

1. Flask

Flask is a Python web framework.

Framework means:

A collection of tools and rules that makes building an application easier.

Without Flask, Python can still do things, but you'd have to handle much more of the web machinery yourself.

Flask gives us a way to say:

When somebody sends a request to /notes,
run this Python code.

For example:

GET /notes

Flask can respond:

[
  {
    "id": 1,
    "title": "Linux",
    "content": "Learn Linux"
  }
]


##       TUESDAY

# Atlas Build Log

## Tuesday — Flask API and PostgreSQL Foundation

### Objective

Build the initial Atlas Notes REST API and prepare PostgreSQL as the application's database.

### Work Completed

- Created the Python virtual environment for the Atlas application.
- Installed Flask.
- Installed `psycopg` and `psycopg-binary` for PostgreSQL connectivity.
- Created the `app/` directory.
- Created `app/app.py`.
- Built the initial Flask application.
- Added the `/` endpoint.
- Added the `/notes` endpoint.
- Started the Flask development server successfully.
- Tested the application with `curl`.
- Confirmed that `/` returned:
  `{"message": "Atlas is running"}`
- Confirmed that `/notes` initially returned an empty notes list.
- Installed and verified PostgreSQL 18.
- Created the `atlas_notes` database.
- Created the `atlas_app_user` PostgreSQL application user.
- Connected successfully to `atlas_notes` using `atlas_app_user`.
- Fixed schema permissions for `atlas_app_user`.
- Created the `notes` table.
- Verified the table structure.
- Inserted the first test note.
- Successfully retrieved the test note using SQL.

### Database Structure

```text
PostgreSQL
└── atlas_notes
    └── public
        └── notes
            ├── id       INTEGER PRIMARY KEY
            ├── title    VARCHAR(200) NOT NULL
            └── content  TEXT NOT NULL