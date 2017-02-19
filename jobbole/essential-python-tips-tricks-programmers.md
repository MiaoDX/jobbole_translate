[TOC]

If you ask any Python programmer to tell about the strengths of Python, he will quote brevity and high readability as the most influencing ones. In this Python tutorial, we’ll cover many essential Python tips and tricks that will authenticate the above two points.

We’ve been collecting these useful shortcuts (tips & tricks) since we started using Python. And what’s best than sharing something we know and which could benefit others as well.

In the past, we’d shared a list of Python programming tips for beginners that aimed to optimize code and reduce coding efforts. And our readers still enjoy reading it.

So today, we’re back with one more set of essential Python tips and tricks. All these tips can help you minify the code and optimize execution. Moreover, you can readily use them in live projects while working on regular assignments.

Each trick has an example given with a brief explanation. For testing the coding snippets, you can look up these online virtual terminals for Python code execution.

There are two more key Python resources that we’d recently published which you must look at are as follows.

💡 Check out 9 Essential Ways to Optimize Python Code.

💡 Find out the Most Common Mistakes to Avoid While You Code.

Use the below TOC to quickly navigate through the Python tips and tricks.


# 30 Essential Python Tips and Tricks for Programmers.

## Tips#1. In-place swapping of two numbers.

Python provides an intuitive way to do assignments and swapping in one line. Please refer the below example.

```
x, y = 10, 20
print(x, y)
x, y = y, x
print(x, y)
#1 (10, 20)
#2 (20, 10)
```

The assignment on the right seeds a new tuple. While the left one instantly unpacks that (unreferenced) tuple to the names `<a>` and `<b>`.

Once the assignment is through, the new tuple gets unreferenced and flagged for garbage collection. The swapping of variables also occurs at eventually.

## Tips#2. Chaining of comparison operators.

Aggregation of comparison operators is another trick that can come handy at times.

```
n = 10
result = 1 < n < 20
print(result)
# True
result = 1 > n <= 9
print(result)
# False
```

## Tips#3. Use of Ternary operator for conditional assignment.

Ternary operators are a shortcut for an if-else statement and also known as conditional operators.

    
`[on_true] if [expression] else [on_false]`

Here are a few examples which you can use to make your code compact and concise.

The below statement is doing the same what it is meant to i.e. “assign 10 to x if y is 9, otherwise assign 20 to x“. We can though extend the chaining of operators if required.

`x = 10 if (y == 9) else 20`

Likewise, we can do the same for class objects.

`x = (classA if y == 1 else classB)(param1, param2)`

In the above example, classA and classB are two classes and one of the class constructors would get called.

Below is one more example with a no. of conditions joining to evaluate the smallest number.

```
def small(a, b, c):
    return a if a <= b and a <= c else (b if b <= a and b <= c else c)
    
print(small(1, 0, 1))
print(small(1, 2, 2))
print(small(2, 2, 3))
print(small(5, 4, 3))
 
#Output
#0 #1 #2 #3
```

We can even use a ternary operator with the list comprehension.

```
[m**2 if m > 10 else m**4 for m in range(50)]
 
#=> [0, 1, 16, 81, 256, 625, 1296, 2401, 4096, 6561, 10000, 121, 144, 169, 196, 225, 256, 289, 324, 361, 400, 441, 484, 529, 576, 625, 676, 729, 784, 841, 900, 961, 1024, 1089, 1156, 1225, 1296, 1369, 1444, 1521, 1600, 1681, 1764, 1849, 1936, 2025, 2116, 2209, 2304, 2401]
```


## Tips#4. Work with multi-line strings.

The basic approach is to use backslashes which derive itself from C language.

```
multiStr = "select * from multi_row \
where row_id < 5"
print(multiStr)
 
# select * from multi_row where row_id < 5
```

One more trick is to use the triple-quotes.

```
multiStr = """select * from multi_row 
where row_id < 5"""
print(multiStr)
 
#select * from multi_row 
#where row_id < 5
```

The common issue with the above methods is the lack of proper indentation. If we try to indent, it’ll insert whitespaces in the string.

So the final solution is to split the string into multi lines and enclose the entire string in parenthesis.

```
multiStr= ("select * from multi_row "
"where row_id < 5 "
"order by age") 
print(multiStr)
 
#select * from multi_row where row_id < 5 order by age
```

## Tips#5. Storing elements of a list into new variables.

We can use a list to initialize a no. of variables. While unpacking the list, the count of variables shouldn’t exceed the no. of elements in the list.

```
testList = [1,2,3]
x, y, z = testList
 
print(x, y, z)
 
#-> 1 2 3
```

## Tips#6. Print the file path of imported modules.

If you want to know the absolute location of modules imported in your code, then use the below trick.

```
import threading 
import socket
 
print(threading)
print(socket)
 
#1- <module 'threading' from '/usr/lib/python2.7/threading.py'>
#2- <module 'socket' from '/usr/lib/python2.7/socket.py'>
```


## Tips#7. Use Interactive “_” operator.

It’s a useful feature which not many of us are aware.

In the Python console, whenever we test an expression or call a function, the result dispatches to a temporary name, _ (an underscore).

```
>>> 2 + 1
3
>>> _
3
>>> print _
3
```

The “_” references to the output of the last executed expression.

## Tips#8. Dictionary/Set comprehensions.

Like we use list comprehensions, we can also use dictionary/set comprehensions. They are simple to use and just as effective. Here is an example.

```
testDict = {i: i * i for i in xrange(10)} 
testSet = {i * 2 for i in xrange(10)}
print(testSet)
print(testDict)
#set([0, 2, 4, 6, 8, 10, 12, 14, 16, 18])
#{0: 0, 1: 1, 2: 4, 3: 9, 4: 16, 5: 25, 6: 36, 7: 49, 8: 64, 9: 81}
```


Note- There is only a difference of <:> in the two statements. Also, to run the above code in Python3, replace <xrange> with <range>.


## Tips#9. Debugging scripts.

We can set breakpoints in our Python script with the help of the <pdb> module. Please follow the below example.

```
import pdb
pdb.set_trace()
```

We can specify <pdb.set_trace()> anywhere in the script and set a breakpoint there. It’s extremely convenient.

## Tips#10. Setup file sharing.

Python allows running an HTTP server which you can use to share files from the server root directory. Below are the commands to start the server.

### # Python 2

```
python -m SimpleHTTPServer
```

### # Python 3

```
python3 -m http.server
```

Above commands would start a server on the default port i.e. 8000. You can also use a custom port by passing it as the last argument to the above commands.

## Tips#11. Inspect an object in Python.

We can inspect objects in Python by calling the dir() method. Here is a simple example.

```
test = [1, 3, 5, 7]
print( dir(test) )
```

``` 
['__add__', '__class__', '__contains__', '__delattr__', '__delitem__', '__delslice__', '__doc__', '__eq__', '__format__', '__ge__', '__getattribute__', '__getitem__', '__getslice__', '__gt__', '__hash__', '__iadd__', '__imul__', '__init__', '__iter__', '__le__', '__len__', '__lt__', '__mul__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__reversed__', '__rmul__', '__setattr__', '__setitem__', '__setslice__', '__sizeof__', '__str__', '__subclasshook__', 'append', 'count', 'extend', 'index', 'insert', 'pop', 'remove', 'reverse', 'sort']
```


## Tips#12. Simplify if statement.

To verify multiple values, we can do in the following manner.

```
if m in [1,3,5,7]:
```

instead of:

```
if m==1 or m==3 or m==5 or m==7:
```


Alternatively, we can use ‘{1,3,5,7}’ instead of ‘[1,3,5,7]’ for ‘in’ operator because ‘set’ can access each element by O(1).


## Tips#13. Detect Python version at runtime.

Sometimes we may not want to execute our program if the Python engine currently running is less than the supported version. To achieve this, you can use the below coding snippet. It also prints the currently used Python version in a readable format.

```
import sys
#Detect the Python version currently in use.
if not hasattr(sys, "hexversion") or sys.hexversion != 50660080:
print("Sorry, you aren't running on Python 3.5\n")
print("Please upgrade to 3.5.\n")
sys.exit(1)
#Print Python version in a readable format.
print("Current Python version: ", sys.version)
```


Alternatively, you can use sys.version_info >= (3, 5) to replace sys.hexversion != 50660080 in the above code. It was a suggestion from one of the informed reader.

Output when running on Python 2.7.

```
Python 2.7.10 (default, Jul 14 2015, 19:46:27)
[GCC 4.8.2] on linux
Sorry, you aren't running on Python 3.5
Please upgrade to 3.5.
```

Output when running on Python 3.5.

```
Python 3.5.1 (default, Dec 2015, 13:05:11)
[GCC 4.8.2] on linux
Current Python version:  3.5.2 (default, Aug 22 2016, 21:11:05) 
[GCC 5.3.0]
```


## Tips#14. Combining multiple strings.

If you want to concatenate all the tokens available in a list, then see the below example.

```
>>> test = ['I', 'Like', 'Python', 'automation']
```

Now, let’s create a single string from the elements in the list given above.

```
>>> print ''.join(test)
```

## Tips#15. Four ways to reverse string/list.

### # Reverse the list itself.

```
testList = [1, 3, 5]
testList.reverse()
print(testList)
#-> [5, 3, 1]
```

### # Reverse while iterating in a loop.

```
for element in reversed([1,3,5]): print(element)
#1-> 5
#2-> 3
#3-> 1
```

### # Reverse a string in line.

```
"Test Python"[::-1]
```

This gives the output as ”nohtyP tseT”

### # Reverse a list using slicing.

```
[1, 3, 5][::-1]
```

The above command will give the output as [5, 3, 1].

## Tips#16. Play with enumeration.

With enumerators, it’s easy to find an index while you’re inside a loop.

```
testlist = [10, 20, 30]
for i, value in enumerate(testlist):
print(i, ': ', value)
#1-> 0 : 10
#2-> 1 : 20
#3-> 2 : 30
```

## Tips#17. Use of enums in Python.

We can use the following approach to create enum definitions.

```
class Shapes:
Circle, Square, Triangle, Quadrangle = range(4)
print(Shapes.Circle)
print(Shapes.Square)
print(Shapes.Triangle)
print(Shapes.Quadrangle)
#1-> 0
#2-> 1
#3-> 2
#4-> 3
```

## Tips#18. Return multiple values from functions.

Not many programming languages support this feature. However, functions in Python do return multiple values.

Please refer the below example to see it working.

```
# function returning multiple values.
def x():
return 1, 2, 3, 4
# Calling the above function.
a, b, c, d = x()
print(a, b, c, d)
#-> 1 2 3 4
```


## Tips#19. Unpack function arguments using splat operator.

The splat operator offers an artistic way to unpack arguments lists. Please refer the below example for clarity.

```
def test(x, y, z):
print(x, y, z)
testDict = {'x': 1, 'y': 2, 'z': 3} 
testList = [10, 20, 30]
test(*testDict)
test(**testDict)
test(*testList)
#1-> x y z
#2-> 1 2 3
#3-> 10 20 30
```


## Tips#20. Use a dictionary to store a switch.

We can make a dictionary store expressions.

```
stdcalc = {
'sum': lambda x, y: x + y,
'subtract': lambda x, y: x - y
}
print(stdcalc['sum'](9,3))
print(stdcalc['subtract'](9,3))
#1-> 12
#2-> 6
```


## Tips#21. Calculate the factorial of any number in one line.

### Python 2.x.

```
result = (lambda k: reduce(int.__mul__, range(1,k+1),1))(3)
print(result)
#-> 6
```

### Python 3.x.

```
import functools
result = (lambda k: functools.reduce(int.__mul__, range(1,k+1),1))(3)
print(result)
#-> 6
```

## Tips#22. Find the most frequent value in a list.

```
test = [1,2,3,4,2,2,3,1,4,4,4]
print(max(set(test), key=test.count))
#-> 4
```

## Tips#23. Reset recursion limit.

Python restricts recursion limit to 1000. We can though reset its value.

```
import sys
x=1001
print(sys.getrecursionlimit())
sys.setrecursionlimit(x)
print(sys.getrecursionlimit())
#1-> 1000
#2-> 1001
```


Please apply the above trick only if you need it.

## Tips#24. Check the memory usage of an object.

In Python 2.7, a 32-bit integer consumes 24-bytes whereas it utilizes 28-bytes in Python 3.5. To verify the memory usage, we can call the <getsizeof> method.

### In Python 2.7.

```
import sys
x=1
print(sys.getsizeof(x))
#-> 24
```

### In Python 3.5.

```
import sys
x=1
print(sys.getsizeof(x))
#-> 28
```

## Tips#25. Use __slots__ to reduce memory overheads.

Have you ever observed your Python application consuming a lot of resources especially memory? Here is one trick which uses <__slots__> class variable to reduce memory overhead to some extent.

```
import sys
class FileSystem(object):
def __init__(self, files, folders, devices):
self.files = files
self.folders = folders
self.devices = devices
print(sys.getsizeof( FileSystem ))
class FileSystem1(object):
__slots__ = ['files', 'folders', 'devices']
def __init__(self, files, folders, devices):
self.files = files
self.folders = folders
self.devices = devices
print(sys.getsizeof( FileSystem1 ))
#In Python 3.5
#1-> 1016
#2-> 888
```


Clearly, you can see from the results that there are savings in memory usage. But you should use __slots__ when the memory overhead of a class is unnecessarily large. Do it only after profiling the application. Otherwise, you’ll make the code difficult to change and with no real benefit.


## Tips#26. Lambda to imitate print function.

```
import sys
lprint=lambda *args:sys.stdout.write(" ".join(map(str,args)))
lprint("python", "tips",1000,1001)
#-> python tips 1000 1001
```

## Tips#27. Create a dictionary from two related sequences.

```
t1 = (1, 2, 3)
t2 = (10, 20, 30)
print(dict (zip(t1,t2)))
#-> {1: 10, 2: 20, 3: 30}
```

## Tips#28. In line search for multiple prefixes in a string.

```
print("http://www.google.com".startswith(("http://", "https://")))
print("http://www.google.co.uk".endswith((".com", ".co.uk")))
#1-> True
#2-> True
```

## Tips#29. Form a unified list without using any loops.

```
import itertools
test = [[-1, -2], [30, 40], [25, 35]]
print(list(itertools.chain.from_iterable(test)))
#-> [-1, -2, 30, 40, 25, 35]
```

## Tips#30. Implement a true switch-case statement in Python.

Here is the code that uses a dictionary to imitate a switch-case construct.

```
def xswitch(x): 
return xswitch._system_dict.get(x, None) 
xswitch._system_dict = {'files': 10, 'folders': 5, 'devices': 2}
print(xswitch('default'))
print(xswitch('devices'))
#1-> None
#2-> 2
```

Summary – Essential Python Tips and Tricks for Programmers.

We wish the essential Python tips and tricks given above would help you do the tasks quickly & efficiently. And you could use them for your assignments and projects.

Listening to your feedback makes us do better so share it.

You can even ask us to write on a topic of your choice. We’ll add it to our writing roadmap.

Lastly, if you’d enjoyed the post, then please care to share it with friends and on social media.

Keep Learning,

TechBeamers.