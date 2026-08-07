#                               NETWORKING FUNDAMENTALS

KEY TOPICS

1. IP ADDRESSES
2. PUBLIC VS PRIVATE ADDRESSES
3. SUBNET MASKS(INTRODUCTION)
4. DNS (DOMAIN NAME SYSTEM)
5. PORTS
6. TCP VS UDP
7. HTTP VS HTTPS
8. NETWORKING TOOLS(ping,curl,ip,ss,netstat,dig,nslookup,traceroute)


#                           IP ADDRESSES
WHAT IS AN IP ADDRESS? 

An IP address (Internet Protocol Address)is a unique number assigned to a device on a network. Think of it as a home address.
just as a courier needs your house address to deliver a package, computers need an IP address to send and receive date.
without an IP address, devices cannot communicate on a network.

 REAL-LIFE EXAMPLE
Imagine you want to send a letter to your friend. you need: the recipient's address, The postal service,

ON A NETWORK:  
The IP address is the destination address. The network is the postal service. The data is the letter.

 EXAMPLE OF AN IPV4 ADDRESS
192.168.1.10.

An Ipv4 address has four numbers separated by dots. EXAMPLE: 192. 168. 1. 10
Each number is called an octet and can range from 0 to 255.

 EXAMPLE OF IPV6 ADDRESS
exmple; 
2001:0db8:85a3:0000:0000:8a2e:0370:7334

An Ipv6 address are 8 groups of hex numbers
#                                     TPYE OF IP ADDRESS
1. Private Ip Address:  
Used inside local networks such as: Homes,Schools,Offices. Example: 192.168.1.10, 10.0.0.5, 172.16.0.8
These addresses are not directly accessible from the internet.

2. Public Ip Address:  
Assigned by your internet service Provider(ISP).This is the address the rest of the internet sees when your network
communicates online.

HOW DOES IS WORK?
Your house = your device
Street Address = ip address
Post Office = Internet Routers
Letters/Data = website, video,message
SUPPOSE:
Your laptop has the private Ip. 192.168.1.10
Your router has a public ip assigned by your ISP

WHEN YOU VISIT A WEBSITE:
Your laptop sends the request to the router.
The router translates your Private IP to its public IP(using a process called NAT)
The website replies to the router's public ip 
The router sends the response back to your laptop

## VIEWING YOUR IP ADDRESS
STEP 1
Display all network interfaces: (ip a) Look for an interface such as: enp0s3, eth0, wlan0
Find the line beginning with: (inet): for example; inet 192.168.1.25/24

STEP 2
Display only your IP address: (hostname -I) This prints your system's IP address in a simpler format.

STEP 3
Display your hostname:(hostname) This shows your computer's network name.

# LESSON 2                       PUBLIC VS PRIVATE IP ADDRESSES

WHAT IS A PRIVATE IP ADDRESS?
A Private IP address is used inside a local network. EXAMPLES Of local networks: your home wi-fi, your school network
An office network
Private IP addresses cannot be reached direactly from the internet.

PRIVATE IP ADDRESS RANGES
There are three reserved ranges:
10.0.0.0 - 10.255.255.255.255
172.16.0.0 - 172.31.255.255
192.168.0.0 - 192.168.255.255

EXAMPLE:
192.168.1.10
10.0.0.25
172.16.5.8

WHAT IS A PUBLIC IP ADDRESS?
A public IP address is unique across the internet. it is assigned by your internet service provider(ISP)
When you visit a website like Google,the website sees your public ip, not your computer's private ip.
EXAMPLE: 105.112.45.67 (your public Ip will almost certainly be different.)

PRIVATE IP                                   VS               PUBLIC IP
Used inside local networks                                 used on the internet
not directly reachable from the internet              Reachable from the internet
Assigned by your router or local network               Assigned by your ISP

#            HOW DOES YOUR COMPUTER REACHES THE INTERNET?
IMAGINE this setup:
Laptop
Private IP:192.168.1.20
         |
   WI-Fi Router
public IP:105.112.45.67
         |
    internet

When your laptop sends a request:
1. The laptop sends it using its private IP.
2. The router replaces that private ip with its publice IP.
3. The website replies to the router's public IP
4. The router sends the reply back to your laptop.

This process is called NAT(NETWORK ADDRESS TRANSLATION).

#    NAT
WHAT IS NAT?
(NETWORK ADDRESS TRANSLATION) it translation: "1 public IP for many devices"
1. The problem NAT Solves
The internet ran out of public IPS. IPv4 only has 4.3 billion. but we have 10+ billion devices.
Solution: Let 100 devices in your house share 1 public IP.

2. HOW NAT WORKS- THE ANALOGY
Your Apartment Building = your home network
Street Address = your 1 public IP from ISP:102.89.12.45
Apartment numbers = Private IPS: 192.168.1.5, / 192.168.1.6
Doorman/router= NAT device

# WHAT HAPPENS:
1. your phone 192. 168.1.5 asks youtube.com for a video
2. Router/NAT changes the send to 102.89.12.45:54321 and remembers:"54321"=phone
3. youtube sends video back to 102.89.12.45:54321
4. Router/NAT looks at port 54321 and forwards it to your phone 192.168.1.5

The internet only sees your router's public IP.

# WE HAVE THREE TYPES OF NAT
    TYPE                WHAT IT DOES                                        USED FOR
1. static NAT        1 private IP , 1 pubulic IP. Always same.           servers.eg 192.168.1.10 = 102.89.12.50
2. Dynamic NAT        pool of public IPS. picks one free one                 companies with few public IPS
3. PAT/NAT          Many Private IPs , 1 public IP + different ports     your home router. this is 99% of NAT

PAT = Port address Translation. this is what your WI-FI router does.

# KEY BENEFITS OF NAT
1. Saves IPS- 1 public IP for whole house 
2. Security-internet can't directly see your laptop/phone. Router blocks incoming traffic by default
3. easy setup-ISP only gives you 1 IP

# NAT VS ROUTER
They are usually the same device.
Router = direct traffic between networks 
NAT = rewrites the IP addresses on that traffic

# summary 
NAT lets many devices with private IPS share one public IP by having the router rewrite addresses and track them with
ports.

# WHY DO WE NEED NAT?
imagine a family has:
3 phones
2 laptops
1 smart tv
that's 6 devices.

without NAT, the ISP would have to give 6 public IP addresses. instead: Each devices get a private IP,
The router gets one Public IP. NAT allows all evices to share that one public IP.
 
This saves public IP addresses and improves security.

# IDENTIFY YOUR PRIVATE IP
STEP 1
View your private IP addresss: hostname -I
check whether it starts with:(192.168, 10., 172.16 OR 172.31) if it does, it is a private IP.

STEP 2
RUN ip a 
find the inet line for your active network interface and compare it with the output of hostname -I.

#  CAN TWO COMPUTERS HAVE THE SAME IP ADDRESS?
The answer is: 
On the same network: No. Each device must have a unique IP address.
On different private networks: Yes. for example, millions of routers around the world have devices using 192.168.1.10 because those are private IP addresses.

# N/B
1. Static IP - never changes. used for servers
2. Dynamic IP- chanages sometimes. what your ISP gives your home
3. Local host-127.0.0.1 - "ME" refers to your own computer
4. DNS - turns names like google.com into IP addresses like 192.168.2.10

#summary
#evidence
 


# LESSON 3:                         SUBNET MASKS
WHAT IS A SUBNET MASKS?
A subnet mask tell a computer: which part of an IP address identifies the network. which part identifies the individual device
(host)

Think of it as a boundary line.

# REAL-LIFE EXAMPLE
Imagine this address: house 25. peace street. there are two parts: peace street = the network, house 25 = the specific house
In networking: 152.168.1.25
192.168.1 that's the network while 25 the Device(HOST).

#WHAT DOES /24 MEAN?
When you run: ip a, you might see:inet 192.168.1.25/24
The /24 is called the CIDR notation. It means: the first 24 bits identify the network. and The remaining 8 bits identify the
host.
For beginners, just remember: 192.168.1.25/24 means:Network 192.168.1.10 while Device 25

# COMMOM CIDR VALUES
CIDR            Subnet mask
/8              255.0.0.0
/16             255.255.0.0
/24             255.255.255.0
you will see /24 very often in home and small networks.

# WHY DO WE NEED A SUBNET MASK?
Imagine two computers:
pc A = 192.168.1.10/24
pc B = 192.168.1.20/24

Both are on the same network (192.168.1.0/24), so they can communicate directly.
Now imagine:
pc A = 192.168.1.10/24
pc B = 192.168.2.15/24

These are on different networks. to communicate, they need a router. the subnet mask helps linux decide:
"can i send this directly?"
"or do i need to send it to the router?"

# VIEWING YOUR NETWORK
STEP 1
RUN ip a:
 find your ip address. examPle: inet 192.168.1.25/24 (notice the /24).
STEP 2
RUN: IP route 
EXAMPLE: default via 192.168.1.1 dev enp0s3 192.168.1.0/24 dev enp0s3 proto kernel scope link src 192.168.1.25
WHAT DOES THIS MEAN?
default via 192.168.1.1 is your DEFAULT GATEWAY(ROUTER).
192.168.1.0/24 IS your local network.
src 192.168.1.25 is your computer's ip address.

# N/B 
WHEN YOU ARE WORKING IN AWS, AZURU, OR GOOGLE CLOUD, YOU WILL CONSTANTLY SEE SUBNET VALUES LIKE 
10.0.1.O/24
10.0.2.0/24
172.31.0.0/16
Understanding what /24 and /16 mean is essential because cloud networks are built using these subnet ranges.


## LESSON 4                          DNS(DOMAIN NAME SYSTEM)
WHAT IS DNS?
DNS stand for Domain Name System. it translates human-readable domain names into IP addresses. think of a DNS as the 
phonebook of the internet.
 The core problem DNS solves: computer talk in IP addresses. humans talk in name. E.G google.com = 192.168.1.20
DNS is the system that translate names into IPS IN <50MS.

## HOW DNS WORKS
You want to call "Mama Nkechi Restaurant" = you ask a friend, A friend ask directory service, directory service ask city hall.
city call get the number and then you call
same with DNS:
4 STEP DNS LOOKUP
1. Browser cache: " do i already know ggogle.com? No
2. Recursive Resolver: usually your ISP or 8.8.8.8 Google DNS. "hey, what's google.com?"
3. Root server to TLD(TOP LEVEL DOMAIN) SERVER TO Authoritative server:

Root "i don't know google, but .com server are here
TLD.com "i don't know google, but Google's server is here
Authoritative: "google.com is 142.168.23.2"
4. Back to you: resolver save it for 5 minutes and gives you the IP, Total time: 20-200ms

THE MAIN DNS RECORD TYPES 
Think of these as entries in the phonebook
Record                     Does what                      Example
A                       Domain name to IPV4               google.com to  142.162.55.20
AAAA                    Domain name to IPV6               google.com to 2a00:1453:....
CNAME                  Alis, Domain to Domain             www.google.com to google.com
MX                         Mail server                    gmail.com mail goes to gmail-smtp.google.com
TXT                         Text notes                      used for email security, domain verification
PTR                     IP to DOmain.Reverse DNS           8.8.8.8 to dns.google

# KEY DNS CONCEPT 
A. Recurisive Resolver = 1.1.1.1,8.8.8.8
Does all the work for you

Authoritative Server = Google's own DNS server. has the final answer for google.com

B. Caching and TTL
TTL = Time To Live. "CAche this for 300 seconds" why: it makes internet fast. if every site had to ask the root server,internet
would be dead.

C. Public DNS Providers
Provider               IP                     why people use it
Google DNS            8.8.8.8 /8.8.4.4        fast and reliable
CLoudflare              1.1.1.1               fast + privacy focused
ISP                     Varies                  Default, but often slow

## HOW TO USE/TEST DNS ON UBUNTU
COMMAND                            USES
nslookup google.com               Basic lookup
dig google,com                    Detailed, shows which server answered
dig MX gmail.com                  Get mail servers
dig google.com @1.1.1.1           Ask Cloudflare specifically
systemd-resolve --status                 see what DNS your PC is using

## COMMON DNS PROBLEMS
PROBLEM                       CAUSE                         FIX
Site can't be reached        DNS Down                  Change to 1.1.1.1
Old website shows           Cached DNS                 sudo systemd-resolve --flush-cashes
DNS Hijacking               ISP Injects ads            Use DNS over HTTPS
Slow internet                slow ISP DNS               Switch to Cloudflare/Google

## ADVANCED DNS STUFF
1. DNS over HTTPS DoH:Encryts DNS so ISP can't see what sites you visit
2. DNS over TLS DOT:Same idea, different method
3. DNS Load Balancing: google.com has 20 different IPS. DNS gives you the closest one 
4. Split-Brain DNS: company shows interant.company.com as 192.168.1.10 inside and 2003.0.113.5 outside

## DNS VS OTHER STUFF
               DNS                 NAT                             IP
 JOB         Name into IP       many IPs into one IP           Address of device
Analogy        Phonebook          Apartment Doorman                House Address


## IMPORTANT DNS COMMANDS
1. ping run: If DNS is working, Linux first resolves google.com into an IP address before sending the ping. to stop it press 
CTRL + c
2. nslookup run: nslookup google.com it displays: The DNS server used. the IP address of the domain. if you get command 
'nslookup' not foumd: install it: sudo apt update then sudo apt install dnsutils
3. dig run: dig google.com
dig provides more detailed DNS information than nslookup. it is widely used by linux administrators and Dev0ps engineers.

# N/B
WHAT HAPPENS IF DNS STOPS WORKING?
YOU CAN STILL COMMUNICATE USING IP ADDRESSES IF YOU KNOW THEM. HOWEVER, DOMAIN NAME LIKE GOOGLE.COM WON'T WORK BECAUSE YOUR
COMPUTER CAN'T TRANSLATE THEM INTO IP ADDRESSES. 
FOR EXAMPLE: HTTPS://GOOGLE.COM (FAIL IF DNS IS NOT WORKING)
HTTPS://142.125.23.1 (MAY WSTILL WORK IF THE SERVER ACCEPTS DIRECT IP ACCESS)

#N/B
"THE WEBSITE IS DOWN", ONE OF THE FIRST THING A DEV0PS ENGINEER CHECKS IS: IS DNS RESOLVING CORRECTLY?
IS THE SERVER REACHABLE? IS THE WEB SERVICE RUNNING?

DNS PROBLEMS ARE COMMON CAUSE OF CONNECTIVIRTY ISSUES.

##SUMMARY
## EVIDENCE



## LESSON 5                               PORTS
WHAT IS PORT?
A port is a communication endpoint on a computer. Think of an Ip address as the address of an apartment building. 
The port is the apartment number.
example: Apartment Building (IP Address):192.123.23.12, 
Apartment 22 for SSH
Apartment 80 for HTTP
Apartment 443 for HTTPS

Without ports, your computer would not know which aplication should receive incoming data.
 
## HOW PORTS LOOK 
IP: PORT FORMAT
EXAMPLES:142.250.187.78:443 / 196.32.45.1:25565

# THE THREE CATEGORIES OF PORT-0 TO 65535
RANGE             NAME                         WHO USES IT                             EXAMPLES
0-1023         Well-know ports                 system/os only.needs admin to open    80=HTTP,443=HTTPS,22=SSH,25=SMTP
1024-49151       Registered ports               common apps                          3306=MYSQL,5432=Postgre SQL,25565=Minecraft
49152-65535         Emhemeral/Dynamic ports     Temporary. your Pc picks these       when you browse, your pc uses 54321

## TCP VS UDP PORTS
ports work with two main delivery protocols
                     TCP                                   UDP
    WHAT        Reliable,checks delivery           fast. no checking
    use        Websites, email,SSH,Downloads        Gaming, Video calls, DNS Streaming
    ANALOGY       Registered mail with signature         Radio broadcast

MOST SERVICE HAVE BOTH:443/TCP AND 443/UDP

## THE MOST IMPORTAN PORTS TO KNOW
PORT                    PROTOCOL             SERVICE               WHAT IT DOES
80                        TCP                HTTP                    REGULAR WEBSITE
443                       TCP                HTTPS                 SECURE WEBSITES
22                        TCP                 SSH                   REMOTE INTO LINUX SERVERS
21                        TCP                 FTP                   FILE TRANSFERS
25,587                    TCP                SMTP                   SENDING EMAIL
53                        UDP/TCP            DNS                    DOMAIN NAME LOOKUPS
3306                      TCP                MYSQL                  DATABASSES
25565                     TCP                MINECRAFT              GAME SERVER
3074                    UDP/TCP            PLAYSTATION/XBOX           GAMING

## PORT + NAT + FIREWALL
THIS IS WHERE IT ALL CONNECTS:
1. YOUR PC:OPENS PORT 54321 TO TALK TO YOUTUBE
2. ROUTER NAT: REMEMBERS PUBLIC IP:54321 =YOUR PC
3. FIREWALL: BLOCKS EVERYTHING EXCEPT PORT YOU ALLOW. DEFAULT= "BLOCK ALL INCOMING"

THAT IS WHY YOU NEED PORT FORWARDING TO LET PEOPLE CONNECT IN TO PORT 25565 ON YOUR SERVER.

## HOW TO CHECK PORTS ON UBUNTU
COMMADS                               USES
sudo ss -tulnp                    see what ports are open on your pc
sudo lsof -i :80                  what program is using port 80
sudo ufw status                   see firewall rules
sudo nmap localhost               scan your own pc for open ports

CHECK IF A PORT IS OPEN FROM OUTSIDE: nc -vz google.com 443

## COMMON PORT PROBLEMS
PROBLEM                          WHY IT HAPPENS                          FIX
PORT ALREADY IN USE              2 APPS WANT SAME PORT                KILL OLD APP OR USE DIFFERENT PORT
CAN'T CONNECT TO SERVER         FIREWALL BLOCKING PORT                sudo ufw allow 25565/tcp
CONNECTION REFUSED              NOTHING LISTENING ON THAT PORT        START THE SERVER APP
PORT FORWARD NOT WORKING          DOUBLE NAT OR WRONG IP               SET STATIC IP + BRIDGE ISP ROUTER

## KEY RULES
1. onlu 1 app per port-you can't run 2 websites on same ip
2. port<1024 need root-that's why web servers run as admin
3. closing ports=securty- hackers scan for open pors, close what you dont use
4. ephemeral ports-your browser uses random high ports to talk out.

## summary
A PORT IS A 16-BIT NUMBER 0-65535 THAT LETS ONE IP ADDRESS RUN MANY DIFFERENT SERVICE AT THE SAME TIME.


## WHAT IS A SOCKET?
When an IP address and a port are combined. they form a socket.
example: 192.123.45.12:22
this uniquely identifies the SSH service on that computer.

VIEWING OPEN PORTS
USING ss
run; ss -tuln
this displays listening TCP and UDP ports. 
meaning of the options: -t for tcp, -u for udp, -l for Listening ports ,-n for show numeric port number(don't translate names)

USES netstat: IF IT IS NOT INSTALLED: sudo apt update, sudo apt install net-tools



## LESSON 6                     TCP VS UDP
WHTA IS TCP?
Stands for Transmission control protocol. It is a communication protocol that ensures data is delivered: Reliably, in the 
correct order, without missing pieces.
THink of TCP as sending an important document by registered mail. you want confirmation that it arrived safely.

WHAT IS UDP?
UDP stands for user datagran Protocol. it sends data without checking if it arrived.it is:faster,simpler,less reliable
THink of UDP as making a public anouncement with a loudspeaker. you speak once and don't wait for everyone to confirm they
heard you.
 
#                                TCP VS UDP COMPARISON
TCP                             UDP
RELIABLE                    LESS RELIABLE
CONNECTION-ORIENTED          CONNECTIONLESS
SLOWER                        FASTER
GUARANTEES DELIVERY           NO GUARANTEE OF DELIVERY
DATA ARRIVES IN ORDER          DATA MAY ARRIVE OUT OF ORDER

## THE TCP THREE-WAY HANDSHAKE
Before TCP sends data, it establishes a connection. this process is called the three-way handshake.
STEP 1
The client says: Hello I'd like to connect. this is called a SYN(Synchronize) packet.

STEP2
The server replies: Hello i recieved your request and i'm ready.
This is a SYN-ACK (SYNCHRONIZE-ACKNOWLEDGE)PACKET.

STEPS 3:AXK
The client responds: Great! let's start communicating. This is an ACK(ACKNOWLEDGE)Packet,
The connection is now established.
             CLIENT                         SERVER
               |                               |
               |--------------SYN------------->|
               |<-----------SYN-ACK----------->|
               |---------------ACK------------>|
               |==========DATA TRANSFER========|

# WHY DOES TCP USE THE HANDSHAKE?
The handshake makes sure: Both devices are ready. Both agree to communicate.Data transfer starts reliable.

## REAL-WORLD EXAMPLE
APPLICATION THAT USE TCP
1. WEB BROWSING(HTTP/HTTPS)
2. SSH
3. EMAIL
4. FILE TRANSFERS

These applications need reliable delivery.

APPLICATION THAT USE UDP
1. VIDEO CALLS 
2. LIVE STREAMING
3. ONLINE GAMING
4. VOICE CALLS (VolP)

These applications prioritze speed.losing a small amount of data is often better than waiting for retransmissions.

VIEWING TCP AND UPD CONNECTIONS
STEP 1
Display TCP connection: ss -t

STEP 2
Display UDP connections; SS -U

STEP 3
DIsplay both listening TCP AND UDP Ports: ss -tuln
look for: TCP entries(often shown as tcp). UDP entries(often shows as udp)

## SUMMARY
TCP STANDS FOR TRANSMISSION CONTROL PROTOCOL.
UDP STANDS FOR USER DATAGRAM PROTOCOL.

UDP IS FASTER BECAUSE IS DOES NOT WAIT FOR ACKNOWLEDGEMENT.
TCP IS RELIABLE BECAUSE IT ENSURES DATA IS DELIVERED CORRECTLY AND IN ORDER,

WHAT ARE THE THREE STEPS OF THE TCP HANDSHAKE? 1.SYN, 2.SYS-ACK. 3, ACK
A SIMPLE WAY TO REMEMBER THEM IS:
SYN FOR CAN WE CONNECT?
SYN-ACK FOR YES, I HEAR YOU.
ACK FOR GREAT,LET'S BEGIN.



## LESSON 3                      HTTP VS HTTPS
WHEN YOU OPEN A WEBSITE, YOUR BROSWER COMMUNICATES WITH A WEB SERVER USING EITHER HTTP OT HTTPS.

WHAT IS HTTP?
HTTP stand for Hypertext Transfer protocol. it is the protocol used to transfer web pages between: your browser(client)
A web server
EXAMPLE:
          BROWSER---------------HTTP
            -------------->WEB SERVER
HTTP USES PORT 80

# PROBLEM WITH HTTP
HTTP send data as plain text. this means that if someone intercepts the traffic, they may be able to read it.
imagine sending a postcard through the mail. anyone who handles it can read the message. for example, if you enter:
USERNAME
PASSWORD
CREDIT CARD NUMBER

over plain HTTPS, That information is not encrypted.


WHAT IS HTTPS?
HTTPS Stands for hypertext transfer protocol secure. it is HTTP with an added layer of securty. HTTPS encryptes the data
before it is sent.
EXAMPLE:
             BROWSER --------- ENCRYPTED HTTPS
              ----->WEB SERVER
HTTPS USES PORT 443


## WHAT IS ENCRYPTION?
Encryption is the process of coverting readable data into unreadable data.
exampl: without encryption, password:prince123. 
with encryption. password:x9@#a7klp..

Only the intended recipient can decrypt it and read the orginal message.


### WHAT IS SSL/TLS?
SSL(SECURE SOCKETS LAYER) and its modern replacement, TLS(TRANSPORT LAYER SECURITY), are the technologies that make HTTPS
secure.
When you visit a website using HTTPS:
1. you browser checks the website's certificate.
2. it verifies that the certificate is valid.
3. A secure encryted connection is estabkished.
4. data is exchaged safely.

## HOW CAN YOU TELL A WEBSITE USES HTTPS?
Look at the address bar. HTTP: HTTP://JW.ORG. OR HTTPS:HTTPS://JW.ORG
you will usually also a padlock icon next to the website address.

# HTTP VS HTTPS
HTTP                          HTTPS
PORT 80                     PORT 443
NOT ENCRYPTED                ENCRYTED
LESS SECURE                  MORE SECURE
NO SSL/TCP                  USES SSL/TLS

## TESTING HTTP AND HTTPS
we will use curl, a command-line tool for making web reuests.
STEP 1
Request a website over HTTP: curl -i http://jw.org
The -i option requests only the http headers.

STEP 2
request the same website over https: curl https://jw.org

COMPARE THE RESPONSES.

STEP 3
if nginx is installed on your vm, ext it locally: curl http://localhost
if nginx is running, you should see tha default web page or the html it serves.

# N/B
WHY IS HTTPS SAFER THAN HTTP?
ANS: BECAUSE HTTPS ENCRYPTS THE DATA USING TLS, MAKING IT MUCH HARDER FOR ATTACKERS TO READ OR MODIFY THE INFORMATION WHILE IT
IS BEING TRANSMITTED.

# N/B
WHEN DEPLOYING A WEB APPLICATION, ONE OF YOUR REPONSIBILITIES IS TO: CONFIGURE THE WEB SERVER(SUCH AS NGINX) TO SUPPORT HTTPS.
INSTALL A VALID TLS CERTIFICATE. REDIRECT HTTP TRAFFIC TO HTTPS SO USERS ALWAYS USE THE SECURE VERSION OF THE SITE.

THIS IS A STANDARD PRACTICE FOR PRODUCTION SYSTEMS.

