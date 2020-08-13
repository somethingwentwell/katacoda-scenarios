#!/bin/sh
#setup service
http :8001/services name=myservice url='http://httpbin/anything'
#setup route and proxy cache plugin
http -f :8001/services/myservice/routes name='cache' paths="/cache"
http -f :8001/routes/cache/plugins name=proxy-cache config.strategy=memory
#setup route and redis rate limiting plugin config
http -f :8001/services/myservice/routes name='rateLimit' paths="/rateLimit"
http -f :8001/routes/rateLimit/plugins name=rate-limiting config.minute=5 config.hour=1000 config.policy=redis config.redis_host=redis
#setup route and local rate limiting plugin config
http -f :8001/services/myservice/routes name='localRL' paths="/localRL"
http -f :8001/routes/localRL/plugins name=rate-limiting config.minute=5 config.hour=1000 config.policy=local
