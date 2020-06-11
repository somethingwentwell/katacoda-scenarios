# Create a two node Kong cluster with Gojira and add some 'network latency' 
# Node 1 -

cd $(gojira cd -t 1.3.0.2)

gojira up -p n1 -n 1.3.0.2-two-nodes -k . -pp 8000:8000 -pp 8001:8001 --postgres --host kong1

gojira shell -p n1 -k .

luarocks make

kong migrations bootstrap

export KONG_LOG_LEVEL=debug

kong start


# Node 2 -

cd $(gojira cd -t 1.3.0.2)

gojira up -p n2 -n 1.3.0.2-two-nodes -k . -pp 8002:8000 -pp 8003:8001 --host kong2 --alone

gojira shell -p n2 -k .

luarocks make

export KONG_LOG_LEVEL=debug

kong start


# Shell into  each kong nodes to set the delay --  

apt-get install iproute2 software-properties-common

tc qdisc add dev eth0 root netem delay 200ms

tc qdisc show

# verify that the 50ms of delay is in effect

ping n2-kong-ee-1302-cb65619e4106f5adf58c4ced19b5fd5f_kong_1

ping n1-kong-ee-1302-cb65619e4106f5adf58c4ced19b5fd5f_kong_1

# If you want to change it to test higher latencies do the following on both nodes

tc qdisc change dev eth0 root netem delay 200ms