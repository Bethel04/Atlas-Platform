## Week 2: Git & GitHub Deep Dive
1. Repositories
2. commits
3. .gitignore
4. writing genuinely meaningful commit messages.


What is Git?
Git is a version control system. it tracks changes to my files over time. in a complete term we can say git is a version control system used to 
track changes to files and manage different version of a project.

What is Github?
Github is an online platform that host Git repositories and provides collaboration features.

my computer ---git push --> github

#  What is a Repository?
A repository, commonly called a repo, is a Project managed by Git. my directory becomes a git repository when Git initiallizes it and create the .git 
directory. which made my atlas-project my git repo, where all my project are tracked by git. 

**.git** contains Git's internal information about my repo, including its history and configuration.

# My first Git hands on lab

i created a directory (Atlas-platform) using the command **mkdir Atlas-project** to create my directory. then i verify if git is installed using
(**git --version). 
N/B To install git on your system use this command sudo apt update (this command refreshes the list of packages so you get the latest version).
after that run sudo apt install git -y ( this is the command that install git to your system. -y just means you accept yes to everything while 
installing). after installing check if it worked using **git --version** if it works you then set your  name + email **git config --global user.name 'bethel'** and **git config  --global user.email ' myemali.com'** this names /email is whaqt shows on your Github commits.

git status it used to check the state of our branch/ commit

##   The Three Important Git Areas

1. The  Working directory: this is where you actually work one files. example in my Atlas-platform my working directory files are README, lab.md
screenshot etc.

2. Staging area: when i use the command **git add bethel**. this is where i tell git to stage this cahnges in my next commit. 

3. when i commit using ** git commit -m 'add bethel to the commit' the staged becomes part of Git's recorded project history.

##    COMMIT

What is a commit?
A commit is a recorded snapshot of changes in my git repository.
git can track how my project evolved. example: commit 1 "add inital atlas README" commit 2 " Add linux foundation"

Why we need commit. we need commit to know what have changed in the past months, we may have no usefull commit but with good commit like commit 1 "add inital atlas README" we will have a history of your work.

## Adding a Meaningful Commit Messages

A genuinely meaningful commit message answers:
1. what did i change?
Good commit "add Atlas project README". "Document linux foundation concepts". "add nginx reverse proxy configuration". etc
Bad commit "fix". "changes". "final" etc

Why is good commit important
Good commit is important because six month later, someone can run: **git log* and understand the project history.
**git log** is use to see commit information. to get a cleaner version we use **git log oneline**.

## .GITIGNORE

.gitignore tells git not to track these files, because we do not want sensitive file to be tracked by git, such as our password, .log, .tmp etc
we can create one by using the command **touch .gitignore** then edit those sensitive file to .gitignore.
.gitinore is Git configuration file and directores that Git should intentionally ignore when detecting untracked changes.

## Branching - feature branches, switching between them, resolving a deliberately created merge conflict.

# Branching
A git branch is essentially a moveable pointer to a commit. the branch gives me another line of development inside the same repository.
- branch (feature/nginx) a line of development.
- working tree, the files currently sitting in your directory.
- commit, A saved snapshot in git history.

so:
branch--->point to--->commit--->represents---->snapshot of project

Creating a feature branch.
suppose you are currently here (MAIN BRANCH) and i want to work on nginx. i created a new branch with the command **git switch -c feature/nginx**
let me breack it down:
git ---> git program. switch --->change branches. -c --> create the branch. feature/nginx ---> branch name.
so the command means create a new branch called feature/nginx and switch me to it.

To know which branch i am on we use the **git branch**  (*) this asterisk sign point on the branch i am currently on. **git status** it will tells me
something like (on branch feature/nginx or on main). 

To switch branches, example to move to main branch ***git switch main**. to move to feature braanch **git switch feature/nginx**.

N/B
Before switching branches, git may stop you if you have changes that could be overwritten. example 
Feature/nginx
    |__modified nginx.conf
    |__Not commited

then i try: git switch main. git may say i can not safely switch because your changes could be overwritten.

# Merge conflict

A merge conflict happens when git cannot automatically decide which change should win. let use an example.

How i created a merge conflict.