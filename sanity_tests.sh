#!/bin/bash
echo "Verify DB is up before inserind data"
#url=$1
#ip=":"$2
num=1
STATUS=$(curl -s -o /dev/null -w '%{http_code}' localhost:27017)
  if [ $STATUS -eq 200 ]; then
    echo "Got 200! DB Up --continuing to next test!"
#    exit 0 
  else
    echo "Got $STATUS :( DB Server not up yet..."
    exit 1
  fi
  
dpkg -s jq &> /dev/null
if [ $? -eq 1 ]; then
apt intall -y jq  # json utility 
#username= sort -R /usr/share/dict/words | head -1
fi
text='hello '$RANDOM
echo "**check data stored in DB with API request**" 
res=$(curl -s -X POST -H "Content-Type:application/json" http://localhost:3000/postMessage -d '{"userId":"'"$num"'","msg":"'"$text"'"}' | jq  '.success')
#echo "json results= "$res
if [ "$res" == "true" ]; then
    echo "Got sucess! data saved!"
#    exit 0 
  else
    echo "Got $res :( Information  Not saved ..."
    exit 1
  fi

 echo "checking results from web interface"
 touch result.html
 curl  -d "userId=$num"  "http://18.208.150.21:5000/result" > result.html 2>&1
 isInFile=$(cat result.html | grep -c "text")


if [ $isInFile -eq 0 ]; then
 echo " #string not contained in file"
 exit 1 
 
else
echo " #string is in file at least once"
fi
 rm -f result.html
