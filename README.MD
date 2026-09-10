## ATLAS

Version:v0.1
Project: Atlas Platform1
Status: Foundation / Early Development

## Project Vision

Atlas is a simple Notes REST API (Flask or Node, backed by Postgres) - deliberately unglamorous, because the point is never the app itself. 
What evolves relentlessly across 15 months is everything around it: how it's deployed, secured,scaled, observed, and recovered. This 
mirrors how real DevOps/Platform Engineering portfolios are judged - nobody hires a DevOps engineer for the app code.

#   Architecture So Far
Atlas is being developed on linux environment and currently includes:
- users and group management 
- linux file permissions and ownership
- ssh remote-access configuration 
- ssh key-based authentication
- ufw firewall configuration 
- nginx web server 
- nginx reverse-proxy configuration.

# What Atlas Inheritend from the pre-curriculum linux labs

Atlas did not begin from zero.

Before Atlas became the main project, a series of independent linux and networking labs were completed to establish the foundational knowlegde.

## Linux Foundations

Key Topics:

1. What is linux
2. Filesystem layout
3. Shell basics
4. Files, directories, permissions
5. SSH basics

## Linux Administration

The pre-curriculum labs established practical knowledge of:

KEY TOPICS
1. Users and Groups
2. File ownership and permissions(advanced)
3. processes
4. service with systemd
5. package management
6. system logs

## Networking Fundamentals

THe earlier networking labs established knowledge of:

KEY TOPICS

1. IP ADDRESSES
2. PUBLIC VS PRIVATE ADDRESSES
3. SUBNET MASKS(INTRODUCTION)
4. DNS (DOMAIN NAME SYSTEM)
5. PORTS
6. TCP VS UDP
7. HTTP VS HTTPS
8. NETWORKING TOOLS(ping,curl,ip,ss,netstat,dig,nslookup,traceroute)
