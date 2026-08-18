from flask import Flask

app = Flask(__name__)


@app.get("/")
def home():
    return {"message": "Atlas is running"}


@app.get("/notes")
def get_notes():
    return {"notes": []}

if __name__ == "__main__":
    app.run(debug=True)
