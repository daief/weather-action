###
# @Author: daief
# @LastEditors: daief
# @Date: 2019-12-24 16:06:57
# @LastEditTime: 2020-01-08 20:21:09
# @Description:
###
#!/bin/sh

set -e

input=$1

# 获取到 curl 的结果
WEATHER=$(curl "wttr.in/Hangzhou+Jiangcun?lang=zh-CN&format=4&m")

# 获取诗句，ref: https://v1.jinrishici.com
VERSE=$(curl "https://v1.jinrishici.com/shuqing.txt")

URLS=(${input//,/ })

for url in ${URLS[@]}; do
  curl -s $url \
    -H 'Content-Type: application/json' \
    -d "{

    \"msgtype\": \"text\",
    \"text\": {
      \"content\": \"$VERSE\n$WEATHER\"
    }
  }"
done
