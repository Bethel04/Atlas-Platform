##    Scaffold the Atlas app itself - a simple Notes REST API (Flask or Node) backed by Postgres; run it locally first. 

Key ideal: 
We are building a small notes Rest API. think of it like this:
my laptop----->flask to (http)---->REST API to(SQL) ---->postgreSQL--->Notes

the user sends requests such as: POST  /note, use to create note or GET /notes to retrive notes.

# What does "scaffold" mean?

Scaffold means creating the basic structure of an application before building all its features.
for example:
For our Atlas-plaform directory we will included:
- app
- __init__.py
- routes.py 
- db.py

then in our texts/ file we will have:
- .gitignore
- requirements.txt
- README.md

Full breakdown:
- Atlas-platform: This is the root directory of my project
- app: My main application code, this is called an application package or blueprint. keeps all my code together.
- __init__.py: That is our initializer file. makes app a proper  python package. this is where i crete and configure the flask app.
- routes.py: this where all URLs/endponit live here. this handles all the routing logic. when user goes to /, this file decides what to return.
- db.py: is is my database connection and models. example: functions to connect to postgres/MYSQL, this separates database logic from web logic. 

2. TESTS/ - this is where i put automated tests with pytest, to make sure my routes and DB functions work before  i deploy.
- .gitignore: tells git what files note to track or upload to Github. i do not want to push my virual environment, secrets, or cache files to git.
- requirements.txt: this is the list of all the list of python packages my app needs. like:(flask,SQLAlchemy,gunicorn). this lests anyone clone my 
repo and insall all dependencies with one command, 
-README.md: my documentation for humas, my project name, how, to instal, how to run, how to deploy. so that i and another dev can understand how to set
this up in 6 months later.

#   What is Flask?

Flask is a python web framework. it allows python to receive HTTP requests and send HTTP responses. 
for example: brower/curl send GET /notes---flask---PosgreSQL---Flask----response---Browser/curl.

What is REST?

REST is a common way of designing APIs around resources. our resources is : notes
We can use http methods:

Method___________________________________purpose 
- GET_____________________________________ Read
- POST____________________________________create 
- PUT/PATCH_______________________________update
- DELETE__________________________________delete

so: GET /notes. means: Give me the notes.
post /notes, means: create a new note

#    What is an API?

API means Application Programming Interface, THis is a set of rules that lets two software programs talk to each other.
example: client, i send "give me notes"----API, "database, give me the notes"----postgreSQL, give the note to---API--Client.

N/B

The client doesn't directly talk to PostgreSQL. the flask API sit in between.

#    PostgreSQL

PostgreSQL is a ralational database management system. it stores our notes, the database persists the information. if flask stops running, the notes 
remain in PostgreSQL.

# fLASK VS PostgreSQL
Flask = application/API layer
PostgreSQL = database/data layer

they have two different jobs. (Clent ---Flask API --- Postgresql)

## Project- Build Atlas Notes API
