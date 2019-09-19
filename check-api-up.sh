#!/bin/bash
url =$1
echo $url
ip = $2
echo $ip 

 STATUS=$(curl -s -o /dev/null -w '%{http_code}' $url$ip)
  if [ $STATUS -eq 200 ]; then
    echo "Got 200! All done!"
#    exit 0 
  else
    echo "Got $STATUS :( Api Server not up yet..."
    exit 1
  fi
  


username= sort -R /usr/share/dict/words | head -1
review =  'hello'$username
STATUS =$(curl -v -H  "Content-Type: application/json" -X POST --data '{$username ,$review}' -o /dev/null -w '%{http_code}' $url$ip)
 if [ $STATUS -eq 200 ]; then
    echo "Got 200! All done!"
#    exit 0 
  else
    echo "Got $STATUS :( Information  Not saved ..."
    exit 1
  fi


