# Intro to apps

First off, questions we aim to answer:

1. Who doesn’t know what an app is?

2. Who doesn’t have an idea for an app?

3. Who doesn’t have a stopping factor for it?

Answer them yourself right away or read this short introduction and answer
then.

With this short amount of words I aim to explain what to do once you decide to
create your idea. The one that is always in the back of your mind. Why? Because
everything’s an idea and second, I don’t think that learning code nor design is
worth it without an idea. Doing to for the sake of doing seems irrational. Oh,
yeah, this is about learning code and app design.

Cool? Read on.

## Terminology

Alrighty! So apps vary. A lot. You probably love some of them and use them
daily. Why though? It might be useful, adorable or your friends and family
might use it. Point is, there is a value behind it. *App brings value*, that’s
a first thing to remember. If it doesn’t, nobody uses it — the same as if it
doesn’t exist.

So what’s an app? It’s a software application. “App” became popular as a word
when marketing gurus behind iPhone created an “App Store”. Before that we
called them programs. Some still do. What’s a program? It’s a written code that
isn’t broken. So, remember *any app is a code*.

As you probably know most used apps include websites, messengers, networks,
games and more narrow niche stuff. One thing to remember is that almost all of
them work similarly. Those that are different considered autonomous, meaning
they don’t put nor pull data from external sources. A calculator is a good
example.

**What’s so similar about those apps that are not autonomous?**

First things first, apps have several sides to them that are called interfaces:

1. one that’s seen by public (graphical user interface, GUI)

2. one that’s can be accessed programmatically (application programming
interface, API)

3. one that only a developer has access to

As more complex apps are not autonomous, they require a GUI, so end user could
access it with simple buttons and text inputs. An even more complex app would
have a `“Login with Facebook”` that requires developer to setup a connection
with Facebook’s API.

As you clearly see there are not that many sides to the working app from users
perspective.

**Source code**

The app developer is the only one that has access to the source code. Source
code is a set of written instructions by the developer with any text editor.
The process of writing instructions called programming.

That fact alone means you can sit down on your computer, launch any text editor
like Notepad and write a functional source code that can bring a real value to
people. Now we talking, huh?

**Language and platforms**

Ideally, this source code would be written in English and everybody would
instantly understand it, right? It’s not the case because English nor other
spoken languages are good for writing instructions. That’s why engineers have
been coming up with various languages for 50 years now. These languages called
*programming languages*. As in any other place, there are some that popular,
academic and done by amateurs. Every one of them finds a programmer who is
willing to learn it, so there’s plenty to choose from.

Similar to spoken languages, some are good for certain things while others are
not as good. Different use cases and all. That’s why some languages won’t work
where others will. For example, to write native iOS applications programmer is
required to write it in either `Objective-C` or `Swift`. Each requires a decent
amount of time to learn. Similarly, apps for Android are written in `Java` and
its relatives.

Why is it done so? Why can’t we all use same language? It has the same answer
as why all of the world doesn’t speak one language. It’s due to different
background, history and culture.

*There are some technical limitations as well depending on the platform and
language*.

**Environment**

Any application always has an environment in which it operates.  These include
but not limited to:

• `production` – used when app works with real users in real situation •
`development` – used during development, includes a functionality that is not
present in `production` environment

As developer adds functionality to the app by programming there comes the time
to make application available to the group of people or general public. The way
it’s done depends on the app as websites, mobile apps and other platforms are
handled in totally different ways.

**The stack and its parts**

As non-autonomous apps have several sides to them, developers and the whole
industry separate these angles due to complexity, different programming
languages and general specialization.

This set of languages, written source code and other tools called a *stack* of
technologies. Developers as many other professions have a specialization. As
such not every other developer can do work that one can.

These parts of stack include:

• front-end – client-side parts that end user interacts with

• back-end – server-side parts that are used in the app, but not by user

In the beginning most developers choose one side of the stack.

Those that find themselves closer to design and graphics like being “closer” to
the end user so they design an interactive GUI that includes everything
displayed to the user. This is more humane-centered aspect of development that
includes specialists in User Interface, User Experience, Typography and
Graphical Designers.

The other side of the stack attracts developers that are “thinkers”. Those who
are more into fiddling with the data and  architecture as back-end requires an
abstractive thinking a bit more than the front-end.

So, let’s take an example – a WhatsApp/Telegram or other messenger and the way
it operates during launch on both stacks in detail:

1. (FE) Once launched app checks the phone for local storage.

2. (FE) If local storage has no data, app asks for phone number to send an SMS
with the short code for proving ownership.

3. (FE) User enters phone number, presses the `“Submit”` button. App sends data
to the server once button is pressed.

3. (BE) Server receives a request from the app and if everything’s okay, sees a
phone number.

4. (BE) Server checks if phone number is familiar or not. In any case we have
to send an SMS with some digits in it.

5. (BE) Server generates 6-digit code and saves it along with the phone number.

6. (BE) Server asks an SMS provider to send an SMS with that generated code. At
the same time server sends an update to the app to indicate whether SMS is sent
or not.

7. (FE) App receives new information about SMS delivery, shows a message to the
user `“Hey, look out for SMS with 6-digit code”`.

8. (FE) User enters `“6-digit code from SMS”`, presses `“Submit”` button. App
sends entered code to the server once button is pressed.

9. (BE) Server receives entered code if everything’s okay. Checks if code
matches the phone number from point `5`. In any case sends an update to the app
with the confirmation or error.

10. (FE) App receives new information about the code. If the code was wrong, we
ask user to enter it again and repeat the process from point 3. If the code is
right, we display a next step. In case of messengers, that’s contact list.

`FE` for front-end (client) and `BE` for back-end (server).

Why do we need a server-side at all? Several reasons:

• more computer power

• full trust and confidence in the server environment

• one place to store data that is checked and verified

**Summary**

We now have a macro understanding of what apps include in their functionality
and how they operate. There is much more to explore and understand but this is
all there is to it without diving into a specific details from the common man
perspective.
