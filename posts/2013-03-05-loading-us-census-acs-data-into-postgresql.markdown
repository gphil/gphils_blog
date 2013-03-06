---
title: Loading US Census ACS Data into PostgreSQL
author: gphil
tags: data, postgresql
---

Today I was looking into displaying data from the [US Census ACS](https://www.census.gov/acs/www/) (the most recent being the 2011 5-year estimates) alongside our analytics at [Kwelia](http://kwelia.com). Unfortunately, this data is only available in a pretty strange format (spread across thousands of text files) that is not easily queried. So, I decided that the first order of business was to get the data loaded into a PostgreSQL database and work from there.

I googled around and found a few projects on GitHub that were built for the purpose of loading this data into PostgreSQL. I settled on [this one](https://github.com/leehach/census-postgres), which did most of what I needed.

However, I had to make a few changes because I only wanted to load the data for the census tract level and ignore the other geographies because we can aggregate everything up from the census tract level in our app. You can check out what I ended up with in [my version](https://github.com/gphil/census-postgres).

It took me a little while to figure this out on my own, so hopefuly this is helpful for other people trying to use this data. Even after loading the data it's still fairly difficult to figure out what's where, but at least it's now in a format that's easier to manipulate and query.
