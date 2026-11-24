# Project Atlas-Linux Foundations

## 1. Introduction to Linux

## 2. Linux Filesystem

## 3. Absolute and Reletive Paths

## 4. Essential Linux Commands

## 5. File and Directory Management

## 6. Searching with find and grep 

## 7.  Lessons Learned



### 1. Introduction to Linux

#### What is Linux?

Linux is an open-source operating system kernel. it manages communication between computer hardware and software.

Linux is widely used in server administration, cloud computing, DevOps engineering, cybersecurity and software development.

An operating system manages computer hardware and provides an environment where applications can run.

#### EXamples of operating system include:

- Windows
- Ubuntu
- Debian
- macOS

#### What is a Kernel?

The kernel is the central part of an operating system. it manages communication between software and computer hardware.

#### Its resonsibilities include:

- Managing CPU resources.
- Managing memory [RAM].
- Managing hardware devices.
- Managing processes.
- Controlling access to system resources.

Simplified relationship:

Hardware ---> Kernel ---> Applications

#### Why do DevOps Engineers use Linux?

Linux is widely used in server environments because it supports application hosting, Automation, networking and system administration.

#### DevOPs Engineers use Linux to:

1. Manage servers.

2. Install software Packages. 

3. Configure applications.

4. Manage users and permissions.

5. Troubleshoot problems.

6. Automate administrative tasks.

#### WHat is linux Distributions?
A Linux distribution(distro) is a complete operating system built around the linux kernel, togther with system utilities, software management tools and other components.

#### Examples of LInux distribution
1. Ubuntu -- Beginner-friendly and widely used for servers and development.

2. Debian -- Known for stability and reliability.

3. Fedora -- often provides newer Linux technologies.

4. Red Hat Enterprise Linux -- Enterprise-focused distribution.

5. kali Linux -- Specialised for penetration testing and security work.

#### Linux in my Atlas Project

In Atlas Project, we use Ubuntu as our server operating system. my Ubuntu environment allows us to:
- Host my flask application.
- Mages our PostgreSql database.
- Configure Nginx.
- Run Docker containers.
- Automate Administrative tasks.

**N/B**

Terminal = A terminal is a text-based interface that allows users to communicate with an operating system by entering commands, or interface for enterin commands.

We can open the terminal using CTRL + ALT + T

Kernel = The core component of an operating system

Distribution = A complete Linux-based operating system.

Open source -- software whose source code is available under its licence.

Server -- A computer or system that provides services to other computers.

Linux is techinically the kernel. 

ubuntun is a complete Linux distribution built around that kernel.

## 2. Linux Filesystem

#### What is the Linux Filesystem?
The Linux filesytem is a hierarchical structure used to organises and manages files and directories. Everything begins from the root directory, represented by `/`.

#### Important LInux Directories

| Directory | Purpose |
|-----------|---------|
|`/` | The root directory and starting point of the entire Linux filesytem. |
|`/home` | Contains regular users' home directories. |
|`/root` | Home directory of the root user. |
|`/etc` | Contains system configuration files. |
|`/var` | Stores variable data, including logs. |
|`/usr` | Contains user applications and utilies. |
|`/tmp` | Stores temporary files. |
|`/boot` | Contains boot-related files. |
|`dev`| Contains device files. |
|`proc`| Provides process and kernel information. |  

For example:

```bash
/home/bethel/Atlas-Platform1
```

#### This is an absolute path

An absolute path specifies the complete location of a file or directory, starting from the root directory(/). it does not depend on the current working directory.

#### Relative Path

A relative path specifies the location of a file or directory in relation to the current working directory. it does not begin with /.

For example:

```bash
cd Atlas-Platform1
```

#### Why the Linux Filesystem Matters in DevOps

Understanding the Linux fil/home/bethel/Atlas-Platform1
esystem helps DevOPs engineers to:
- Locate application files and Configuration files.
- Manage system logs.
- Troubleshoot server problems.
- Organise project directories.
- Manage application deployments.

## 3. Absolute and Relative Paths

### What is an Absolute Path?

An absolute path specifies the complete location of a file or directory, starting from the root directory(`/`). it does not depend on the current working directory.

#### What is a Relative path?

A relative path specifies the location of a file or directory based on the current working directory. it does not start from the root directory(`/`) 

#### Special Path Symbols in Linux

Linux uses special symbols to make directory navigation easier.

| Symbol | Meaning |
|------- |-------- |
|`.` | Represents the current working directory. |
|`..` | Represents the parent directory (one level above). |
|`~` | Represents the current user's home directory. |

**Example:**

```bash
cd .
cd ..
cd ../..
cd ~
```

These commands help Linux users navigate directories without typing the full absolute path every time.

## 4. Basic Linux Navigation Commands 

Linux provides commands that help users nevigate the filesystem and understand their current location.

### 4.1 The `pwd` command 

The `pwd` command means print working directory. it displays the absolute path of the where the user is currently working.

**Example**

```bash
pwd
```
**purpose:** Helps user identify their current location in the filesystem.

### 4.2 The `ls` Command

The `ls` command lists the files and directories inside a specified location. when used without a path. it lists the contents of the current working directory.

**Example:**

```bash
ls
```
**Purpose:** Helps users see the files and directories available in a location.  

### 4.3 The `cd` Command

THE `cd` means "change directory". it is a Linux command used to move from one directory to another in the filesystem.

The `cd` command changes the current working directory, allowing a user to move from one directory to another within the Linux filesystem./home/bethel/Atlas-Platform1

**Example:**
```bash
cd Atlas-Platform1
```

This command moves the user into the `Atlas-Platform` directory, provided it exists in the current working directory.

**Other Useful `cd` Command:**

| Command | Purpose |
|---------| --------|
|`cd ..` | Moves one directory level up. |
| `cd ../..` | Moves two directory levels up. |
| `cd ~` | Takes the user to the home directory. |
| `cd /` | Takes the user to the root directory. |
|`cd -` | Returns to the previous working directory. |

**purpose:**
The `cd` command helps Linux users navigate between directories, access project files and manage the filesystem efficiently.

## 5 Creating and Managing Files and Directories

### 5.1 The `mkdir` Command
The `mkdir` command means "Make Directory". It is a Linux command used to create new directories within the filesystem.

**Example:**

```bash
mkdir Projects
```
This command creates a new directory named `Projects` in the current working directory.

**Creating Multiple Directories:**

```bash
mkdir project1 project2 project3
```
This command create three directories in the current working directory.

**Creating Nested Directories:**
```bash
mkdir -p projects/atlas/backend
```
The `-p` option create parent directories when they do not already exist.

**Purpose:**

The `mkdir command helps Linux users organise files, create project structures and manage directories efficiently.

### 5.2 The `touch` Command 
The `touch` command is a Linux command used to create empty files. It can also update the timestamps of existing files.

**Example:**
```bash
touch notes.txt
```
This command creates an empty file named `notes.txt` in the current working directory if the file does not already exist.

**Creating Multiple files:**
```bash
touch file1.txt file2.txt file3.txt
```
This commad creates three empty files in the current working directory.

**Purpose:**
The `touch` command helps Linux users create file quickly, prepare project files and manage timestamps.

### 5.3 The `cat` Command
The `cat` command is a linux command used to dispaly the content of files in the terminal. it can also be used to combine files through input redirection.
**Example:**
```bash
cat notes.txt
```
This command displays the contents of `notes.txt` in the terminal.

**Displaying Multiple files:**

```bash
cat file1.txt file2.txt
```
This command displays the contents of both files in the terminal, one after the other.

**Purpose:**

The `cat` command helps Linux users read file contents, view information quickly and combine the contents of multiple files.

### 5.4 The `cp` Command 

The `cp` command is a linux comand used to copy files and directories from one location to another. it allows users to creates duplicates of files while keeping the original files unchanged

**Example:**
```bash
cp notes.txt backup.txt
```
This command creates a copy of notes.txt named backup.txt in the working directory.

#### Copying Files to Another Directory:
```bash
cp notes.txt /home/bethel/Documents/
```
This command copies note.txt into the Documents directory.

#### copying Directories:
```bash
cp -r project1 project2
```

the `-r` option allows the cp command to copy a directory and its contents recursively.

**Purpose:** 

The `cp` command helps Linux users duplicate files, create backups and organise project files without removing the original files.

### 5.5 The `mv` Command

The `mv` command is linux command used to move files and directories from one location to another. It can also be used to rename files and directories.

**Example:**
```bash
mv notes.txt document/
```
This command moves notes.txt from the current working directory into the Documents directory.

**Rename a File:**
```bash
mv notes.txt study-notes.txt
```
This command renames notes.txt to study-notes.txt.

**Moving a Directory:**
```bash
mv project1 Documents/
```
**Purpose:**

The `mv` command helps Linux users organise files and directories, move data between locations and files without creating duplicate copies.

### 5.6  The `rm` Command
The `rm` command is a Linux command used to remove or delete files and directories from the filesystem.

**Removing a file:**
```bash
rm notes.txt
```
This command permanently removes the file named `notes.txt.`

**Removing Multiple Files:**
```bash
rm file1.txt file2.txt
```
This command removes Both specified files.

**Removing a Directory and its Contents:**
```bash
rm -r project1
```
The rm command helps Linux users remove unwated files and directories and maintain an organised filesystem.

**Important Note:**

The rm command can permanently delete files, users should alwayus verify the file or directory name before executing the command. Avoid using destructive commands carelessly.

### 5.7 The `rmdir` Command
The rmdir command is a Linux command used to remove empty directories from the filesystem.

**Example:**
```bash
rmdir old-project
```
This command removes the empty directory named old-project from the current working directory.

**Removing Multiple Empty Directories:**
```bash
rmdir Project1 Project2 Project3
```
This command removes the specified directories if they are all empty. 

**Important Note:**

The rmdir command only removes empty directories. it will not remove a directory that contains files or other directories.

**Purpose:**

The rmdir command helps linux users remove unnecessary empty directories and maintain an organised filesystem.

**Important distinction:**

- `rmdir` remove empty directories only.
- `rm -r` removes directories and their contents recursively.

This distinction is important because using `rm -r` can delete files inside a directory.

### 5.8 The less Command

The less command is a Linux command used to viewd the contents of a file one pages at a time. it is particularly useful when working with large files because it allows users to nevigate through the contents without displaying everything at once.

**Example:**
```bash
less notes.txt
```
This command opens notes.txt in the terminal, allowing the user to read its contents page by page.

**Navigating Through a File:**

While viewing a file with the less command:

- Spacebar -moves forward one page.
- b -moves backward one page.
- Arrow up - moves up one line.
- Arrow Down -moves down one line.
- /Keyword -searches for a specific word.
- q -exits the viewer.

**Purpose:**

The less command help Linux users read large files, examine log files and nevigate through information efficiently without loading the entire content onto the screen at once.

**Important:**

The less command does not modify the file. it is mainly used for viewing and navigating file contents.

### 5.9 The file Command

The file command is a Linux command used to identify the type of a file by examining its contents rather than relying only on its filename or extension.

**Example:**
```bash
file notes.txt
```
This command examines nots.txt and displays information about its file type.

**Identifying Multiple Files:**

```bash
file notes.txt script.py image.png
```
This command identifies and displays the types of all the specified files.

**Purpose:**

The file command helps Linux users identify file formats, understand file contents and determine the appropriate applications or tools needed to work with different files.

### 6.1 The find Command

The find command is a Linux command used to search for files and directories within a specified location in the filesystem. It allows users to locate items based on criteria such as their names,types and locations.

**Searching for a File by Name:**
```bash
find . -name "notes.txt"
```
This command searches for a file named notes.txt starting from the current working directory and its subdirectories.

**Seaching for Files by Extension:**

```bash
find . -name "*.txt"
```
This command searches for files with the .txt extension within the current directory and its subdirectories.

**Seaching for Directories:**
```bash
find . -type d
```
This command displays directories found within the current working directory and its subdirectories.

**Searching for Files Only:**
```bash
find . -type f
```
This Command displays regular file found within the current directory and its subdirectories.

**Purpose:**

The find command helps Linux users locate files and directories efficiently, manage filesystem contents and search for specific resources within a Linux system.

**Important Note:**

- `.` means search from the current directory.
- `-name` specifies the name or pattern to search for.
- `-type f` searches for regular files.
- `-type d` searches for directories.
- `*` is a wildcard that matches any sequence of characters.

### 6.2 The grep Command

The grep command is a Linux command used to search for Specific words, text patterns or expressions within files. it displays the lines that match the search pattern.

**Searching For a Word in a File:**
```bash
grep "error" application.log
```
This command searches for the word error in application.log and displays the lines containing that word.

```bash
grep -i "error" application.log
```
The `-i` option makes the search case insensitive. It matches variations Such as error, ERROR and Error.

**Displaying Line Numbers:**
```bash
grep -n "error" application.log
```
The `-n` option displays the line numbers where the matching text appears.

**Searching Recursively in Directories:**
```bash
grep -r "error" /var/log/
```
The -r option searches for the specified text recursively through files in the given directory and its subdirectories.

**Purpose:**

The grep command helps Linux users search files, investigate application errors, examine system logs and locate specific information quickly.

**Important concepts:**

- grep -searches for text patterns.
- `-i` -ignores differences between uppercase and lowercase letters.
- `-n` -displays matching line numbers.
- `-r` -searches recursivly through directories.
- `-w` - searches for a complete word rather than matching it as part of another word.


### 7.1 Lessons Learned:

Through this Linux Foundations training, I developed a better understanding of the Linux operating system and its importance in system administration, networking and Devops engineering. 

**The key lessons learned include:**

1. **Introduction to linux:** Understanding Linux as an open-source Operating system kernel and its role in amnaging computer resources.

2. **Linux Filesystem:*** Understanding the Linux directory structure and how files and directories are organised.

3. **Absolute and Relative Paths:** Learning how to identify and navigate file locations using different path references.

4. **Essential Linux Commands:** Understanding how to use basic commands to interact with the linux terminal.

5. **File and Directory Managesment:** Learning how to create, view,copy,move,rename and remove files and directories.

6. **Seaching with find and grep:** uderstanding how to locate files and search for specific text within files.


Linux is an important foundation for DevOps engineering because it provides the environment and tools needed to manages servers, automate tasks, deploy applications and troubleshhot systems. The Knowledge for more advances Linux administration and DevOps concepts.