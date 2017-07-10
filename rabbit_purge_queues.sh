#!/bin/bash

rabbitmqadmin list queues name | awk '{print $2}' | while read line
do
  if [ "$line" == "name" ] || [ "$line" == "" ] ; then
    continue
  fi
  OUTPUT=`rabbitmqadmin purge queue name="$line"`
  echo "$OUTPUT: $line"
done
