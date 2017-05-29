---
title: Communication between microservices
category: Microservices
---

With the new microservice based architecture that becomes more and more popular,
within a new application, probably the most important issue that someone needs
to address is how do the microservices communicate with each other?

Way back, I spent a few days reading about various methods and patterns that
address this issue and I will write a few words about the solutions that caught
my attention.

### REST

**REST** stands for Representational State Transfer. The main idea is that the
service that uses this method offers to other services the ability to access
and manipulate various web resources, by using the specifications of the HTTP
protocol (verbs, status codes, URLs) and the textual representation of the
resources (usually JSON).

The main advantages of this method are:

- popularity as there are a lot of frameworks and tools that can help building
  such mechanism with ease.
- easy to use: GET can be called from the browser (easy manual testing), GET
  can be cached easily if the resources do not change frequently
- easy and intuitive APIs

However, the disadvantages might be:

- limited by the verbs of the HTTP protocol. The CRUD opperations can be handled
  with ease, but when there are more specific actions to be handled, things can
  get messy
- usual confussions cand make things easy as well (I have seen some APIs that
  handled delete actions on GET, the POST vs PUT issue, etc)


### JSON RPC

**RPC** stands for Remote Procedure Call which is pretty popular and very easy
to understand. A service exposes a HTTP(s) endpoint where other services can
call certain methods that are provided. The nicest implementation I stumbled
upon is JSON RPC 2.0.

Basically, you have a fixed structure that you need to POST at a certain URL.
That structure is the following

```
{
	"jsonrpc": "2.0",
	"id": 1, // optional,
	"method": "say_hello",
	"params": {
		"name": "world"
	}
}
```

So, all you need to specify are the ``method`` and the ``params`` fields of
the request object. The ``id`` field is interesting because it introduces the
concept of notifications. A notification is a RPC method call from which we
don't expect any answer. If the ``id`` field is present, the request will
return the answer of the method call, otherwise it will return instantly and
will process the request after.

The respose object looks like this

```
{
    "jsonrpc": "2.0",
    "id": 1,
    "result": "hello world",
    "error": null
}
```

So the response has a fixed form and contains the response field, the error
field and the id field (if the request was not a notification).

The advantages might be

- having fewer things to remember (a URL and some method names and parameters)
- fixed syntax that will ease the request/response parsing
- notifications - we don't always need an answer.
- batch requests - we can send an array of request objects and will receive an
  array   of response objects, to reduce the overhead caused by the HTTP
  protocol
- can handle more complex actions

The disadvantages might be

- not so popular. There are not so many tools to assist us in creating a
  JSON RPC endpoint
- cannot cache anything. Any request has that fixed structure.
- every request and response must respect the protocol specifications, so
  with every request or response, extra information is sent that might not
  be needed.


### Publisher-subscriber

Another communication pattern is the publisher subscriber pattern. The main idea
is that some services are publishers and emit messages with certain topics and
content, while other services are subscribers and receive the messages of
certain topics in which they are interested.

Some popular tools to achieve that are the AMQP protocol (RabbitMq) and the
PUB-SUB mechanism from Redis.

The advantages are

- No service discovery mechanism is needed because all services publish to and
  receive from a single service (or a cluster of services)
- Reliable communication pattern as it is used worldwide in large scale systems.

The main disadvantages are

- Favors one-way communication. Request-response communication is harder to
  implement
- The messages might arrive in any order and even with some significant delays.


### Conclusion

There are various communication mechanisms out there, each one having advantages
and disadvantages. The best advice that I can give is to carefully analyze the
requirements of the system in advance in order to choose the most suitable one.

What other inter-service communication mechanisms caught your attention?
