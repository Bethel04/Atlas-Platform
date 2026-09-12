##    Scaffold the Atlas app itself - a simple Notes REST API (Flask or Node) backed by Postgres; run it locally first. 

Key ideal: 
We are building a small notes Rest API. think of it like this:
my laptop----->flask to (http)---->REST API to(SQL) ---->postgreSQL--->Notes

the user sends requests such as: POST  /note, use to create note or GET /notes to retrive notes.

# What does "scaffold" mean?

Scaffold means creating the basic structure of an application before building all its features.

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

## Project- Build Atlas APP

step 1. create the Atlas application directory. using mkdir atlas-app, enter the directory using cd Atlas-app.
step 2. create a python virtual environment, because we do not want Atlas's Python packages mixed with ubuntu's system python.
run:
python3 -m venv .venv
think of .venv as a private python environment for atlas. we activate it using **source .venv/bin/activate** the .venv tells me: "i am currently using 
Atlas's private python environment.

step 3. install flask and postgreSQL libraries. RUN: pip install flask psycopg2-binary. were are installing two thing, the Flask.(this is the python 
frameworkk that will allow use to create our web API). psycopg2 psycopy2 allows Python/Flask to communicate with postgreSQL. 
step 4. create the application file RUN: touch app.py, to create an empty file, then we check it using ls.
step 5. put the first flask application in app.py using nano app.py, after that i run python app.py, is will show that the app is running locally
in my virtual enviroment.then we open another terminal and test it using curl http://127.0.0.1:5000. WE SEE THE MESSAGES ATLAS IS RUNNIG.

let the atlas_app the permission it needs inside atlas_notes, run sudo -u postgres psql -d atlas_notes. i should see, atlas_notes=#.
give atlas_app access to the public achema. run inside postgreSQL: GRANT USAGE ON SCHEMA PUBLIC TO atlas_app;. which mean atlas_is allowed to use the 
public schema. then we can grant the permission is need
