---
title: Is It Possible to Securely Meter a Client-Facing API?
author: gphil
tags: security, apis
---

Imagine that your business provides a paid API (or since you're reading this blog, there's a good chance it actually does), and you want to meter the number of calls to it so that you can bill the API consumers based on their usage.

The best way to do this is to provide a unique secret token to each consumer of the API. Then, you require that the consumer includes the secret token with each API call in order to authenticate that they are allowed to access the API. You can also measure the usage associated with each token. So long as these authentication tokens stay secret, so good.

But what about environments where the API consumer can't keep their token secret? For example, consider a client-side JavaScript app or a native mobile app where the binary is provided to an untrusted tablet or phone. In both of these cases it is possible for a malicious third party to discover the secret token and authenticate to the API on the legitimate consumer's behalf (by posing as the consumer using their token.) This is a pretty big issue. There's basically no way around this if they API needs to be called from an untrusted source. (For more information on this, see [this essay](http://www.schneier.com/essay-063.html).)

It seems to me that the best you can do is to also log the IP address and the top-level domain that the request is originating from (if it's available.) I think this must be what the [Google Maps JavaScript API](https://developers.google.com/maps/documentation/javascript/reference) is doing, as they provide a metered service to client-side JavaScript apps without requiring a secret token. However, these identifiers can also be easily forged or changed by malicious consumers when limits are reached.

You could go a step further and look at the actual usage patterns of the API and decide which are legitimate and which are not based on the legitimate client's historical usage of the API. But this would be a lot of effort, and would likely be prone to false positives.

I'm not a security expert (just a developer who strives to make secure software) so I don't know if there are more or better techniques, but it seems like any API accessible from an environment that can be accessed by malicious third parties is susceptible.

It would be interesting to study how the aforementioned Google Maps API is enforcing its metering. Perhaps Google is just willing to accept some amount of unauthorized access? I would love to hear how existing APIs in this category cope with this problem.