# Producer 

kafka = Kafka.new(['kafka:9092'])
producer = kafka.producer
producer.produce('testing kafka producer', topic: 'greetings')
producer.deliver_messages
producer.shutdown

#Consumer

kafka.each_message(topic: 'greetings') { |message| puts message.offset, message.key, message.value }
