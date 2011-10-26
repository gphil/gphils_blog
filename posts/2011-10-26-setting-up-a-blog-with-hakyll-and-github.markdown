---
title: Setting up a blog using Hakyll and GitHub
author: gphil
tags: haskell, hakyll, github
---

I first discovered Haskell in 2008, and I remember even then being
quite impressed by the quality of the community(1), which has since
grown substantially. There was enough buzz around it that I decided to
jump in and try to learn some Haskell(2).

My first foray into Haskell (and functional programming in general)
was hacking up some solutions to Project Euler(3) problems in Haskell,
and after solving just a few of them I noticed that the core Haskell
paradigms (laziness, purity) really shifted my thinking about the
practice of programming in general.

Since that initial discovery phase, I haven't actually used Haskell
much. I've learned quite a bit more about functional programming since
then, but largely this has been through more thorough experimentation
with Clojure over the last year or two.

I was recently reading a blog post by Chris Done(4) that made the
front page of Hacker News and caught my eye. The post discussed "value
polymorphism" which reminded me how little that I actually know about
Haskell, having just scratched the surface in my earlier exploration.

I also noticed that he was using Hakyll(5) as his blogging engine, and
I figured that since I was planning to start this blog, and I was
feeling like I wanted to get back into some Haskell coding, that I
could kill two birds with one stone.

Here's how I did it:

First, I downloaded and installed the Haskell Platform(6) for Mac OS
X. I remember when trying to get Haskell set up in the past I always
had a little bit of a hard time figuring it all out, but the Haskell
Platform package has really improved that experience.

Next, I just ran:

	 cabal install hakyll

I was hoping this would just work out of the box but unfortunately,
this failed with a compiler error when it tried to build the library
regex-pcre-0.94.2:

	 Wrap.hsc:143:18: error: pcre.h: No such file or directory

I figured that I must be missing some regex library that didn't come
with the Haskell package, so after a little research I tried
installing the "pcre" Homebrew (7) package:

	 brew install pcre

Sure enough, that did the trick and a second crack at: "cabal install
hakyll" finished without any further issues. I later found that this
issue is covered in the Hakyll FAQ here(8).

The next step was to work through the tutorial on the hakyll site in
order to understand some of the general concepts. I ran into another
obstacle during this step, trying to compile of some of the example
code. Fortunately, this was also documented in the Hakyll FAQ(9) so I
was able to quickly resolve it.

Once I had the lay of the land, I copied the tagblog/ folder out of
the hakyll-examples project and into my own git project. From there, I
edited the files in the css/ and templates/ directory to my
liking. For the duration of this step, I kept the sample blog posts
around so I could see how they looked as I changed the templates and
styles.
