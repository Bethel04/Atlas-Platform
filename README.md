# Atlas
## Project Vision
Atlas is a practical learning project that brings together the fundamentals of
Linux, system administration, and networking concepts through hands-on labs. it
also documents linux commands, configurations, and lessons learned throughout 
the project. The goal is to build practical skills by applying what is learned
to single, continuously evolving project.
## Architecture so far
The current Atlas architecture consists of an ubuntu linux environment, a 
non-root deploy user and UFW configured to control network access.SSH key-based
authentication,while Nginx is configured as a reverse proxy and a web server.
the project is also maintained in a Git repository called atlas-platform,which 
contains the project's documentation, infratructure files, and other work.
## Pre-curriculum Linux Labs
Atlas inherited materials from the Linux labs completed before the Atlas
curriculum began. These materials include Linux fundamentals such as Linux
concepts, filesystem layout,Bash,SSH basics, as well as linux administration
and networking fundamentals. The inherited materials are stored under
'infra/legacy/' and includes topices such as IP addresses, DNS, ports, HTTP and 
HTTPS as part of the networking concepts studied. 
