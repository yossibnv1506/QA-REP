#!/bin/bash
url =$1
ip = ":"$2
STATUS=$(curl -s -o /dev/null -w '%{http_code}' $url$ip)
  if [ $STATUS -eq 200 ]; then
    echo "Got 200! All done!"
#    exit 0 
  else
    echo "Got $STATUS :( DB Server not up yet..."
    exit 1
  fi
  


username= sort -R /usr/share/dict/words | head -1
text =  'hello '$RANDOM
JsonRes=$(curl -X POST -H "Content-Type:application/json" http://localhost:3000/postMessage -d '{"userId":"1","msg":$text}')
 if [ $STATUS -eq 200 ]; then
    echo "Got 200! All done!"
#    exit 0 
  else
    echo "Got $STATUS :( Information  Not saved ..."
    exit 1
  fi


