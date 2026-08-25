from flask import Flask, request

app = Flask(__name__)


@app.get("/")
def home():
    return {"message": "Atlas is running"}


@app.get("/notes")
def get_notes():
    return {"notes": []}


@app.post("/notes")
def create_note():
    data = request.get_json()

    title = data["title"]
    content = data["content"]

    return {
        "message": "Note received",
        "title": title,
        "content": content
    }
if __name__ == "__main__":
 app.run(debug=True)