import requests
import os
import sys

url = "http://127.0.0.1:9999"
response = requests.get(url)

print(response.status_code)

if response.status_code == 200:
  print("health check passed")
  sys.exit(0)
else:
    print("health check failed")
    sys.exit(1)  