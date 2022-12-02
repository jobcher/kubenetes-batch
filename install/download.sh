#!/bin/bash
# url变量
url="https://img.offers-cdn.net/assets/uploads/flyers/1291377/zoomLarge"
i=1
#检测url是否正常
echo `curl -I -m 10 -o /dev/null -s -w %{http_code} $url/kmart-$i-1.jpg`
# 循环
while [ $i -le 1000 ]
do
if [ $(curl -I -m 10 -o /dev/null -s -w %{http_code} $url/kmart-$i-1.jpg) != 200 ]
then
    echo "下载结束"
    break
fi
echo "$url/kmart-$i-1.jpg"
wget $url/kmart-$i-1.jpg
((i++))
done