---
folder-path: comp/lang/python/
date: 2026-06-18 21:39:35 GMT (17:39:35 NYC)
---

# Python Variables and Data Types

Variables in Python are used to store data values. Unlike other programming languages, Python has no command for declaring a variable - a variable is created the moment you first assign a value to it.

---

## Variable Assignment

```python
x = 5
y = "Hello, World!"
z = 3.14
```

Python is dynamically typed, meaning you don't need to declare the type of a variable. The interpreter infers the type based on the value assigned.

---

## Basic Data Types

### Numbers
Python supports three numeric types:
- **int**: Integer numbers (e.g., 5, -10, 100)
- **float**: Floating-point numbers (e.g., 3.14, -0.5)
- **complex**: Complex numbers (e.g., 3+4j)

### Strings
Strings in Python are surrounded by either single or double quotes:

```python
name = "Python"
message = 'Hello, World!'
```

### Booleans
Boolean values represent True or False:

```python
is_active = True
has_permission = False
```

---

## Collections

### Lists
Ordered, mutable collections:

```python
fruits = ["apple", "banana", "cherry"]
```

### Tuples
Ordered, immutable collections:

```python
coordinates = (10, 20, 30)
```

### Dictionaries
Key-value pairs:

```python
person = {"name": "Alice", "age": 30}
```

### Sets
Unordered, unique elements:

```python
unique_numbers = {1, 2, 3, 4, 5}
```
