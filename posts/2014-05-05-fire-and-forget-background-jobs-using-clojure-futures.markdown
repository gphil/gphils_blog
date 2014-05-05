---
title: Fire and Forget Background Jobs Using Clojure Futures
author: gphil
tags: programming, clojure, concurrency
---

One of the killer features of Clojure is its built-in (and [library-supported](https://github.com/clojure/core.async)) ability to manage concurrent threads of execution. However, in the name of [simplicity](http://www.infoq.com/presentations/Simple-Made-Easy), I generally try to eschew concurrency in my own code until I really need it.

At [Kwelia](https://kwelia.com), we do a lot of data processing in background jobs. Our recurring background jobs either run on a schedule, or by popping tasks off of a job queue. These jobs run concurrently, but there's no concurrency written into the application logic.

In addition to recurring background jobs, we also end up with lots of one-off types of background jobs that largely involve fetching, cleaning, manipulating, and persisting data. In the fetching and persisting steps of these jobs, we're often waiting on network and database calls for the majority of the job.

So, in order to speed up these jobs, we can sprinkle in some concurrency (carefully and without accidentally overloading our database or our partners' APIs.)

Since these are one-off jobs where we usually want results back ASAP, it doesn't really make sense to schedule or queue them. Instead, we construct sub-jobs (some subset of the data processing) such that it doesn't matter what order they run in and kick those off simultaneously in the job itself.

Since we don't particularly care about what happens after they finish, we can just "fire and forget" all of the sub-jobs without keeping track of them. If something goes wrong, we'll just get an exception or log message letting us know, and we can deal with it appropriately at that point.

"Fire and forget" can be accomplished incredibly simply using Clojure's futures:

<script src="https://gist.github.com/gphil/26794cf1be3c6317594a.js"></script>

Calling run-job will kick off all the sub-jobs, and since they are wrapped with "future" none will block the next from kicking off. Furthermore, if the above is run with "lein run" (or in some other execution context) the program will not terminate until all the sub-jobs are done executing. To track the progress of the job, we can just wait until the program finishes executing.

If we wanted, we could hold on to a reference to a future and track that sub-job's completion within our job. However, in our current use cases we have no reason to do this. If we do run into this, it will probably be worth moving to [core.async](https://github.com/clojure/core.async) to manage it. But that could be a blog post for another day!

On certain jobs (those with lots of network and database round trips) we get a huge performance improvement with this approach. And there is very little added complexity, thanks to Clojure's well thought-out concurrency support.