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
Imagine main has (hello Atlas) and feature branch has (Hello Atlas Project) meanwhile someone esle changes the same line on main branch to (welcome to
Atlas). now git has, main:---**hello atlas**--welcome to Atlas. feature branch has **hello Atlas**---Hello Atlas Project
git says: we both changed the same thing. i am not to guess.
that is a merge conflict.

##    How does a conflict look like?
git may put this into the file:
<<<<<HEAD
Welcome to Atlas
=============
Hello Atlas Project
>>>>> feature/nginx

##  to resovle a conflict
we must decide what the find file should say. maybe i decide: welcome to The Atlas Project.
then we remove the conflict markers, and then run git add <file>. this tells git 'we have resolved the conflict." then we run the
command git commit, this records the merge resolution.

##             Hands on labs (defending my screenshot)

First i checked the status of my branch using the commabd **git status** and saw lab.md was modified. i staged it by typing the **git add <file> and 
then commited it to the git history using the **git commit -m "add changes in lab.md"** then i created a new branch called feature/branch-lab using
"git switch -c feature/branch-lab" to work on a new task. inside my feature/branch-lab i created a new file branch-lab.txt and staged it for the
next commit." using git add <file> then i commited the file to the git history, now i ran git status and it shows thst my working tree it clean which
means the feature branch is done.
Then i switched to the master. using **git switch master*, then i tried (ls) to check if i will see the branch-lab.txt i created when i was in the
festure branch. but the ouput shows that is was not there, then i created the  same file (branch-lab.txt) but with different content. this file was
created on the master branch. that i checked the status of my master branch which i was the working directory has not been staged due to the file i
created. so i staged the file using git add <file version> after that i commited the file to my master history. when i tried to merge master branch to
feature /branch-lab, git could not decide which version to keep. so it stopped and gave me a coflict. git told me that there was 'add/add' conflict.
that means both branches added the same new file. the i ran git status which comfirmed that branch-lab.txt is urmerged and needs to be fixed.'
git marked the conflict with <<<<<HEAD for my current branch content, and >>>>> master for the incoming branch content. the ====== saparates them. the 
let me see both version."
then i open the file in nano and i removed the <<<<<<<<<   >>>>>>>>> markers, and decided to keep the master version after editing, the file only has
the final content i want. after fixing the file, i have to git add it to mark the conflict as resolved, then git commit to complete the merge.then i
ran git status and it now shows the conflict is resolved and ready to commit. A merge in git is not complete until you commit. i made a merge commit
with a clear message git add -m "merge master into feature/branch. then i used git log --graph to verify. the when i ran git branch to know which 
branch i am current in which the output shows that i am in feature/branch-lab, then i ran git merge master again and git said "Already up to date".
that proves the merge was successful and feature now has everything from master.