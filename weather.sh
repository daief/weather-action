###
# @Author: daief
# @LastEditors: daief
# @Date: 2019-12-24 16:06:57
# @LastEditTime: 2020-01-08 19:26:26
# @Description:
###
#!/bin/sh

set -eux

# 获取到 curl 的结果
WEATHER=$(curl "wttr.in/Hangzhou+Jiangcun?lang=zh-CN&format=4&m")

# 获取诗句，ref: https://v1.jinrishici.com
VERSE=$(curl "https://v1.jinrishici.com/shuqing.txt")

# curl $1 \
#   -H 'Content-Type: application/json' \
#   -d "{

#     \"msgtype\": \"text\",
#     \"text\": {
#       \"content\": \"$VERSE\n$WEATHER\"
#     }
#   }"

for url in $1; do
  curl $url \
    -H 'Content-Type: application/json' \
    -d "{

    \"msgtype\": \"text\",
    \"text\": {
      \"content\": \"$VERSE\n$WEATHER\"
    }
  }"
done
