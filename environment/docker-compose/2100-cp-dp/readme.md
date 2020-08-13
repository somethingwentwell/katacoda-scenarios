## Demonstrating Control Plane/Data Plane Separation

Links: https://docs.google.com/presentation/d/1ieFnG38h9W0vNo5jcbHFURefJRcSvaxKBuBlxDS9O6o/edit

##### prework: run `docker-compose up -d` and then `./demo-calls.sh` to setup the environment.

Here we have a local setup of Kong, with a single control plane node (port 8001), and two data plane nodes (8000 and 8010). We also have a container of Redis and separate container of Httpbin running.

**Tell**: The control plane configures the data planes and here we will show you a rate limit enforced across both data planes with the limits coordinated thru Redis.

**Show**: `http :8000/rateLimit` and then `http :8010/rateLimit`

**Tell**: Notice how the data planes operate independently and protect the calls to Httpbin.

***

**Tell**: Next, let's stop the Control Plane and see if that affects the functionality. What do you think should happen?

**Show**: `docker stop kong-cp` and then `http :8000/rateLimit` and `http :8010/rateLimit`

**Tell**: What you have just seen is that the Data Planes function without a connection to the Control Plane because once set, they are designed to run independently, yet can still coordinate their limits through Redis.

***

**Tell**: Next, let's look at caching. This has two purposes: 1) it delivers faster performance for those calling your services; 2) it can relieve pressure on those services. Here we will make a call to a cacheable API, and notice the cache status and upstream latency values. After that, we will shut down the backend service and notice that the call to the proxy still returns the data.

**Show**: `http :8000/cache` (status miss) `http :8000/cache` (status hit) and then `docker stop httpbin` `http :8000/cache`

**Tell**: What you have just seen is a demonstration of the resilence of the architecture and ability to weather outages and increase performance.

***

That concludes this brief demonstration of the power of Control Plane and Data Plane separation augmented with the power of Kong's plugins.

NOTE: For completeness, there is also a /localRL endpoint configured with a Rate-Limiting plugin that doesn't use Redis, instead using local node memory. It might prove useful in a situation where you desire a simpler architecture (one without Redis) and do not need coordinated rate limits.
