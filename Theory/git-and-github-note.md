# Git and GitHub

## GIT
Git is a version-control system. Git lets you record, inspect,compare, and 
manage changes to my project overtime.
Git is the software that runs only on my computer, I use commands like
git status to check the current state of my project, git add start tracking my
project's files for the next save.

## GITHUB
Github is an online service that store Git repositories and provide collaboration feature.it is an online platform built around Git repositories.

# Repositories, commits, .gitignore, and writing genuinely meaningful commit messages.
## REPOSITORY.
A repository, usually called **REPO** is the place where git keeps tracks of my
project's files and their history. when I ran git init on my Atlas project Git
created the necessary hidden **.git** directory inside my project file 
directory.
.git directory is extermely important because it contains Git's information 
about the repository. .git should not be edited.
# LOCAL REPOSITORY V GITHUB
local repository, this is where my current Atlas project folder/files on my 
computer lives, now there are two places my project files are.
my computer (my local/offline)  and my Github(Remote/online).
my computer contains the local repository. Github contains a remote repository.
Git is the tools that helps me manage the history and move changes between them

## WHAT IS A COMMIT?
A commit is a recoreded snapshot of changes in your git repository.
when I create a commit messages "Add linux Networking". Git now remember that 
state of my project.
# Why is it called a commit?
A commit contains information such as: what changed, when it changed, 
who made the change.a unique identifer, my commit message.
so my project history. 
Merge: b5bb471 e11f038
Author: bethel04 <Bethel>
Date:   Mon Aug 10 22:51:44 2026 +0100

    keep README.md merge

commit b5bb4716e3f8f05957041ba8d53a96e2d09d3702
Author: bethel04 <Bethel>
Date:   Mon Aug 10 22:18:36 2026 +0100

    docs: write Atlas v0.1 project README

commit e11f038c8e003d51efcd19f87a7fc68a386e542e
Author: BETHEL <juniorprince154@gmail.com>
Date:   Mon Aug 10 19:30:32 2026 +0100

    Delete README.md

commit c07b30425d780a24343b43d0c02f0cddc5b38f58
Author: bethel04 <Bethel>
Date:   Mon Aug 10 15:09:09 2026 +0100

    Document infra/legacy historical archive for Atlas monorepo

commit 37b418cf56c0e985a000adb850b92cfde3955dfb
Author: bethel04 <Bethel>
Date:   Fri Aug 7 13:39:15 2026 +0100

    initial changes

I used the command git log to get my git history.
commit does not mean Github, I can make commit without sending it to Github,
My computer
    file
  git add
  git commit
 local Git history
Nothing has been sent to Github yet,
 to send it to my Github I used the command **git commit**, this saves the 
 change in my local git history and **git push** send my commited changes to
  GITHUB.

## WHAT IS .GITIGNORE?
.gitignore is a special file that tells git. "don't track these files or 
folders". for example. password.txt-->git add--->git commit-->git push.
and the add password to .gitignore, the secret has already entered Git history.
.gitignore is mainly saying "don't start tracking this file" it is not saying
" erase a secret that I already committed"

# WRITING A MEANINGFUL COMMIT MESSAGE?
A commit message should tell another user or person what you have changed in 
the file.
example of a bad commit message is "update" here nobody knows what change
A better commit message is "Add Atlas README" now we know something was added.

## BRANCHES
A branch is a movable pointer/reference to a 
commit. A branch is a separate line of work 
that comes from a main line.
branch let you work on something new without 
touching the main code.
when you are working on your website main
branch, you want to try a new feature, you 
create a branch login-feature. you can break
things, add code, text (main is till safe)
when it works, you merge the branch back to 
the main.***that is to say branch = safe copy 
to experiment.***

# FEATURE BRANCH
A feature branch is a branch you create to build one single feature.
example: your project is working fine on main.
you want to add a new feature-let us say a 
login page.instead of coding directly on main 
and risking breaking it, you do;
MAIN--------------->
        FEATURE/LOGIN
ALL YOUR CODE FOR LOGIN PAGE GOES IN 
FEATUR/LOGIN-PAGE.WHEN IT'S FINISHED AND 
TESTED, YOU CMERGE IT BACK, AFTER MERGING IT, 
YOU DELETE THE FEATURE BRANCH.