
cd 
sleep 2
gnome-terminal -- wget https://dlcdn.apache.org/kafka/2.8.1/kafka-2.8.1-src.tgz

sleep 70

tar -xvzf kafka-2.8.1-src.tgz
sleep 30




mv kafka-2.8.1-src kafka
sleep 15

cd ~/kafka/config

sleep 10

sed -i 's!#listeners=PLAINTEXT://:9092!listeners=PLAINTEXT://localhost:9092!g' server.properties

sleep 3


gnome-terminal -- ~/kafka/bin/zookeeper-server-start.sh ~/kafka/config/zookeeper.properties

sleep 30

gnome-terminal -- ~/kafka/bin/kafka-server-start.sh ~/kafka/config/server.properties

sleep 30

gnome-terminal -- ~/kafka/bin/kafka-topics.sh --create --bootstrap-server localhost:9092 --replication-factor 1 --partitions 1 --topic test1

sleep 20

gnome-terminal -- ~/kafka/bin/kafka-console-producer.sh --broker-list localhost:9092 --topic test1

sleep 20

gnome-terminal -- ~/kafka/bin/kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic test1 --from-beginning





