---
title: Benchmarking Nginx Docker images
category: Benchmark
---

I have used Docker for a time now, and every time I go to an official
image page from the official Docker image registry, I see various image
versions. But I am not talking about those images that differ in the
versions of the software that is bundled, I am talking about the various
versions of the same version of the bundled software.

For example, let's take the Nginx official image: https://hub.docker.com/_/nginx/

The current version, at this moment, is 1.13.1 but there are also the following
tags: ``1.13.1``, ``1.13.1-alpine`` and ``1.13.1-perl``. I will ignore
the one with Perl for now, but the natural question that popped up is:

> What is the difference betweeen ``1.13.1`` and ``1.13.1-alpine``?

Firstly, the main difference and the most notorious one is the size of the image:

```

nginx               alpine              7ebd6770d0d6        2 weeks ago         15.5 MB
nginx               latest              958a7ae9e569        2 weeks ago         109 MB

```

15 MB vs 109 MB ... That is about 7 times less used memory for the image which
is awesome.

But aside the size of the image, what are other differences?

I am going to perform a performance benchmark for each image, by making them
serve a static 1 MB file filled with random stuff just to see if there is any
signifiant or not performance improvement.
