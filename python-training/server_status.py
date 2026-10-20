server_name=" atlas.service "
status="running"
project="atlas platform"

server_name=server_name.strip()
print(server_name)
status=status.upper()
print(status)
print(len(project))
print(f"make{server_name} keep {status}")
print(project.title())