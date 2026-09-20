#  Variables, conditionals, loops in Bash; writing a script that accepts arguments ($1, $@).

## 1. What is Bash?

when we open  the terminal and type the command inside the terminal, we are talking to bash, that brings us to the definition of bash
Bash stands for Bourne Again SHell. It’s a **command-line shell**. a program that lets you interact with your computer by typing commands instead of 
clicking through menus. for example we can type the command (ls) in the terminal to list files or cd to move into a directory.
it can run individual commands or execute **Bash scripts** (.sh files), which automate a sequence of commands.

or example:

#!/bin/bash

- echo "Hello!"
- mkdir my_folder
- cd my_folder
- touch file.txt

## 2. What is a Bash script?

Bash scripting means writing a file containing Bash commands so the computer can execute those commands for you automatically.
Without Bash scripting

You might manually type:

- mkdir backup
- cd backup
- touch file.txt
- echo "Backup created"

You have to type each command yourself. BUT With Bash scripting, You put those commands into one file:

#!/bin/bash

- mkdir backup
- cd backup
- touch file.txt
- echo "Backup created"

Then you run the script: bash backup.sh

Bash executes the commands one after another. The simple idea, Think of Bash as a language. Think of a Bash script as a recipe.

For example:

Create a folder → enter the folder → create a file → print a message.

You write that recipe into a .sh file, and Bash follows it.

##  Let's create our first script

we use text editor like vim, nano, vs code to write our script.

when we use code hello.sh (.sh represent shell), we are basically saying vs code open new file called hello.sh. inside the file we create our script.

#!/bin/bash

echo "Hello"

after that we save the file using control s. then we give the file permission to excute, using chmod +x hello.sh.

## What did we write?

**#!/bin/bash** : also known as the shebang, it is used to tell linux to use bash to run a script, and the echo means print, so echo hello means 

print hello on the screen. So our script is basically means: start bash print hello word. then we run the script.

**Run the script?**

before we run the script we give the file permission to excute, usng the commnad chmod +x hello.sh, chmod +x gives the file permission to be executed
as a program. then we run ./hello.sh  and the output will be hello.

## Now variables

A variable is a named container that stores a value so you can use that value later. Think of it like a labeled box. Box labeled name → contains 
"Bethel". Box labeled age → contains 25, In Bash: name="Bethel" and age=25. Here: name is the variable, "Bethel" is the value, age is the variable
25 is the value

Using the variable. To get the value stored inside a Bash variable, put $ before its name: for example. name="Bethel". (echo $name ) and the Output:Bethel
So: name="Bethel". which means:"Create a variable called name and store Bethel in it." And: echo $name, which means: print the value inside the name the output:bethel
A variable is a named storage location that allows me to store a value and reuse that value in my script."
For example: server="Atlas", echo "My server is $server". Output:My server is Atlas

Important Bash rule: don't put spaces around =. example Correct: name="Bethel"

## Let's actually do it

Create another script: nano variable.sh  then inPut: #!/bin/bash ( this is the shebang- it excute our script with bash).

name="bethel"

echo "$name"

Save it.

Then: chmod +x variable.sh then we Run: ./variable.sh the output:bethel

Stop here and understand this

We wrote: name="Atlas", That means: variable name = name and the value = Atlas, Then:echo "$name", means: "Print whatever is inside the variable called name."

Therefore: name="bethel"

echo "$name"

bethel

# LESSON 8 — Why $?

This is very important. When we create the variable: name="bethel", we don't use $. When we use/read the variable: echo "$bethel", we use $.

Think:

CREATE

name="Atlas"

READ

$name

That's the basic rule.

# A variable is a named place where I store a value so that I can use that value later in my script

How do i create one?

I give it a name and assign a value, for example name=\"Atlas\".

How do i read it?

I put $ before the variable name, for example echo \"$name\".

#  LESSON 3 — Bash can receive information from you

Now we're going to make the script more interesting.

Instead of putting the name directly inside the script:

name="Atlas"

we can allow the person running the script to provide the name.

For example:

./hello.sh Bethel

Here:

Bethel

is information we gave to the script.

This is called an argument.

An argument  are information you give to a command so it knows what to do. example sudo ufw allow port 22.

allow = the command (what to do)

22 = the argument (allow what? port 22)

variable = a box that stores something

argument = something you give to a command/function to work on

## what is an agurment?

an argument is a value you give to a command or script when you run it.

Think of it like this: Command = what you want the computer to do. Argument = what you want the command to do it to / with

For example: ls /home. ls → command: /home → argument. You're telling ls: List the contents of /home.

Another example: mkdir backup: mkdir → command. backup → argument, You're telling mkdir: Create a directory called backup.

What is $1?

This is where $1 comes in.

Create: nano argument.sh. Put: #!/bin/bash

echo "Hello $1"

Save it.

Then run: chmod +x argument.sh

Now: ./argument.sh Bethel

You should get:

Hello Bethel,

##  What just happened?

Look at this:

./argument.sh Bethel

We have:

./argument.sh = the script

Bethel = the information we gave it

Bash puts the first piece of information into:

$1

So:

$1 = Bethel

Then our script says: echo "Hello $1". Bash sees $1 and says: "The first argument is Bethel." So it prints: Hello Bethel

bash = program

greet.sh = script

Bethel = argument

so: $1 means the first arugment given to the script.

## "What is an argument in Bash?"

"An argument is a value passed to a command or script when it is executed. In a Bash script, positional parameters such as $1 and $2 are used to 
access the arguments."

Remember the difference

Variable = Stores a value: name="Bethel"

Argument = Passes a value into a command/script: bash greet.sh Bethel

So the simple rule is:

Variable = stores information.

Argument = gives information to a command or script.

##  LESSON 6 — $@

Now imagine we give the script many arguments:./argument.sh Atlas nginx postgresql gunicorn

Instead of using:

- $1
- $2
- $3
- $4

one by one, Bash gives us:

$@

$@ means: All the arguments.

So make the script:

#!/bin/bash

echo "All arguments:"

echo "$@"

Run: ./argument.sh Atlas nginx postgresql gunicorn

You should see: All arguments: Atlas nginx postgresql gunicorn

## VERY IMPORTANT

Remember these three:

$1 → first argument

$2 → second argument

$@ → all arguments

For: ./argument.sh Atlas nginx postgresql

we have:

- $1 = Atlas
- $2 = nginx
- $3 = postgresql

$@ = Atlas nginx postgresql.

# What is a loop?

A loop in Bash is a way to tell the computer: Repeat this task multiple times. Instead of writing the same command again and again, you put it inside
a loop.

Without a loop

Suppose you want to create 5 files:

- touch file1.txt
- touch file2.txt
- touch file3.txt
- touch file4.txt
- touch file5.txt

That's repetitive.

With a loop

for i in 1 2 3 4 5

do

touch file$i.txt

done

Means: "The loop is finished."

The output will be:

- Number: 1
- Number: 2
- Number: 3
- Number: 4
- Number: 5

## "What is a loop in Bash?"

"A loop is a control structure that allows me to repeatedly execute a command or group of commands for a specified set of values or until a condition
 is met. It helps automate repetitive tasks."

The three things to remember

VARIABLE: Stores a value

ARGUMENT: Passes a value into a command/script

LOOP: Repeats a task

And the basic Bash loop structure is:

do

    echo...

done

## N/B

**What is $1?**

$1 is the first argument passed to the script.

**What is $@?**

$@ represents all the arguments passed to the script.

What is a loop?

A loop repeats a set of commands.



**What is a conditional?**

A conditional allows Bash to make a decision. Think: IF something is true → do this. ELSE → do something different. For example:

If the Atlas server is running, say "Server is running."  Otherwise, say "Server is down."

The basic Bash structure is:

if [ condition ]

then

    command

else

    command

fi    

What each part means

if

Means:

"Let's check something."

[ condition ]

The thing we're checking.

then

Means:

"If the condition is true, do this."

else

Means:

"If the condition is false, do this instead."

fi

Marks the end of the if statement.

Notice that fi is if backwards.

# What happened?

We created: name="Bethel". So the variable contains: Bethel, Then Bash checks: [ "$name" = "Bethel" ]

Which is basically asking: "Is the value of name equal to Bethel?"

Yes.

Therefore Bash executes:

echo "Hello Bethel"

Your first if

Create a file: nano decision.sh

Put this inside:

#!/bin/bash

if [ 5 -gt 3 ]

then

    echo "Yes, 5 is greater than 3"
else

    echo "No"

fi

Save it and run:

chmod +x decision.sh

./decision.sh

You should see:

Yes, 5 is greater than 3

## Understand the structure

Look at this:

if [ 5 -gt 3 ]

then

    echo "Yes, 5 is greater than 3"

else

    echo "No"

fi

Read it like English:

IF 5 is greater than 3

THEN

    say "Yes"

ELSE

    say "No"

END

That's all an if statement is doing.

What is -gt?

This: -gt

means: greater than

So: [ 5 -gt 3 ]

asks: Is 5 greater than 3?

Yes.

Therefore Bash runs:

echo "Yes, 5 is greater than 3"

 The else

Suppose we change:

[ 5 -gt 3 ]

to:

[ 2 -gt 3 ]

Now Bash asks: Is 2 greater than 3?

No.

So it goes to:

else

and prints:

No

What is fi?

This is easy to remember:

if
...
fi

fi tells Bash:

The if statement is finished. It's basically if backwards.


Let's make it useful for Atlas

Instead of asking: Is 5 greater than 3? we can ask: Is nginx running?

Create:

nano nginx-check.sh

Put:

## N/B

#!/bin/bash

if systemctl is-active --quiet nginx

then

else

    echo "nginx is NOT running"

fi

Save.

Then:

chmod +x nginx-check.sh

Run:

./nginx-check.sh

If nginx is running, you'll see:

nginx is running

If nginx is stopped:

nginx is NOT running

What is happening here?

This part:

systemctl is-active --quiet nginx

asks Linux:

"Is the nginx service active?"

The command gives Bash a result.

If the answer is successful:

TRUE

Bash executes:

echo "nginx is running"

Otherwise:

FALSE

Bash executes:

echo "nginx is NOT running"


## What does your Bash script do?”

Say:

“The script checks the current status of the nginx service. I store the output of systemctl is-active nginx in a variable called status. Then I use an
 if statement to compare that value with active. If they match, the script reports that nginx is running; otherwise, it reports that nginx is not 
 running.”

One thing to remember

status=$(command)

means: Run the command and store its output in status.

And: if [ "$status" = "active" ]

means: Check whether status equals active.

##  revision

What is a conditional?


A conditional allows a script to make a decision based on whether a condition is true or false.

What does if do?

if tests a condition. If the condition is true, Bash executes the commands inside the then section. Otherwise, it executes the else section.


What did your nginx script do?

It used systemctl is-active --quiet nginx to check whether nginx was running and then printed a different message depending on the result.

## Make an Atlas service checker

Now we'll use what you've learned to make something useful.

Create:

nano atlas-check.sh

Put this inside:

#!/bin/bash

for service in "$@"

do

    if systemctl is-active --quiet "$service"

    then

        echo "$service is running"

    else

        echo "$service is NOT running"

    fi

done

Save it.

Then:

chmod +x atlas-check.sh

Now run:

./atlas-check.sh nginx postgresql

What happens?

Bash receives: $1 = nginx, $2 = postgresql And: "$@"

contains: nginx postgresql

The for loop takes them one at a time.

First:

service = nginx

Bash checks:

systemctl is-active --quiet nginx

Then it checks:

service = postgresql

Bash checks: systemctl is-active --quiet postgresql. So you might get: nginx is running, postgresql is running

## N/B 

Why did i use $@?”


- I used $@ so the script can accept multiple service names as arguments. Instead of writing separate checks for nginx, PostgreSQL, and other services,
I can pass them to the script and use a loop to check each one.

For example:

./atlas-check.sh nginx postgresql

The advantage is that the script is reusable.

You can also do:

./atlas-check.sh nginx postgresql ssh

or:

./atlas-check.sh nginx

without changing the script.

## The three things you've learned
$1 = First argument

$2 = Second argument

$@ = All arguments

And:

for service in "$@"

means:

Take each argument, one at a time, and temporarily call it service.

## Functions, exit codes, and set -euo pipefail - why it matters for scripts you actually trust.

# functions?

A function is a named group of commands that we can run whenever we need it.

In Bash scripts, functions are reusable blocks of code that act like "mini-scripts" within your main script. They help you avoid repeating code, making your scripts cleaner and easier to maintain. 

here are two different ways to define a function in Bash.

    Preferred Syntax (Most Common) The first format starts with the function name, followed by parentheses. This is the preferred and most-used syntax.
    sh

    function_name () {
      commands
    }

    Single line version:
    sh

    function_name () { commands; }

    Using the function Keyword The second format starts with the reserved word function, followed by the function name.
    sh

    function function_name {
      commands
    }

    Single line version:
    sh

    function function_name { commands; }

Important points to note:

- The commands inside the curly braces ({}) make up the function body.
- The opening and closing braces must be separated from the body by spaces or newlines.
- A function runs only when explicitly called by name.
- The function must be defined before it is called.
- When using single-line “compacted” functions, a semicolon ; is required after the last command.
- Use descriptive function names whenever possible.

## Example: Hello World Function

What problem does a function solve?. Look at what we already built. Our server-check.sh contains this:

if systemctl is-active --quiet "$service"; then

    echo "$service is running"

else

    echo "$service is not running"

fi

That block checks a service.

Now imagine a much bigger script where you need to perform that same check in several places.

You could copy and paste the block repeatedly, but that creates a problem:

Lots of repeated code
       ↓
Harder to read
       ↓
Harder to change
       ↓
More opportunities for mistakes

A function solves this by letting us give that block a name.

Think of a function as a named tool:

             check_service
                  │
                  ▼
        ┌──────────────────┐
        │ Check service    │
        │ Is it running?   │
        │ Print result     │
        └──────────────────┘

Then whenever we need it:

check_service nginx

We call the tool.

2.  The basic structure

A Bash function looks like this:

function_name() {
  
    commands

}

For example:

hello() {
    
    echo "Hello"

}

We've defined a function called hello.

But notice something important:

Defining a function doesn't run it.

We have to call it:

hello

Then Bash executes the commands inside it.

So:

DEFINE
  ↓
hello() {
    
    echo "Hello"

}
  ↓
CALL
  ↓

hello
  
  ↓
Hello

## Let's build our first function together

Create:

nano function1.sh

Put:

#!/bin/bash

greet() {

    echo "Hello from Bash"

}

greet

Save and make it executable:

chmod +x function1.sh

Run:

./function1.sh

You should get:

Hello from Bash

## Understand the function

This: greet() {

means: I'm creating a function called greet.

Then: echo "Hello from Bash"

is the command belonging to the function.

Then:

}

means: The function ends here.

Finally: greet

means: Run the function.

##  Now let's give the function information

This is where functions connect with the arguments you already learned.

Change the script to:

#!/bin/bash

greet() {

    echo "Hello $1"

}

greet Bethel

Run:

./function1.sh

You should get:

Hello Bethel

Why?

Because:

greet Bethel

passes Bethel into the function.

Inside the function:

$1

represents the first argument given to the function.

So:

greet Bethel

     ↓
    $1

     ↓
  Bethel

## work

What is a function?

A function is a named block of commands that I can call and reuse in a Bash script.

Why did i use functions?

To organize my script and avoid repeating the same commands. It makes the script easier to maintain and reuse.

How do 1 define a function?

I give it a name followed by () and put the commands inside { }.

Example:

check_service() {

    ...

}

How do you run a function?

I call its name.

check_service nginx

What is $1 inside the function?

It represents the first argument passed to that function.
