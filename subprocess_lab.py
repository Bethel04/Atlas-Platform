import subprocess
import os
import argparse

result = subprocess.run(["systemctl", "is-active", "atlas"],
  capture_output=True,
  text=True
  )

print("output:", result.stdout.strip())
print("Exit code:",result.returncode)

url=os.getenv("ATLAS_URL")
print(url)

parser = argparse.ArgumentParser()
parser.add_argument("--name")
parser.add_argument("age")
args = parser.parse_args()
print(args.name)
print(args.age)