---
title: Thoughts on Clojure vs. Ruby for Startups
author: gphil
tags: clojure, ruby, programming, startups
---

At [Kwelia](https://kwelia.com) we're building our platform using both
Ruby and Clojure. As of today, our web application is a Rails app but we do a lot of backend data processing in Clojure. I personally prefer programming in Clojure to programming in Ruby, and some days I wish we had more Clojure than Ruby in our codebase. I don't think we'll be switching from Rails any time soon, but we may try to encapsulate more business logic behind Clojure web services in the future.

When we started building our product (and I still think this is true today--although it's less true now) it was faster and easier to get a production-ready web application up using Ruby on Rails. One of the best features of Rails in my opinion is that it makes a lot of design decisions for you and that it has pretty sane defaults for the most part. This ends up saving a lot of time up front, which is critical for a start up that wants to quickly validate an idea. There is also a lot of open source code available via RubyGems that replaces or expedites a lot of common web application development tasks. This is a one-two punch that's pretty hard to beat in a start up context.

However, as the Clojure ecosystem matures it's starting to chip away at the advantages that the Rails ecosystem offers. More and more quality libraries are being shipped to [Clojars](https://clojars.org), and informal conventions are starting to emerge regarding how to structure a web application in Clojure. I think the growth of both of these are critical for newcomers who want to get started on a Clojure webapp quickly. I'm optimistic that these trends will continue and Clojure will continue to become a better and better choice for new projects.
