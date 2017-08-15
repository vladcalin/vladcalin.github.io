---
title: Planning for a new microservice based journey
categories: Microservices, Startup
---

Hello there! I am planning in the near future to build and launch an
application that hopefully, will become popular and big. I am starting
this journey with two good buddies in hope to resolve one problem that we
believe is worth resolving. I cannot give any concrete details yet about
the purpose of the application or what it does, but as soon as it reaches
some kind of stability, I will surely seek for feedback online. All I can
say right now is that it targets only Romania (for now).

From now on, I am going to write regularly about some of the challenges we
encounter (technical and non-technical).

# The tools

The first problem we encountered was just before we started coding, in the
planning phase of the whole thing. We decided to go for some microservice based
architecture, as it allows us to be more flexible and split our jobs more
easily and choose whatever technologies we are more comfortable with (I have
plenty of experience with Python and some DevOps tools, while my other two
partners are more skilled with Java based frameworks).

And because we went for microservices, we needed to find a way to reliably and
easily push changes and test our systems.

After a lot of debating, we established a list of tools we need to use in
order to have a well-designed, simple enough and easy to understand and
maintain workflow:

- Jenkins for CI/CD
- Docker for deploying and managing microservices (each microservice will be
  a docker container that can be easily scaled). Scaling horizontally will
  be made using docker swarm. We chose this approach because we
  want to be prepared to handle a lot of traffic, as our application has
  some social features and some computational-heavy features (such as
  intelligent search).
- Nginx for load balancing the traffic to our microservices and serve the
  static assets (maybe we'll use a CDN for delivering the static assets, we
  haven't decided yet)
- Centralized logging and monitoring using an ELK stack (Elasticsearch, Logstash,
  Kibana).
- Infrastructure is handled via Ansible.
- Infrastructure is provided by AWS.

There are some other tools that will be used, but they are not relevant for
the workflow because they only provide some basic features and we don't want
to spin up a custom proprietary solution because it will only add complexity
to our infrastructure. We want to keep everything as simple as we can.

# The template

In order to use all the tools specified above, it would have been a pain in the
ass to configure and integrate each tool into the codebase each time we would
create a new microservice. To resolve this problem we use cookecutter to
provide an already initialized and configured project that is ready to use
Jenkins via a Jenkinsfile, building with docker by using multiple Dockerfiles,
and have a proper configuration management by using environment variables,
split accordingly by purpose (development and production).

You can check out the current state of the template on :TBD
(it's not yet released as it didn't reach a stable version yet, I am still working
on integrating various services in it, such as ELK)

# Final words

As we start a new journey, in order to develop an product from scratch using
microservices, there are a lot of things to consider: continuous integration,
continuous deployment, logging, monitoring, ease of development, the build
process, horizontal scaling, etcetera. All these things must be considered
for each microservice (whose number grows quickly). We solved this problem
by making a template for microservices that provides out of the box all
the tools and integrations we need, and also establishing a standard way of
doing thigs.
