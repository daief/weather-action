###
# @Author: daief
# @LastEditors: daief
# @Date: 2019-12-24 16:06:57
# @LastEditTime: 2019-12-24 17:15:29
# @Description:
###
#!/bin/sh

set -eux

# 获取到 curl 的结果
WEATHER=$(curl "wttr.in/Hangzhou+Jiangcun?lang=zh-CN&format=4&m")

curl $1 \
  -H 'Content-Type: application/json' \
  -d "{
    \"msgtype\": \"text\",
    \"text\": {
      \"content\": \"$WEATHER\"
    }
  }"
