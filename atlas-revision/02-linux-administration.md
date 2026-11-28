# Linux Administration Essentials

## 1. User and Group Manangement.

## 2.File Ownership and Permissions.

## 3. Process Management.

## 4 Package Mangement.

## 5 System Services and systemd.

## 6 System Logs and Troubleshooting.


### 1. User and Group Management

#### 1.1 Introduction to Linux Users

Linux is a multi-user operating system that allows multiple users to access and use the same computer or server with different permissions and levels of access.

User management helps administrators control who can access the system and what each user is allowed to do.

#### 1.2 Types of Linux Users 
**Root User**

The root user is the superuser in Linux. It has almost complete control over the system and can perfrom administrative tasks such as installing software,managing users, modifying system configurations and controlling sevices.

The root user has a UID of 0.

**Regular Users**

Regular users are ordinary accounts created for people who need to access the system. they have limited perssions and generally require elevated privileges to modify protected system files.

**System Users**

System users are accounts used by system services and applications to perform background operations. Examples include WWW-data and postgres.

#### 1.3 Understanding UID

UID stands for User ID. It is a numerical identifier assigned to every Linux user.

- Root user:UID 0.
- Regular user:commonly UID 1000 and above.
- System users:commonly assigned lower UIDs, depending on system configuration.

#### 1.4 Important User Management Commands

| command | Purpose |
|---------|---------|
|`whoami` | Displays the current username. |
|`id` | Displays users ID and grup information. |
| `who` | Shows currently logged in users. |
|`sudo` | Executes commands with elevated privileges. |
| `su` | Switches to another user. |
| `useradd` | Create a user account. |
| `usermod` | Modifies a user account. |
| `userdel` | Deletes a user account. |
| `passwd` | Changes a user's password. |

#### 1.5 Understanding User Identification Commands
**whoami**

Displays the Username of the currently logged-in user.

**id**

Displays the UID, primary GID and supplement group memberships of a user.

**Exanple:**
```bash
id
```
These commands are useful for identifying users and uderstanding their access privileges on the Linux system.

#### 1.6 Adding User to Groups
```bash
sudo usermod -aG developers atlasdev1
```
**Explanation:**

- `usermod:` Modifies a user account.
- `-a:` Appends membership without replacing existing supplementary groups.
- `-G:` Specifies supplementary groups.
- `developers:` The target group.
- `atlasdev1:` The user being modified.

**To add another developer:**
```bash
sudo usermod -aG atlasdev1 developers
```
To remove a user from a suppliementary group:

```bash
sudo gpasswd -d atlasdev1 developers
```
**Important:** usemod -G without -a replaces the user's existing supplementary group list. use it carefully.

#### 1.7 Practical: Atlas Developer Team Scenario

The Atlas project requires two developers to collaborate. instead of managing thier access separately, a shared group called developers is created.

**Create the group**
```bash
sudo groupadd developers
```
**Create developer accounts**

```bash
sudo adduser atlasdev1
sudo adduser atlasdev2
```
**Add both developers to the group**

```bash
sudo usermod -aG developer atlasdev1
sudo usermod -aG developer atlasdev2
```
**Verify membership**

```bash
groups atlasdev1
groups atlasdev2
id atlasdev1
id atlasdev2
```

**Expected result**

Both account should show developers among their supplementary groups.

#### 1.8 Practical Results

The following account were successfully created:

| **Username** | **UID** | **Primary Group** | **Suppplementary Group** |
|--------------|---------|-------------------|--------------------------|
| atlasdev1 | 1004 | atlasdev1 | developers |
| atlasdev2 | 1005 | atlasdev2 |developers |

- Developer group GID: 1013
- Both users were successfully added and verified.

The developers were successfuly added to the developers group and their group memebership were verified using the  `groups` and `id` commands.

#### 1.8 Security Importance

User and group management supports:

- Access control.
- Least privilege.
- Accountability.
- Separation of responsibilities.
- Easier administration of shared resources.

#### 1.9 Conclusion
User and group management is an important part of Linux administration. It enable DevOps engineers to create accounts, organise users into groups and manage access to system resources securely.

## 2. File Ownership and Permissions

### 2.1 Introduction

File ownership and permission are important aspects of Linux system administration. they determine who owns a file directory and what actions different users are allowed to perform on it.

Linux is a multi-user operating system. this means that multiple users can access and work on the same computer or server.

However, not every users should have unrestricted access to every file and directory. for example in DevOps environment, developers may need permission to access application files, while sensitive configuration files containing database credentials should only be accessible to authorised users.

Linux uses file ownership and permission settings to control access to these resources.

Understanding file ownership and permissions helps system administrators and DevOps engineers to:

- Protect sensitive files and directories.
- Prevent unauthorised access.
- Control who can read, modify, or execute files.
- Manage shared directories among team members.
- Maintain security through the principle of least privilege.
- Prevent accidental modification or deletion of important files.

**Real world DevOps application:**

In my Atlas project, different users may need access to application files, deployment script, logs, and configuration files. proper ownership and permissions ensure that each user has only the access required to perform their responsibilities.

### 2.2 Understanding Linux File Ownership
In Linux, every file and directory has an owner and an associated group. 

The two main ownership categories are:

1. User(Owner)
2. Group

**1. User(Owner)**

The user owner is the specific Linux account that owns a file or directory. for example, If the user `bethel` creates a file called `appy.py`, the file will normally belong to `bethel`. 

**Group**

The group owner is the Linux group associated with the file or directory. Group ownership allows multiple users who belong to the same group receive shared access according to the group's assigned permissions.

**Important distinction:**

Owner and permissions are related but different concepts.
- Ownership identifies the user and group associated with a file.
- Permissions determine what the owner, group, and other users can do with that file.

### 2.3 Understanding Linux File Permissions

Linux permission control the type of access users have to files and directories. There are three basic permission types in Linux:
| **Permission** | **Sysmbol** | **Meaning** |
|----------------|-------------|-------------|
| `Read` | r | Allows reading a file or listing directory contents. |
| `Write` | w | Allows modifying a file or changing directory entries.|
| `Execute` | x | Allows executing a file or accessing a directory. |

1. **Read permission(r)**
- For a file. Allows a user to view its contents.
- For a directory: Allows a user to list the names of files and subdirectories inside it.

2. **Write permission (w)**
- For a file: Allows a user to create, its contents.
- For a directory: Allows a user to create, delete, pr rename entries inside it, provided the required directory access is available.

3. **Executable permission(x)**
- For a file: Allows a user to execute it as program or script, provided it is in an excutable format.
- For a directory: Allows a user to enter or traverse the directory and access items within it, subject to permissions on the path.

### 2.4 Permission Categories
Linux assigns permssions to three categories:
1. **Users(u):** The owner of the file or directory.
2. **Group(g):** User who belong to the file's associated group
3. **Others(o):** All other user who neither the owner nor members of the associated group.

**Example:**
```bash
-rwx-xr--
```
**This represents:**
- `User`: rwx --read, write and execute.
- `Group`: r-x --read and execute.
- `Others` : r-- --read only.

**Important:** Linux check the application permission category when a user accesses a file. The owner, group and others permissions are not simply added together.

### 2.5 Viewing File Ownership and Permissions

Linux provides commands that allows system administrators to inspect the ownership and permissions assigned to a files and directories. The most commonly used command is `ls -l`.

1. The `ls -l` command displays files and directories in long-listing formart. It provide detailed information about each item, including its permissions, owner, group, size and modification date.

**syntax:**
```bash
ls -l
```
**Example:**

```bash
ls -l
```
**Possible output:**
```plain text
-rw-r--r-- 1 bethel developers 2048 nov 27 10:30 app.py
```
**Understanding the Output:**

Let's break down the output:

| **Part** | **Value** | **Explanation** |
|----------|-----------|-----------------|
| File type and permisions | -rw-r--r-- | Shows the file type and access permissions. |
| Hard links | 1 | Numbers of hard links to the file. |
| Owner | bethel | User who owns the file. |
| Group | developets | Group associated with the file. |
| Size | 2048 | File size in bytes. |
| Date | Nov 27 10:30 | Last modification date and time. |
| Filename | app.py | Name of the file. |

3. **Understanding the Fist Character**

The first character in the permission field identifies the type of filesystem object.

| **Character** | **Meaning** |
|---------------|-------------|
| ~ | Regular file |
| d | Directory |
| l | Symbolic link |
| c | Character device |
| b | Block device |

**For example:**
```plain text
-rw-r--r--
```
The first character - tells us that this is a regular file.

Another example:
```plain text
drwxr-x-r-x
```
The first character d tells us that this is a directory.

4.**Other Useful Commands**

A. `ls -ld`

Displays information about a directory itsef rather than listing its contents.
```bash
ls -ld /opt/atlas-dev
```
B. `stat`

Displays detailed information about a file or directory, including its permission, ownership, size and timestamps.
```bash
stat app.py
```
C. `id`

Displays the current user's UID, primary group and supplementary group memberships.
```bash
id
```
D. `groups`

Displays the groups to which a user belongs.
```bash
groups
```
5. **Practical Apllication in Atlas**

During my Atlas practical, i used:
```bash
ls -ld /opt/atlas-dev
```
My output included:
```plain text
drwxrwsr-x bethel developers /opt/atlas-dev
```
This help me verify:

- `bethel` was the directory owner.
- `developers` was the group owner.
- The directory had group read, write and execute permissions.
- The s indicated that SGID was enabled.

**Why this matters in DevOps:** Before changing permissions or ownership on an application directory, an adminstrator should inspect its existing configuration. This helps prevent accidental permission changes that could disrupt an application or expose senstive files.

### 2.6 Chnging File Permissions Using `chmod`.

The `chmod` command is used to change the permission or files and directories in Linux. The word `chmod` means **change mode.** It allows administrators to controls who can read, write, or execute files and access directories.

1. **Syntax**
```bash
chmod [options] MODE FILE
```
Where:

- `chmod -- command used to change permissions.
- ` options` -- additional instructions, such as recursive changes.
- `MODE` -- the permissions to assign.
- `FILE` -- the target file or directory.

### 2 Changing Permissions Using Numeric Mode
Linux represents permissions using numbers:

| **permission** | **Number** |
|----------------|------------|
| Read(r) | 4 |
| Write(w) | 2 |
| Execute(x) | 1 |

The numbers are added together to produce the required permission.

Examples:

| **Number** | **Permission** |
|------------|----------------|
| 7 | rwx |
| 6 | rw- |
| 5 | r-x |
| 4 | r-- |
| 3 | -w-x |
| 2 | -w- |
| 1 | --x |
| 0 | --- |

### 3. Understanding Numberic Permissions 

Numberic permission usually conatin three digits:
```plain text
750
```
Each digit represents a different category:
- First digit: Owner.
- Second digit: Group.
- Third didit: Others.

**Example 1:**
```bash
chmod 755 script.sh
```
Breakdown:
- Owner:7 = read, write and excute.
- Group:5 = read and excute.
- Others:5 = read and excute.

Result:
```plain text
-rwxr-xr-x
```
**EXample 2:**
```bash
chmod 640 config.py
```
Breakdown:
- Owner:6 = read and write.
- Group:4 = read only.
- Others:0 = no permission.

Result:
```plain text
-rw-r-----
```
This is useful for files that should be readable by a specific group but inaccessible to other users.

### 4. Changing Permissions Using Symbolic Mode
Symbolic mode uses letters instead of numbers to modify permissions. The permission categories are:
| **Symbol** | **Meaning** |
|------------|-------------|
| u | user/owner |
| g | Groups |
| o | Others |
| a | All users |

Operations:
| **Operator** | **Meaning** |
|--------------|-------------|
| + | Add permission |
| - | Remove permission |
| = | Set permission exactly |

Examples:

Add execute permission to the owner:
```bash
chmod u+x script.sh
```
Add write permission to the group:
```bash
chmod g+w app.py
```
Remove write permission from others:
```bash
chmod o-w app.py
```
Give other read-only permission:
```bash
chmod o=r app.py
```
### 5. Recursive Permission Changes
Thius applies the specified permissions to the directory and everything inside it.

**Important security warning:** Applying one permission recursively can be dangerous. Directories need excute permission for traversal, while oridnary files do not necessarilly need excute permission. Always  inspect the contents before making recursive changes.

### 6 Practical Aplication in Atlas
In my atlas project, we used:
```bash
sudo chmod 2775 /opt/atlas-dev
```
This configure the directory with:
- SGID enable.
-Full permissions for the owner.
- Full permissions for the developers group.
- Read and execte permissions for others.

We also used:
```bash
sudo chmod g+rw /opt/atlas-dev/test-fromdev1.text
```
This give the developers group read and write access to the test file.

**why `chmod` matters in DevOps:** It helps administrators control access to application files, deployment scripts, shared directories files. 