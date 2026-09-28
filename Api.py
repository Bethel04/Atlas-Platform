import requests
import os
import sys

response = requests.get("https://api.github.com")

API_Key = os.getenv("API_Key")

print(response.status_code)

if response.status_code == 200:
   print("health check passed")
   sys.exit(0)
else:
   print("health check failed")
   sys.exit(1)