import subprocess
resuit = subprocess.run(
    ["hostname"],
  capture_output=True,
  text=True
)
print("my hostname is:", resuit.stdout)    
