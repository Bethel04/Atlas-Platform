# Linux Administration Essentials

## 1. User and Group Manangement

### 1.2.Introduction to Linux users

### 1.3 Types of Linux users

### 1.4 User Identification

### 1.5 User Management Commands

### 1.6 Linux Group

### 1.7 Adding Users to Groups

### 1.8 Practical: Atlas Developer Team

### 1.9 Security Importance

### 1.10 Conclusion

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
- `-G;` Specifies supplementary groups.
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