#!/bin/bash

COOKIE_JAR="/tmp/ab-login-cookie-jar"

echo "Logging in..."

curl -c $COOKIE_JAR -d username=admin -d password=admin http://symfonywin.azurewebsites.net/admin/articles

echo "Getting the session id..."
PHPSESSID=$(cat $COOKIE_JAR | grep PHPSESSID | cut -f 7)

echo "The session id is:"
echo $PHPSESSID
echo "=================="

ab -n 10 -c 10 -C PHPSESSID=d515fb9c542545ba56dc951ebf20217f http://symfonywin.azurewebsites.net/admin/articles