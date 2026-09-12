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

##  What is a Repository?
A repository, commonly called a repo, is a Project managed by Git. my directory becomes a git repository when Git initiallizes it and create the .git 
directory, which made my atlas-project my git repo, where all my project are tracked by git. 

**.git** contains Git's internal information about my repo, including its history and configuration.

# My first Git hands on lab on how to install and config git

i created a directory (Atlas-platform) using the command **mkdir Atlas-project** to create my directory. then i verify if git is installed using
(**git --version**). 
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
1.what did i change?

Good commit "add Atlas project README". "Document linux foundation concepts"," add nginx reverse proxy configuration".etc Bad commit "fix". "changes". "final" etc

Why is good commit important
Good commit is important because six month later, someone can run: **git log* and understand the project history.
**git log** is use to see commit information. to get a cleaner version we use **git log oneline**.

## .GITIGNORE

.gitignore tells git not to track these files, because we do not want file that we are not using to be tracked by git.
we can create one by using the command **touch .gitignore** then edit those sensitive file to .gitignore. .gitinore is Git configuration file and
 directores that Git should intentionally ignore when detecting untracked changes.

# Branching - feature branches, switching between them, resolving a deliberately created merge conflict.

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

How does a conflict look like?

git may put this into the file
<<<<<HEAD
Welcome to Atlas
#=============
Hello Atlas Project
>>>>> feature/nginx

##  to resovle a conflict
we must decide what the find file should say. maybe i decide: welcome to The Atlas Project.
then we remove the conflict markers, and then run git add (file). this tells git 'we have resolved the conflict." then we run the
command git commit, this records the merge resolution.

##             Hands on labs (defending my screenshot)

First i checked the status of my branch using the commabd **git status** and saw lab.md was modified. i staged it by typing the **git add (file) and 
then commited it to the git history using the **git commit -m "add changes in lab.md"** then i created a new branch called feature/branch-lab using
"git switch -c feature/branch-lab" to work on a new task. inside my feature/branch-lab i created a new file branch-lab.txt and staged it for the
next commit." using git add (file) then i commited the file to the git history, now i ran git status and it shows thst my working tree it clean which
means the feature branch is done.

Then i switched to the master. using **git switch master*, then i tried (ls) to check if i will see the branch-lab.txt i created when i was in the
festure branch. but the ouput shows that is was not there, then i created the  same file (branch-lab.txt) but with different content. this file was
created on the master branch. that i checked the status of my master branch which i was the working directory has not been staged due to the file i
created. so i staged the file using git add (file version) after that i commited the file to my master history. when i tried to merge master branch to
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

#   Pull requests - open one against your own repo, review it as if someone else wrote it, then merge it.

PULL REQUESTS?

A pull request is the request to merge changes from one branch into another on Github. for example: feature/branch-lab ------ pr(please review my 
changes) Github--master.

A pr gives you a place to:
- see the changes 
- review the code
- discuse changes
- check commits
- check whether there are merge conflicts
- approve the changes
- merge the branch

N/B
A pull request is not a Git command. It is a Github collaboration/review mechanism built around Git branches.

A pull request is more like: Github, i have changes on this branch. please let me review them before merging them into another branch.
so:
LOCAL GIT = merge histories locally
GITHUB = review and approve and merge
we need to push a branch to Github before Github can show us a pull request. Github can not review a branch that exists only on your laptop.we nee to 
send that branch on Github repo.
so:
My laptop ----> git push --- feature branch exist remotely --- pull request becomes possible.

N/B 
Origin is the conventional local name git gives to the remote repository i cloned or connected to. it is not necessarily your repsitory,
And
**git fetch** downloads update from the remote and update your remote-tracking references; it does not merge those changes into your current branch.
**git push** uploads your local commits/branch changes to the remote

## hands on lab(explaination of what i have done on pull request)

first i created a new branch called **feature/pr-lab** with -c which means create and switch. the i used git branch to confirm i am now on feature/
pr-lab and master still exists. this follows the rule: never work directly on master.
I listed files, the created PR-LAB.MD using touch command. i open it in nano and wrote notes about pull requests. then i used cat to verify the 
content was saved correctly.after that i ran git status to show the state of my git, which shows PR-LAB.md is untracked, next step would be git add 
PR-LAB.md and git commit -m add PR notes' then git push origin feature/pr-lab.


## Rebase vs. merge - practice both on a throwaway branch; understand when each is the right call.

#  MERGE

THink of merge as: Bring these two lines of history together, 
suppose: A---B---C    master
_____________\
______________D----E  Feature

yout switch to master and run:
git merge feature
Git may create a merge commit: A----B---C---M   master
_____________________________________\D----E--feature

M is the merge commit
it says: i combined the histories of these two branches.

N/B
Merge does not rewrite existing commits.

#   REBASE

Rebase takes your feature commits and replays them on top of the latest master.

before: A--B--C    master
___________\
____________D---E feature

After rebasing:
A--B--C--D'--E'  feature
the feature commit are now based on C 
WHY THE '?

Because rebase creates new commit identities. we can simply say: Rebase moves/replays your branchs commit onto a new base commit.
N/B
Merge preserves history, Rebase rewrites history. we need to be careful with rebase because is rewrites history other people are already using.

## understand when each is the right call.

Good use of rebase: my own feature branch , i am the only person working on feature. master has changes. and i want feature to be updated. i ran
git switch feature. then ran git rebase master.

Bas use of rebase: My team has a shared branch: team-feature, five developers are using it. i ran **git rebase master** and rewrite commits that everyone else already 
has. that is **DANGEROUS**. in that situation, merge is usually safer. git merge master.

REBASE: "My branch is mine, i will clean/update its history before i share it." 
MERGE: " These branches already have histories, i willl join them without rewriting them.

when would i use rebase?
i would use rebase on my own feature branch when i want to incorporate the lastes changes from master branch and maintain a clean, linear history.
i avoid rebasing shared branches because rebase rewrites commit history.

##     practice 
I created a new branch using git switch -c feature/rebase-demo. then i created a file named rebase-demo.txt, i add a content inside the file. then 
I stage and commited the file to git history, i switchthe master branch, created a file and add content inside the file, stage and commit the file
the sitch back to the feature/rebase-demo. then i did git rebase master, this means we are telling git to replay my feature branch commit on top of 
the latest master.

## PROJECT DAY ATLAS V0.1

Goal: Apply the full git branching + pull request workflow to atlas by add the nginx configuration as trcked code, opeing a PR reviewing it, merging, 
and taggging the release as v0.1

We currently have an Atlas project and an Nginx configuration on ubuntu vm. now, we want to take that configuration and make it part of our Git
repository.

we do not directly make the new change on master. instead: we create a feature branch, make changes commit, push feature branch, open pull request
reviw it, merge into master, tag master as v0.1.

PROJECT.
i ran git status to check the state of my git, N/B do not create the feature branch if you are already on another unfinished branch.
i created a new branch for my niginx configuration, using git switch -c feature/nginx-config. after that i find my Nginx configuration.
N/B
Before copying anything, first identify the configuration we are going to track. common Ningx location include: /etc/nginx/nginx.conf and 
site configuration such as: /etc/nginx/sites-available/.  and   /etc/nginx/sites-enable/.  after we ran sudo nginx -T, this displays the effective 
nginx configuration. my nginx file /etc/nginx/sites-available/Atlas-platform1. then i use sudo nginx -T to displays the effective nginx configuration
then i put the configuration inside a newly created infra/nginx inside my atlas-platform1, then i copy the nginx configuration file, to my atlas infra
directory using the command **sudo cp /etc/nginx/sites-available/Atlas-platform1  infra**
then i checked git status and the file is still in my working directory, then i stage and commit it. then push the branch to my github for a 
to create a pull request, review it and merge the PR. then i move to my git, switch to my master branch and pull the origin master to my git history
after that i ran the git log --oneline --decorate -s. to see my git log. after that we create the Atlas v0.1 tag using **git tag v0.1** then i checked 
it git tag and it in v0.1 after that i push the tag to Github using git push origin v0.1 tag. then comfirm if the tag is in my git history we use
git log --oneline --decorate -s