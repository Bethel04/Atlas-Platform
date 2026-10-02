import requests

url = "http://127.0.0.1:5000"

def check_health():
    response = requests.get(url)
    return response