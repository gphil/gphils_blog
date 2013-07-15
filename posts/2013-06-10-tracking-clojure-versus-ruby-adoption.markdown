---
title: Tracking Clojure vs. Ruby Adoption
author: gphil
tags: clojure, ruby, programming, metrics
---

If you read my [previous post](2013-06-07-thoughts-on-clojure-versus-ruby-for-startups.html), then you know that I'm rooting for greater adoption of Clojure.

In this post I want to take a more quantitative look at the adoption of Clojure, and benchmark that against Ruby. I picked Ruby because it's another dynamic language that I use frequently, and because I feel that it has quite a bit of traction.

What follows below is an un-scientific comparison of Clojure and Ruby based on usage statistics culled from their respective package repositories, StackOverflow and GitHub.

Package Repositories
---

The package repository for Clojure is [Clojars](https://clojars.org). Since its inception, it's had 4,215,857 total packages downloaded.

(Edit: [@xeqixeqi](https://twitter.com/xeqixeqi) pointed out that Clojars started keeping track of downloads in Oct./Nov. 2012, so these numbers don't actually go back that far. That may explain why they are lagging Ruby by the most. RubyGems has been keeping track since July 2009.)

The corresponding package repository for Ruby is [RubyGems](https://rubygems.org). RubyGems has 1,677,981,312
total downloads. This is ~398x more than Clojars.

The top package on Clojars is [Ring](https://github.com/ring-clojure/ring), which has been downloaded 131,383 times.

The top package on RubyGems is [Thor](https://github.com/wycats/thor) and it has been downloaded 30,235,277 times, which is ~230x more than Ring.

Thor is a tool for making command line utilities and is often also used as a build tool, while Ring is a web application library. The de facto build tool for Clojure is [Leiningen](https://github.com/technomancy/leiningen), which might compare more favorably to Thor. However, it is generally downloaded directly and then used to fetch dependencies from Clojars. So far as I know, no statistics are available on the number of Leiningen downloads.

A more apples-to-apples comparison might be to compare Ring to [Rack](https://github.com/rack/rack), its Ruby analogue:

Rack has 27,119,992 downloads which is ~206x the number of Ring downloads.

StackOverflow
---

I used [this StackExchange Data Explorer query](http://data.stackexchange.com/stackoverflow/query/90306/compare-size-and-growth-trends-for-stackoverflow-tags) to compare the number of questions tagged as "clojure" or "ruby" on StackOverflow.

The tag "clojure" has been used 1,919 times in the last 6 months, whereas the tag "ruby" has been used 23,495 times in the last 6 months.

This is a much more favorable comparision for Clojure, as Ruby "only" has a ~12x advantage here.

GitHub
---

Ring has 1,321 stars, and 166 forks and Rack has 1,973 stars and 596 forks for ratios of ~3.5x and ~1.5x respectively.

Looking at [Ring](https://github.com/ring-clojure/ring) and [Rack](https://github.com/rack/rack) projects on GitHub, the numbers bode even better for Clojure.

Interestingly, it looks like Ring and Rack both started out on personal accounts and subsequently moved to their own organizations. The number of stars are summations using both accounts, but the number of forks reported was the same on both accounts because both organizations have forked from the original personal projects.

Conclusion
---

Ruby definitely still has a major adoption and mind-share advantage over Clojure, but Clojure fared better than I thought it would on StackOverflow, and especially on GitHub.

It's also interesting to note the wide range across the comparisons (400x down to 1.5x), which probably says as much about the communities they came from (as well as the inaccuracy of this methodology) as it does for Clojure versus Ruby adoption in the real world.

I look forward to following these numbers in order to see if Clojure makes inroads against Ruby and lowers these ratios over time.
