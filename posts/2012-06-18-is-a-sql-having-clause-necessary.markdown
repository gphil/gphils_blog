---
title: Is the SQL "HAVING" Clause Strictly Necessary?
author: gphil
tags: sql, databases, refactoring
---

The other day I was refactoring a SQL query containing a "HAVING" clause, and while I was thinking about that refactor, I realized that "HAVING" clauses can always in principle be reimplemented using a self-join to a subquery and a "WHERE" clause. 

My "proof" of this is that you can always write a subquery using the grouping and aggregate that you wish to filter on, then join the outer query to it using the columns in the grouping, and then filter the outer query using based on the result of the joined-in aggregate from the subquery.

Consider the following example, which selects all the ice cream parlors in cities that have over 5 ice cream parlors:

<script src="https://gist.github.com/3625695.js"> </script>

This can be re-written as:

<script src="https://gist.github.com/3625707.js"> </script>

It seems that all "HAVING" queries could in principle be re-written this way, undermining an explicit need for the "HAVING" clause. However, I think there are some benefits to using the "HAVING" clause, even if you don't necessarily need it to express your query.

The first and most obvious benefit of the "HAVING" clause is that the first query is shorter and easier to understand than the second query.

Another potential benefit of the "HAVING" clause is that depending on your database, there may be significant performance differences between these two approaches, although I haven't really looked into this at all yet other than to check that these queries generate significantly different explain plans in PostgreSQL.

Finally, I'm not 100% sure if all possible use cases of a "HAVING" clause can be rewritten using this method (or similar), but I haven't been able to come up with any counter-examples.

Does anyone know of any counter-examples that I'm missing, or have a more conclusive proof that all "HAVING" clauses can be re-written like this?
