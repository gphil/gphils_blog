---
title: Setting up a blog using Hakyll and GitHub
author: gphil
tags: haskell, hakyll, github
---

I first discovered Haskell in 2008, and I remember even then being
quite impressed by the quality of the [community](http://haskell.org/haskellwiki/Haskell), which has since
grown substantially. There was enough buzz around it that I decided to
jump in and try to [learn some Haskell](http://haskell.org/haskellwiki/Tutorials).

My first foray into Haskell (and functional programming in general)
was hacking up some solutions to [Project Euler](http://projecteuler.net/) problems in Haskell,
and after solving just a few of them I noticed that the core Haskell
paradigms (laziness, purity) really shifted my thinking about the
practice of programming in general.

Since that initial discovery phase, I haven't actually used Haskell
much. I've learned quite a bit more about functional programming since
then, but largely this has been through more thorough experimentation
with Clojure over the last year or two.

I was recently reading a blog post by [Chris Done](http://chrisdone.com/) that made the
front page of Hacker News and caught my eye. The post discussed "value
polymorphism" which reminded me how little that I actually know about
Haskell, having just scratched the surface in my earlier exploration.

I also noticed that he was using [Hakyll](http://jaspervdj.be/hakyll/index.html) as his blogging engine, and
I figured that since I was planning to start this blog, and I was
feeling like I wanted to get back into some Haskell coding, that I
could kill two birds with one stone.

Here's how I did it:

First, I downloaded and installed the [Haskell Platform](http://hackage.haskell.org/platform/) for Mac OS
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
installing the "pcre" Homebrew package:

	 brew install pcre

Sure enough, that did the trick and a second crack at: "cabal install
hakyll" finished without any further issues. I later found that this
issue is covered in the Hakyll FAQ [here](http://jaspervdj.be/hakyll/tutorials/faq.html#problem-with-regex-pcre-dependency-on-mac-os).

The next step was to work through the tutorial on the hakyll site in
order to understand some of the general concepts. I ran into another
obstacle during this step, trying to compile of some of the example
code. Fortunately, this was [also documented in the Hakyll FAQ](http://jaspervdj.be/hakyll/tutorials/faq.html#file-name-does-not-match-module-name-on-mac-os) so I
was able to quickly resolve it.

Once I had the lay of the land, I copied the tagblog/ folder out of
the hakyll-examples project and into my own git project. From there, I
edited the files in the css/ and templates/ directory to my
liking. For the duration of this step, I kept the sample blog posts
around so I could see how they looked as I changed the templates and
styles.

As soon as the site was looking good, I removed the extraneous
files from the Hakyll sample blog and build the site using the Hakyll compiler. Since everything is statically
compiled into the _site/ directory, you can just turn this into it's
own git repo (you'll have to add "/_site" to your .gitignore if you want
to put the rest of the project into git as well since that will be it's own repo) and push it to a
repository named "your_github_acct.github.com" and [github pages](http://pages.github.com/) will
do the rest!

You can check out [my github page](https://github.com/gphil) for the source.