---
title: Leiningen Download Stats
author: gphil
tags: clojure, ruby, programming, metrics
---

About a month ago, I wrote a post [comparing Ruby and Clojure adoption](2013-06-10-tracking-clojure-versus-ruby-adoption.markdown) based on package respository download stats and some other metrics.

At the time, statistics on the number of downloads for [Leiningen](http://http://leiningen.org/) were not available. However, after the blog post was published, [Phil Hagelberg](http://technomancy.us/) (the creator of Leiningen) reached out to me letting me know that the stats could be made available if someone were to write some log parsing code to extract them.

So, I recently wrote a little [log parsing code](https://github.com/technomancy/leiningen/pull/1252). Here are the results as of today:

<table class="leiningen-downloads">
        <tr>
               <td>Downloads from GitHub (through 1/21/2013)</td>
               <td>958,033</td>
        </tr>
        <tr>
               <td>Downloads from S3 (1/21/2013 until today)</td>
               <td>467,730</td>
        </tr>
        <tr>
               <td>Total</td>
               <td>1,425,763</td>
        </tr>
        <tr>
                <td><br /></td>
                <td><br /></td>
        </tr>
        <tr>
                <td>Unique IP Addresses (S3 Downloads Only)</td>
                <td>35,888</td>
        </tr>

</table>

The discrepancy between the unique downloads and total seems to be due to the fact that certain versions of leiningen have been downloaded much more than average. It seems as if a bot or deployment script gone wild has downloaded the same version over and over.

In fact, versions 2.0.0-preview10 and and 2.1.2 account for over a million of the downloads! For comparison, the next most popular version (1.7.1) has only been downloaded 82,444 times. So there's a little bit of a mystery there.

Let me know if you have any theories!