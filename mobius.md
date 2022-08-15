
# install mobius on ubuntu 22.04

# mysql -
sudo apt install mysql-server mysql-clients
sudo service mysql status

##비번 잃어버렸을때 /초기 비번 설정할 때
$ sudo su
mysql -u root -p
Enter password:(엔터)
mysql> use mysql;
mysql> ALTER USER 'root'@'localhost' IDENTIFIED WITH caching_sha2_password BY 'pw1234';
mysql> flush privileges;
mysql> exit;

#mysql -u root -p         (루트개정 주의 sudo mysql –u root –p)
Enter password:(pw1234)

ref https://freestrokes.tistory.com/43

# mobius
sudo apt install npm
sudo apt install nodejs

git clone https://github.com/IoTKETI/Mobius.git
cd Mobius
npm install

vi mobius.js
global.usesemanticbroker    = '112.187.67.20'; --> IP번호

# db

cd mobius
ls 
  ... mobiusdb.sql 
  
#mysql -u root -p          (sudo mysql –u root –p)
Enter password:(pw1234) 

mysql> CREATE DATABASE mobiusdb;
Query OK, 1 row affected (0.23 sec)

mysql> SHOW DATABASES;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mobiusdb           |
| mysql              |
| performance_schema |
| sys                |
+--------------------+
5 rows in set (0.00 sec)

root@3H:/home/goods/Mobius/mobius# sudo mysql -u root -p mobiusdb < mobiusdb.sql
Enter password:(pw1234) 

#mysql -u root -p 
Enter password:(pw1234)

mysql> use mobiusdb;
mysql> SHOW TABLES;
+--------------------+
| Tables_in_mobiusdb |
+--------------------+
| acp                |
| ae                 |
| cb                 |
....
| ts                 |
| tsi                |
+--------------------+
25 rows in set (0.01 sec)

# MQTT
$ sudo apt install mosquitto
$ sudo apt install mosquitto-clients
$ mosquitto -v

#TEST
$mosquitto_sub -h localhost -t /mytopic/1 -m "Hello MQTT test"
$mosquitto_pub -h localhost -t /mytopic/1 -m "Hello MQTT test"



# mobius 구동

db설정, mqtt 포트번호 설정

$ vi conf.json            (이 파일은 mobius.js 파일고 같은 경로에) 
{
	"csebaseport":	"7579",
	"dbpass":	"pw1234"
}
$ node mobius.js

# 인용
https://github-wiki-see.page/m/IoTKETI/Mobius/wiki/Mobius_v2.0.0_KR_Linux
https://swpfun.tistory.com/701
http://203.253.128.161:7575
https://github.com/zerover0/projects/blob/master/mobius/mobius_yellow_turtle_2.3.4_install_on_ubuntu_14.04.md
https://www.notion.so/Linux-1b0c93fdb01746f49991edc4e539b457
https://www.notion.so/seunghwanly/Mobius-Guideline-5915345348974cee92933db99104b18f
https://velog.io/@seunghwanly/Linux-%ED%99%98%EA%B2%BD
https://velog.io/@hsw1606/%EC%9A%B0%EB%B6%84%ED%88%AC%EC%97%90-MySQL-%EC%84%A4%EC%B9%98-%EB%B0%8F-%EA%B3%84%EC%A0%95-%EC%84%A4%EC%A0%95%ED%95%98%EA%B8%B0
https://www.jopenbusiness.com/mediawiki/Mobius




# mobius docker 사용예

https://github.com/seunghwanly/mobius-docker/tree/main/mobius/mobius-2.4.36









sudo service mysql restart














