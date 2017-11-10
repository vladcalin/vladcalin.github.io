---
title: Python - the goods and the bad parts
category: Python
---

In the last days I've seen some questions on Reddit that
kind of triggered me. They were basically asking why do people still use
Python when it is so slow and it's ecosystem is very broken (the Python 2 vs 3
problem).

These kind of questions made me want to write down a few reasons why you should
use Python and a few reasons why you shouldn't, because after all,
Python is just a tool, just like any other programming language out there
for resolving problems and business needs.

# The good parts

Firstly, the main reason why you should use Python is because of its
**community**. There are a lot of people and organizations investing time and
money in the development of the language itself and libraries surrounding it.
There are a lot of awesome and powerful libraries out there that tackle
various important areas such as **web development** (eg. [Django], [Flask], [Pyramid],
[Tornado]), **distributed computing** (eg. [Celery], dask), **machine learning**
(scikit-learn, Theano, Tensorflow), **numeric processing, data analysis and
visualizations** (numpy, pandas, matplotlib, seaborn) and many others.

Secondly, it offers a huge boost in **speed of development**. For a business,
this is crucial as the time of development directly affects the agility of the
business itself and time-to-market.

Another goodie Python brings is that it **promotes clean beautiful code** (as
indentation is part of the language itself, some people might disagree
with this) because of its unique syntax. Also, the Zen of Python sums up all the
good practices a programmer should follow.

# The bad parts

But as any language, Python too has its disadvantages.

The first one that is brought to the table is the **lack of performance**
which is mainly caused by the fact that it is an interpreted language.
In contrast with a compiled one where everything is compiled to native code or
bytecode, somewhere closer to the machine, when running a Python program multiple
steps have to be done before actually executing the code: code parsing,
abstract syntax tree building, module lookups. All these steps require time and
extra processing but there are methods to boost the overall performance of the
Python code (for example, by using PyPy or Cythonizing modules that do heavy
numeric computations).

In most cases, the bottleneck of an application is not the CPU, but the disk and
the network. If the CPU seems to be limiting your Python program, perhaps you
chose the wrong tool for the job.

Other disadvantage is that Python is an interpreted language. That means that
all errors occur at runtime and is **way harder to catch errors early**
(for example typos in dictionary keys, everybody hates ``KeyError``s).

Another thing is the Python2 vs Python3 fiasco. Everybody hates backwards
incompatibility, but I like to believe the Python core developers made a good
call with this. A lot of weird inconsistencies and bad design choices in the
early days of the language were fixed (eg. the ``string`` and ``unicode`` vs string and
bytes, urllib, urllib2, ``int`` and ``long``, the ``print`` statement,
inconsistent naming, some of which still persists in Python3 unfortunately and
the list continues).

# Conclusion

Before starting a new project, be sure to make clear what you need to accomplish
and what tools you need for that. If the projects does not goes as expected
because of programming language limitations, there is a big chance you messed
up on the technology picking.

[Djano]: https://www.djangoproject.com/
[Flask]: http://flask.pocoo.org/
[Pyramid]: https://trypyramid.com/
[Tornado]: http://www.tornadoweb.org/en/stable/
[Celery]: http://www.celeryproject.org/
