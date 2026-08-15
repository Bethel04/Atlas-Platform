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

## PULL REQUEST?
A pull Request is a request to merge changes from one branch into another branch.
Let create a Scenario
now; you have main branch and feature/nginx branch
you have finished your nginx work, instead of immediately doing:
git switch main
git merge feature/nginx
you push the feature branch to Github and create a pull request, you basically
tell Github: "i have finished the work, please review these changes and merge 
them into the main.

# A Pull Request Has Two Important Branches
when creating a pull request, you wll see something similar to.
base: main
compare:feature/nginx

This means:
base = where the changes are going
compare = where the chnages are coming from.

# WHY DO WE USE PULL REQUEST?
Imagine your are working at a company, you create a feature, you dont normally
want to say " i chnaged the production code trust me"
instead:
DEVELOPER---->FEATURE BRANCH
PULL REQUEST---->CODE REVIEW
APPROVAL------>MERGE--->MAIN
This pull request gives the team an opportunity to examine the work before it
becomes part of the **main** project

## PULL REQUEST VS PULL
A Pull Request is not the same thing as **git pull**.

# git pull
this is a Git command that retrives chnages from a remote repository and integretes them into your local branch.
  Pull Request
This is a Github collaboration mechanism for proposing changes.

# Rebase vs Merge

1. First: What problem do merge and rebase solve?

Git allows multiple people to work on different branches at the same time.

For example:

main
A---B---C
         \
          D---E
          feature

While you're working on feature, somebody else adds a commit to main:

A---B---C---F
         \
          D---E
          feature

Now the histories have diverged.

Git needs a way to bring those histories back together.

There are two major approaches:

Merge and Rebase

## What is merge?

Merge is used to combine the work from two branches while preserving
their separate histories.

Merge means:

Take the histories of two branches and combine them.

Example:

A---B---C---F
         \   \
          D---E---M

**M** is the merge commit.

Git is basically saying:

"Both lines of development happened. I'll preserve both histories and create a new commit that joins them."

Command

If you're on your feature branch:

git merge main

Git takes the current main and merges it into your feature branch.

## What is rebase?

Rebase takes commits from my branch and replays them on top of another
branch, usually main. This creates a more linear history.

Rebase works differently.

Instead of creating a merge commit, Git takes your feature commits and replays them on top of the latest main.

Before:

A---B---C---F
         \
          D---E

After:

A---B---C---F---D'---E'

Notice something important:

D and E became D' and E'.

Why?

Because Git created new versions of those commits on top of F.

That's why we say:

Rebase rewrites history.

## Main difference

Merge preserves the branching history and can create a merge commit.
Rebase rewrites the branch history and usually produces a cleaner
linear history.


## When I would use merge

I would use merge when preserving the actual history is important,
especially when working with shared branches.

## When I would use rebase

I would use rebase on my own feature branch when I want to bring it
up to date with main and keep the history clean.
