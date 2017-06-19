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

Firstly, I create the random data file using the command

```
python3 -c "import os; f = open('data.bin', 'wb'); f.write(os.urandom(10 ** 6)); f.close();"
```

After that, we start the containers, using the following commands

```

  docker run -d -v `pwd`:/usr/share/nginx/html -p 8000:80 --name nginx-server nginx:latest
  docker run -d -v `pwd`:/usr/share/nginx/html -p 8001:80 --name nginx-miniserver nginx:alpine

```

So, we have the two servers running, the big one at http://localhost:8000 and the
lightweight one at http://localhost:8001 .

Next, I will benchmark them using the ``ab`` tool (you can read more about it at
  https://httpd.apache.org/docs/2.4/programs/ab.html).


## 1000 Requests with a level of concurrency of 16



The used command: ``ab -n 1000 -c 16 http://localhost:8000/data.bin``


The result for the normal Nginx server:

```
Server Software:        nginx/1.13.1
Server Hostname:        localhost
Server Port:            8000

Document Path:          /data.bin
Document Length:        1000000 bytes

Concurrency Level:      16
Time taken for tests:   7.522 seconds
Complete requests:      1000
Failed requests:        0
Total transferred:      1000254000 bytes
HTML transferred:       1000000000 bytes
Requests per second:    132.94 [#/sec] (mean)
Time per request:       120.355 [ms] (mean)
Time per request:       7.522 [ms] (mean, across all concurrent requests)
Transfer rate:          129856.81 [Kbytes/sec] received

Connection Times (ms)
              min  mean[+/-sd] median   max
Connect:        0    0   0.0      0       1
Processing:    18  112  13.5    112     210
Waiting:        4   96  10.4     96     180
Total:         19  112  13.5    112     210

Percentage of the requests served within a certain time (ms)
  50%    112
  66%    117
  75%    120
  80%    122
  90%    127
  95%    133
  98%    138
  99%    142
 100%    210 (longest request)

```

The result for the alpine based Nginx container:

```
Server Software:        nginx/1.13.1
Server Hostname:        localhost
Server Port:            8001

Document Path:          /data.bin
Document Length:        1000000 bytes

Concurrency Level:      16
Time taken for tests:   7.500 seconds
Complete requests:      1000
Failed requests:        0
Total transferred:      1000254000 bytes
HTML transferred:       1000000000 bytes
Requests per second:    133.34 [#/sec] (mean)
Time per request:       119.993 [ms] (mean)
Time per request:       7.500 [ms] (mean, across all concurrent requests)
Transfer rate:          130248.61 [Kbytes/sec] received

Connection Times (ms)
              min  mean[+/-sd] median   max
Connect:        0    0   0.1      0       1
Processing:    11  119  14.4    119     195
Waiting:        5  102  11.6    103     179
Total:         12  119  14.4    119     195

Percentage of the requests served within a certain time (ms)
  50%    119
  66%    124
  75%    128
  80%    130
  90%    137
  95%    141
  98%    147
  99%    152
 100%    195 (longest request)
```

We can see the alpine based container performs a little bit better, as it
manages to serve 133 requests per second, in comparison to 132 requests per
second. The difference is not very promising, to be honest.

## 10 000 requests with a level of concurrency of 100

Now we will make much more requests using more clients. The used command
is ``ab -n 10000 -c 100 http://localhost:8000/data.bin``

The result for the normal Nginx server is

```
Server Software:        nginx/1.13.1
Server Hostname:        localhost
Server Port:            8000

Document Path:          /data.bin
Document Length:        1000000 bytes

Concurrency Level:      100
Time taken for tests:   111.076 seconds
Complete requests:      10000
Failed requests:        0
Total transferred:      10002540000 bytes
HTML transferred:       10000000000 bytes
Requests per second:    90.03 [#/sec] (mean)
Time per request:       1110.761 [ms] (mean)
Time per request:       11.108 [ms] (mean, across all concurrent requests)
Transfer rate:          87940.65 [Kbytes/sec] received

Connection Times (ms)
              min  mean[+/-sd] median   max
Connect:        0    0   0.3      0       7
Processing:   179 1106 100.6   1096    1530
Waiting:        5 1082 102.8   1073    1337
Total:        182 1106 100.4   1096    1531

Percentage of the requests served within a certain time (ms)
  50%   1096
  66%   1131
  75%   1162
  80%   1179
  90%   1219
  95%   1246
  98%   1277
  99%   1305
 100%   1531 (longest request)
```

The result for the alpine based container is

```
Server Software:        nginx/1.13.1
Server Hostname:        localhost
Server Port:            8001

Document Path:          /data.bin
Document Length:        1000000 bytes

Concurrency Level:      100
Time taken for tests:   111.574 seconds
Complete requests:      10000
Failed requests:        1
   (Connect: 1, Receive: 0, Length: 0, Exceptions: 0)
Total transferred:      10002540000 bytes
HTML transferred:       10000000000 bytes
Requests per second:    89.63 [#/sec] (mean)
Time per request:       1115.738 [ms] (mean)
Time per request:       11.157 [ms] (mean, across all concurrent requests)
Transfer rate:          87548.38 [Kbytes/sec] received

Connection Times (ms)
              min  mean[+/-sd] median   max
Connect:        0    0   0.3      0       6
Processing:    34 1111  92.3   1104    1384
Waiting:        6 1088  93.3   1080    1326
Total:         37 1112  92.1   1104    1384

Percentage of the requests served within a certain time (ms)
  50%   1104
  66%   1138
  75%   1161
  80%   1174
  90%   1212
  95%   1242
  98%   1281
  99%   1315
 100%   1384 (longest request)
```

If we look at the number of requests per second, we can see that this time,
the alpine container performed worse than the regular container, but if we analyse
the percentage of requests served within a certain time, we can see that
the alpine container is more consistent as the response times range from 1104 ms
to 1384 ms, in comparison to the broader interval of 1096 - 1531 ms.

Important to note that the alpine based container failed to deliver one
response.

## Conclusion and further work

The conclusion is that there is a impact of how the server behaves under
high load, although the difference is not that impressive. I will try to make
benchmarks on the future that seem interesting, maybe test more web servers
and/or more containerization solutions, who know what ideas will pop up in the
future.
