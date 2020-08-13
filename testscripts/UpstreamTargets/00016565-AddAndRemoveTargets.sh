MAX_FAILURES=10
MAX_TRIES=10

while true; do
    # REPROD SCENARIO
    set -x
#    KONG_PREFIX=servroot1 $KONG_BIN reload -c ./kong1.conf
#    KONG_PREFIX=servroot2 $KONG_BIN reload -c ./kong2.conf
    for i in `seq 10`; do
        http GET :8003/upstreams/hop1/targets/-h >/dev/null &
    done
    wait
    http POST :8003/upstreams/hop1/targets/ target=n2-kong-ee-1302-cb65619e4106f5adf58c4ced19b5fd5f_kong_1:8000 weight=0 -f -h
    http POST :8003/upstreams/hop1/targets/ target=n2-kong-ee-1302-cb65619e4106f5adf58c4ced19b5fd5f_kong_1:8000 weight=100 -f -h
    set +x
    #
    FAILURES=0
    TRIES=1
    HAS_FAILED=0
    while [[ ($TRIES -le $MAX_TRIES) && ($FAILURES -lt $MAX_FAILURES) ]]; do
        echo "TRY $TRIES/$MAX_TRIES"
        set -x
        http :8000/hop1 --check-status -h
        EXIT="$?"
        set +x
        if [ $EXIT -ne 0 ] ; then
            if [ $HAS_FAILED -eq 0 ]; then
                HAS_FAILED=1
            fi
            FAILURES=$((FAILURES+1))
            echo "FAILURE $FAILURES/$MAX_FAILURES"
        elif [ $HAS_FAILED -eq 1 ]; then
            echo "BALANCER HAS RECOVERED"
            break
        fi
        TRIES=$((TRIES+1))
    done
    if [ $FAILURES -ge $MAX_FAILURES ]; then
        echo "REPRODUCED"
        exit 1
    fi
    echo "RETRYING"
done