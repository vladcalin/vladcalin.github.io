---
title: Personal journey in the land of front-end
category: Learning
---

In this post I am going to write a few words about my personal journey in the
land of frontend, and the things that I learned from it.

But before that, a few words about my background and skills: I am a Python
developer that built, maintained and improved backend systems all his life,
so my frontend knowledge is very limited: at the start of this journey all I
knew was a little HTML, some CSS, vanilla Javascript with some jQuery and
some Bootstrap.

This journey was motivated by the need to have a not-so-bad looking web
interface for a personal project (some kind of an analytics dashboard) that
uses Django as backend.

## First attempt: plain HTML, jQuery and Bootstrap

The first attempt was to use these technologies as they are and try to combine
them in HTML templates. Well, in addition, I wanted to make a nice looking
dynamic page with nice animations. Needless to say, given my lack of experience
with the frontend and Javascript and the state of the Javascript ecosystem
at that time, everything became an unmaintainable mess in not time.

I found myself struggling to debug things when something wasn't working as
expected and leaving ``console.log`` all over the place.

I was ashamed of what I created and abandoned it after a few weeks.

But at least I learned that in order to write maintainable good frontend code
you need far more discipline and experience than I firstly anticipated.

## Seconds attempt: Angular

After the first try, I read about the current state of the art in the web
development and I came to the conclusion that I should use some of the
mature and standardized frontend libraries. I spent some days reading about
some, and decided to go for Angular, as it was mature enough, easy to
understand, and it was backed by Google! (for some reason, I am a fan of Google
as they understand the need for open source software and make great efforts
in giving back to the community and I really admire them for that)

I started following some tutorials, made some simple services, some controllers,
used the ``angular-cli`` tool to manage everything more smoothly, everything
was great. After some training with Angular 1.x, I tried Angular 4.x (the latest)
as everybody said it has more features and is better organized.

I switched to using the ``@angular/cli`` tool without any issue ... until one
day when something bad happened. Although all I did was a ``npm install`` in
my project, suddenly ``@angular/cli`` stopped working and throwing various
cryptic errors with huge scary stack-traces. After a few days of digging,
I wasn't able to fix the issue, but I knew that it was related to the
dependency hell ``npm`` ecosystem created. I tried even reinstalling the whole
``node`` environment from scratch, it did not fix the issue.

I decided to search further for something not so hard to manage.

## Third attempt: React

After a while, I heard about React. I actually enjoyed it's idea and how it
promotes component reusability.

I started following some tutorials, and the more I learned and tried to do
basic things, the more I had to explore new directions such as new libraries.

One thing that caught my attention was that React was simply just the
framework that renders the elements, everything else had to be done by
the programmer: authentication, routing, ajax requests, etc. But this thing
wasn't bad at all, because it allowed you to have more control over the code.

After learning the basics of React and felt comfortable enough to write
components, I had to also learn ``react-router`` and ``redux`` in order to
be able to write a complex one page web application.

I was very pleased with how everything worked and the ideas behind React,
and decided to stick with it for this personal project.

## Conclusion

I tried multiple environments for writing the frontend for one of my
personal projects, and after some problems (including my lack of experience
with the ``npm`` ecosystem) I found the tool that was the most compatible
with my needs.

As a short recap:

- plain Javascript with jQuery + HTML + Bootstrap wasn't a
  very fortunate choice as it requires more experience to produce qualitative and
  maintainable code, more than I had.
- Angular was nice and I enjoyed it, but something went wrong and everything
  crashed and wasn't able to use their recommended tool (``@angular/cli``)
  anymore. I have up in it, at least for this project I am working on.
- React was even nicer and had the right ideas behind it, although it had
  way less features than Angular. This wasn't really a bad thing as it allowed
  me to choose the tools that fit better my needs.

Before any project, I recommend experimenting a little bit with
various technologies before settling down and explore what they have to give
and how they fit your needs.
