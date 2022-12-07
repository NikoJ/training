tree .
docker build -t logs_task .
docker run --name logs_task logs_task

# task 5.3 
docker logs logs_task | wc -l

# task 5.4
docker logs logs_task > logs_.log

# task 5.5
echo '' > logs.log && docker logs logs_task >> logs.log 2>> logs.log
cat logs.log | wc -l

# task 5.6
# >     — запись stdout в файл
# >>    — дозапись stdout в файл
# 2>    — запись stderr в файл
# 2>>   — дозапись stderr в файл
docker logs logs_task > stdout.log 2> stderr.log
cat stdout.log stderr.log | grep 1