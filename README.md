BankOCR
==============


This is a Test Driven Development exercise using Kiwi Unit Testing Framework.

This project targets an OSX Cocoa Application.

Immutable Branch
------------------

I wanted to start over and try a slightly different approach.

So far I'be been trying to use a few different approaches but a little scatter gun, and I realised that one thing that I've not been doing is refactoring at the right time to ensure that I keep to my OOP principles.  As a result, I get a way down the line before I realise that something has gone wrong and I then find it hard to change tack.

In a real world development I'd need to deal with the pain of refactoring - new requirements emerge and you have to work with the old code - rip and replace is not always an option.  But for these TDD exercises I'm still trying to find my way, and so I can afford the luxury of a blank canvas when I want a different approach.

One thing that gets me in a mess as I develop is whilst I can largely keep to the single responsibility principle, I tend to create objects that represent variable state, i.e. the object is mutable and therefore the code has to deal with more complex flow than is strictly necessary.

In this attempt at the BankOCR problem, I want to see if I can implement all objects as immutable.  I've done a little preplanning of my entity relationships and I've now got more classes to deal with, but each one looks to be about as simple as I can manage.