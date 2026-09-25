import subprocess
import os

result = subprocess.run(["systemctl", "is-active", "atlas"],
  capture_output=True,
  text=True
  )

print("output:", result.stdout.strip())
print("Exit code:",result.returncode)

url=os.getenv("ATLAS_URL")
print(url)