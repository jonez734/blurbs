---
folder-path: comp/lang/python/
date: 2026-06-15 22:50:17 GMT (18:50:17 NYC)
---

# Functions and Modules in Python

Functions are reusable blocks of code that perform a specific task. They help organize code and avoid repetition.

---

## Defining Functions

Use the `def` keyword to define a function:

```python
def greet(name):
    return f"Hello, {name}!"

message = greet("World")
print(message)  # Output: Hello, World!
```

---

## Function Parameters

### Default Parameters
```python
def greet(name, greeting="Hello"):
    return f"{greeting}, {name}!"
```

### *args and **kwargs
```python
def sum_all(*args):
    return sum(args)

def print_info(**kwargs):
    for key, value in kwargs.items():
        print(f"{key}: {value}")
```

---

## Lambda Functions

Lambda functions are small anonymous functions:

```python
square = lambda x: x ** 2
add = lambda a, b: a + b
```

---

## Modules

Modules are files containing Python code that can be imported into other programs.

### Importing Modules

```python
import math
import random
from datetime import datetime
from os import path
```

### Standard Library Modules

Python's standard library includes many useful modules:
- **math**: Mathematical functions
- **random**: Random number generation
- **datetime**: Date and time handling
- **os**: Operating system interface
- **json**: JSON encoding and decoding

---

## Creating Your Own Modules

Save a Python file and import it:

```python
# mymodule.py
def say_hello():
    return "Hello!"

# main.py
import mymodule
print(mymodule.say_hello())
```
