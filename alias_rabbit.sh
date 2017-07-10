#!/bin/bash
alias ras='brew services restart rabbitmq'
alias ralq='rabbitmqadmin list queues'
alias rapq='rabbit_purge_queues'
alias ralc='rabbitmqadmin list consumers'

queues_with_items () {
  ralq | while read line
  do
    QUEUE_TOTAL=`echo "$line" | awk '{print $4}'`
    IS_NUMBER_MASK='^[0-9]+$'
    if [[ $QUEUE_TOTAL =~ $IS_NUMBER_MASK ]] && [[ $QUEUE_TOTAL -gt 0 ]]; then
      echo $line | awk '{print $2,$4}'
    fi
  done
}

rabbit_purge_queues() {
  rabbitmqadmin list queues name | awk '{print $2}' | while read line
  do
    if [ "$line" == "name" ] || [ "$line" == "" ] ; then
      continue
    fi
    OUTPUT=`rabbitmqadmin purge queue name="$line"`
    echo "$OUTPUT: $line"
  done
};

