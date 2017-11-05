---
title: Python - the goods and the bad parts
category: Python
---

Hey guys and gals. In the last days I've seen some questions on Reddit that
kind of triggered me. They were basically ascking why do people still use
Python when it is so slow and it's ecosystem is very broken (the Python 2 vs 3
problem) or why do people use any other language besides Python, because it's
so easy to write everything with it.

These kind of questions made me want to write down a few reasons why you should
use Python and a few reasons why you shouldn't, because Python is just a tool,
just like any other programming language out for resolving problems and
business needs.

# The good parts

Firstly, the main reason why you should use Python is because of its
**community**. There are a lot of people and organizations investing time and
money in the development of the language itself and libraries surrounding it.
There are a lot of awesome and powerful libraries out there that tackle
various important areas such as **web development** (eg. Django, Flask, Pyramid,
Tornado), **distributed computing** (eg. Celery, dask), **machine learning**
(scikit-learn, Theano, Tensorflow), **numeric processing, data analysis and
visualizations** (numpy, pandas, matplotlib, seaborn) and many others.

Secondly, it offers a huge boost in **speed of development**. For a business,
this is crucial as the time of development directly affects the agility of the
business itself and time-to-market.

Another goodie Python brings is that it **promotes clean beautiful code** (as
indentation is part of the language itself, some people might disagree
with this) because of its unique syntax.

# The bad parts

As any language, Python too has its disadvantages.

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
