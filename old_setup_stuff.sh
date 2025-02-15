#! /bin/bash

ps aux | grep lotus_run.sh | awk '{ print $2 }' | xargs kill -s 9
ps aux | grep nodejs | awk '{ print $2 }' | xargs kill -s 9

curl -u lotus:$(cat .password-file) -X DELETE https://lotus.lucy.surfsara.nl/lotus1
#export ES_HEAP_SIZE="16096M"
#export MAX_OPEN_FILES="41000"

./create_index_v2.1.sh

rm done.txt
rm errors.txt
rm logs.txt
rm notexist.txt
rm chunks.data
echo -e "Stored\tRead\tNumbers\n" > logs.txt
