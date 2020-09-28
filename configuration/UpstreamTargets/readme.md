## Configure an Upstream Target as another Kong Node

This configuration is designed to mimic Enterprise Holdings 'multi hop' architecture. They have Kong nodes deployed in different platforms and to direct traffic to the node hosted in the environment witht the intended upstream service they chain Kong to other Kong proxy nodes. 


Prerequisite: 
At least two Kong proxy nodes. 

This deck file will create the following entities : 
- 2 Services
- 2 routes
- 2 Upstreams
- 2 Targets
- 1 Key-Auth plugin

You will need to modify the target on line '107' to be your kong proxy domain. 


 The upstream target of the first 'node' points to second Kong proxy node. The second proxy node then routes the traffice to the service and actual upstream target. 
 
