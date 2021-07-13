# kong_master_CP_multiple_dbless_slave

Deploys 1 master Kong Control Plane(CP) with Postgresql and 2 slave dbless Kong.

## User case

Run seperate Kong with a specific workspace

## How to use

1. Run `docker-compose -f master-cp-db.yml up -d` to deploy master CP and DB

2. Apply below to master CP to create objects in multiple workspaces

```
$ deck sync -s default.yaml --headers kong-admin-token:admin
creating service default
creating route default
Summary:
  Created: 2
  Updated: 0
  Deleted: 0
$ deck sync -s test.yaml --headers kong-admin-token:admin
creating workspace test
creating service test
creating route test
Summary:
  Created: 2
  Updated: 0
  Deleted: 0
```

3. Run `docker-compose -f sub-dbless-kong.yml up -d` to deploy sub dbless Kong
 - default workspace configuration has been applied to http://localhost:18002 (sub dblss kong1)
 - test workspace configuration has been applied to http://localhost:28002 (sub dblss kong2)

4. Check result

```
# check sub dblss kong1
$ curl localhost:18000/default -i
>HTTP/1.1 200 OK
$ curl localhost:18000/test -i
>HTTP/1.1 404 Not Found

# check sub dblss kong2
curl localhost:28000/default -i
>HTTP/1.1 404 Not Found
curl localhost:28000/test -i
>HTTP/1.1 200 OK
```


## Additional feature

## How to update sub dblss kong

1. Run below command to get the latest configuration of master CP

```
$ deck dump --all-workspaces --headers kong-admin-token:admin
```

2. Assume there is a modification in test workspace.
Then update the test.yaml which is mount to the sub dblss kong2

3. Update the configuration of the sub dblss kong2

```
$ curl -X POST http://localhost:28001/config -F "config=@test.yaml"
```
