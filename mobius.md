
# install mobius on ubuntu 22.04

# mysql -
``` 
sudo apt install mysql-server mysql-clients
sudo service mysql status
``` 

### 비번 잃어버렸을때 /초기 비번 설정할 때
``` 
$ sudo su
mysql -u root -p
Enter password:(엔터)
mysql> use mysql;
mysql> ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'pw1234';
(mysql> ALTER USER 'root'@'localhost' IDENTIFIED WITH caching_sha2_password BY 'pw1234'; x)

mysql> flush privileges;
mysql> exit;

#mysql -u root -p         (루트개정 주의 sudo mysql –u root –p)
Enter password:(pw1234)

``` 
ref https://freestrokes.tistory.com/43

### mobius
``` 
sudo apt install npm
sudo apt install nodejs

git clone https://github.com/IoTKETI/Mobius.git
cd Mobius
npm install

vi mobius.js
global.usesemanticbroker    = '112.187.67.20'; --> IP번호

``` 

### db
``` 
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
``` 

### MQTT
``` 
$ sudo apt install mosquitto
$ sudo apt install mosquitto-clients
$ mosquitto -v

#TEST
$mosquitto_sub -h localhost -t /mytopic/1 -m "Hello MQTT test"
$mosquitto_pub -h localhost -t /mytopic/1 -m "Hello MQTT test"
``` 


### mobius 구동
``` 
db설정, mqtt 포트번호 설정

$ vi conf.json            (이 파일은 mobius.js 파일고 같은 경로에) 
{
	"csebaseport":	"7579",
	"dbpass":	"pw1234"
}
$ node mobius.js
``` 

### 인용
``` 
https://github-wiki-see.page/m/IoTKETI/Mobius/wiki/Mobius_v2.0.0_KR_Linux
https://swpfun.tistory.com/701
http://203.253.128.161:7575
https://github.com/zerover0/projects/blob/master/mobius/mobius_yellow_turtle_2.3.4_install_on_ubuntu_14.04.md
https://www.notion.so/Linux-1b0c93fdb01746f49991edc4e539b457
https://www.notion.so/seunghwanly/Mobius-Guideline-5915345348974cee92933db99104b18f
https://velog.io/@seunghwanly/Linux-%ED%99%98%EA%B2%BD
https://velog.io/@hsw1606/%EC%9A%B0%EB%B6%84%ED%88%AC%EC%97%90-MySQL-%EC%84%A4%EC%B9%98-%EB%B0%8F-%EA%B3%84%EC%A0%95-%EC%84%A4%EC%A0%95%ED%95%98%EA%B8%B0
https://www.jopenbusiness.com/mediawiki/Mobius
``` 



## mobius docker 사용예
``` 
https://github.com/seunghwanly/mobius-docker/tree/main/mobius/mobius-2.4.36

``` 


## DB Connection Error

mobius를 구동할때 db연결에서 에러가 발생하는 경우
``` 
[db.connect] No Connection

``` 
### checklist
- [ ] Check if the `root`'s `plugin` is set to `caching_sha2_password`, update to `mysql_native_password`
- [ ] Lastly, check `conf.json` file if it is updated properly
- [ ] Check if the `mysql` is running, in this repo, the basic code runs at `localhost:3306`


### Check Mysql settings
- use `mysql` database which is already created when you download MySQL
- write command below in sequence
``` sql
USE mysql;
```
``` sql
SELECT User, Host, plugin FROM USER;
```
Expected result)
``` plain
+------------------+-----------+-----------------------+
| User             | Host      | plugin                |
+------------------+-----------+-----------------------+
| mysql.infoschema | localhost | caching_sha2_password |
| mysql.session    | localhost | caching_sha2_password |
| mysql.sys        | localhost | caching_sha2_password |
| root             | localhost | caching_sha2_password |
+------------------+-----------+-----------------------+
```
Change `caching_sha2_password` to `mysql_native_password`

``` sql
UPDATE USER SET plugin='mysql_native_password' WHERE User='root';
```
``` sql
FLUSH PRIVILEGES;
```

Check the results
<img width="354" alt="스크린샷 2022-01-16 오후 3 33 11" src="https://user-images.githubusercontent.com/22142225/149649933-86c6a5c5-22ea-4dd8-9e7d-162f290d63f1.png">

#### AFTER PROBLEM

when you tried to acces with `mysql -u root -p` and below message occurs, we need to reset the password of root.
``` plain
Access denied for user 'root'@'localhost' (using password: YES)
```
1. stop the Mysql
2. get-in with non-login mode
    ``` bash
    mysqld_safe --skip-grant-tables &
    ```
    then use non-password mode
    ``` bash
    mysql -u root
    ```
3. Make existing password to `null`
    ``` sql
    UPDATE USER SET authentication_string=null WHERE User='root';
    ```
    ``` sql
    FLUSH PRIVILEGES;
    ```
    ``` sql
    exit;
    ```
4. Set new password
    ``` bash
    mysql -u root
    ```
    ``` sql
    USE USER;
    ```
    ``` sql
    ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'NEW_PASSWORD!';
    ```
    set same password with `conf.json`

<img width="386" alt="스크린샷 2022-01-16 오후 3 42 00" src="https://user-images.githubusercontent.com/22142225/149650126-f260e717-00b3-4312-9e7e-236fc0cd7387.png">


---

<p align="center">
    <a href="#version">Version</a> •
    <a href="#summary">Summary</a> •
    <a href="#requirements">Requirements</a> •
    <a href="#usage">Usage</a>
</p>

---



### Check Network
- in MacOS
``` bash
netstat -anv | grep LISTEN
```
<img width="453" alt="스크린샷 2022-01-16 오후 3 40 41" src="https://user-images.githubusercontent.com/22142225/149650094-63f316d1-5455-435a-81b5-bffc750f02fd.png">


sudo service mysql restart














