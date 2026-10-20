# PYTHON

**WHAT IS PYTHON?**

Python isa programming langugae. it allows you give instruction to your computer in a structured way.for example,
imagine you want your computer to display:  **HELLO WORLD:**

you can write a python instruction that tells it to do excactly that. python is useful in Dev0ps because you can us it 
to:
- Automate repetitive linux tasks.
- Check whether applications are running.
- Read and process log files.
- work with APIs.
- Build tools for your Atlas project.

**WHAT IS A PROGRAM?**

A program is a collection of instructions that a computer executes to perform a task.

Consider this example:

print ("HELLO, WORLD!")

This is a complete, simple python program. let us break it down.

**print*

Tells python to display information.

(**Hello, World!")

The parentheses contain what we are passing to prinit function

"Hello, World!"

This is text. in python, text is called a **string**. We willl study the instruction, the output is:

Hello, World!

Notice the difference: the code contains quotation marks, but the displayed output does not.

**WHAT IS PYTHON INTERPRETER?**

The python interpreter is the software that read and execute python code.

**WHAT IS A .PY FILE?

A .py file is a file containing python source code. example: hello.p, main.py, health_check.py

Python file names should be descriptive. later, you will create files for real automation tasks in Atlas. 

**WHAT IS SYNTAX?**

syntax means the rules for writing instructions correctly in a programming lanuage. for example, this is correct:

python: print("Hello") but this is incorrect, print("Hello". the second example is missing a closng parathesis. python 
will report a syntax error.

## Understanding Python Variables

**WHAT IS A VARIABLE?**

A variable is a name that refers to a value stored in your program. think of it like a labelled container:

NAME="bethel". the Variable is name and the value is bethel.

In python, we can write: name = "Bethel". let us break it down. name-the variable name. =-the assignment operator. it 
assigns the value on the right to the variable on the left. **Bethel*- the string value being assinged.

Example: 

IN python name = "Bethel" and then print(name). the first line assigns the text "Bethel" to the variable name.
The second line displays the value associated with name. so the output: **Bethel**.

Notice that print(name) has no quotation marks around **name*.compare these two statements: print(name) and print("name")

If name = "Bethel", their outputs are: Bethel and name. why? Because name without quotes refers the variable. "name" with
quotes is simply text.

**Variable Can Hold Different Kinds Of Values**

exampls: string(str). example = "Ubuntu". meaning TEXT.

Again integer(int). example = 25. meaning Whole number

and Float(float). example = 3.14. Number with a decimal point

**EXAMPLE**

- name = "Bethel"
- age = 25
- hour = 2.5

- print(name)
- print(age)
- print(hour) 

**Variable can be reused**

in python: project="ATLAS" and then print(project), print(project). the output would be: Atlas and Atlas. we only 
assigned the value once, but reused the variable twice. 
This is useful in DevOPS because the same variable might be used in several places in an automation script.

**Variable naming rules**

Good variable names make the code easier to read. valid example:

- name="Bethel"
- project_name="Atlas"
- server_port=5000

Avoid these mistakes:

- 2name="Bethel"
- project-name="Atlas"

The first name start with a number. The second uses a hyphen, which python interprets as a minus operator rather than
part of a variable name. use descriptive name such as database_name, backup_path etc.

**WHAT IS DATA TYPE?**

A data type tells python what kind of value it is working with. for example:

- name="Bethel"
- age=25
- height=1.75

These values have different types:
-"Bethel"