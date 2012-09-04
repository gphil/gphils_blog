---
title: Logging in Clojure
author: gphil
tags: clojure, logging, leiningen, SLF4J, log4j, clojure.tools.logging
---

At [Kwelia](http://kwelia.com) we are using Clojure for some data integration and transformation tasks. As these tasks started to get more complex, what initially started as some short and somewhat disorganized scripts has now evolved into a larger project which organizes these tasks. 

Recently, I wanted to configure a logging service for this project and I found that the process for doing so was not well documented, and I hit a few speedbumps along the way. So, I've decided to share what I found here.

After a little bit of research, I discovered [clojure.tools.logging](https://github.com/clojure/tools.logging) which is a set of logging macros which delegate to one of many interchangeable logging frameworks. (From the README: "At runtime a specific implementation is selected from, in order, slf4j, Apache commons-logging, log4j, and finally java.util.logging.")

So, my first stab at it was to just add clojure.tools.logging to my leiningen project and test it out as demonstrated in the README. 

<script src="https://gist.github.com/3625496.js"> </script>

I intentionally didn't try to add any logging backends yet, just to see what happened out of the box. When I tried logging something I got the following messages:

<script src="https://gist.github.com/3625006.js?file=gistfile1.txt"></script>

I figured that this meant that clojure.tools.logging was trying to use SLF4J as the above line quoted from the README suggested it would, but I hadn't ever explicitly installed SLF4J so I decided to dig into that. Using "lein deps :tree" I found out that [http.async.client](https://github.com/neotyk/http.async.client)  (which we were already using in this project to integrate with some webservices) depended on it.

Since SLF4J appears itself to be a wrapper for multiple logging backends, and since I've used log4j in the past, I decided that I would point SLF4J to use log4j. (I also considered trying to use log4j directly, but I was dissuaded from doing so based on [this conversation.](https://groups.google.com/d/msg/clojure-dev/H0scci72QQ0/ynVUsipwbkMJ))

So I added log4j to my project.clj (the exclusions are optional dependencies not available in Clojars or Maven Central and I did not want to deal with obtaining them from other sources):

<script src="https://gist.github.com/3625485.js"> </script>

And put the following basic log4j configuration in my src/ directory (it can go anywhere on the CLASSPATH):

<script src="https://gist.github.com/3624967.js"></script>

Finally, I had to explicitly add the log4j adapter for SLF4J in order to get everything to link up.

<script src="https://gist.github.com/3625561.js"> </script>

After adding these dependencies and the log4j.properties configuration file, I was successfully able to use clojure.tools.logging to log to log4j via SLF4J.

Hopefully this is helpful to somebody else who's trying to figure this out. I'm no expert in this domain, so if you think I did something wrong please let me know in the comments.

