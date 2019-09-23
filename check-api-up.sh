#!/bin/bash
echo "Verify DB is up before inserind data"
url =$1
ip = ":"$2
STATUS=$(curl -s -o /dev/null -w '%{http_code}' $url$ip)
  if [ $STATUS -eq 200 ]; then
    echo "Got 200! DB Up --continuing to next test!"
#    exit 0 
  else
    echo "Got $STATUS :( DB Server not up yet..."
    exit 1
  fi
  
dpkg -s jq &> /dev/null
if [ $? -eq 1 ]; then
apt intall -y jq #json utility 
#username= sort -R /usr/share/dict/words | head -1
fi
text =  'hello '$RANDOM
res=$(curl -X POST -H "Content-Type:application/json" http://localhost:3000/postMessage -d '{"userId":"1","msg":$text}' | jq  '.success')

 if [ $res -eq 'true' ]; then
    echo "Got sucess! data saved!"
#    exit 0 
  else
    echo "Got $STATUS :( Information  Not saved ..."
    exit 1
  fi


