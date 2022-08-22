
### 라즈베리파이 서버타입 wifi 설정변경
 1. raspi-config / 1-s1  변경
 
 2.  sudo nano /etc/wpa_supplicant/wpa_supplicant.conf 수정




## 라즈베리파이에 nCube Thyme 설치
https://usermanual.wiki/Document/UserGuidenCubeThymeNodejsv200KR.256947802/view

```
$ lsb_release -a
No LSB modules are available.
Distributor ID: Debian
Description:    Debian GNU/Linux 11 (bullseye)
Release:        11
Codename:       bullseye
```

 우분투의 비교하면 21.10
Ubuntu	Debian
22.04 jammy	bookworm/ sid - 12
21.10 impish	bullseye/ sid - 11

```
$ sudo apt install nodejs
$ sudo apt install npm
$ node -v
v12.22.12
$ npm -v
7.5.2
```

### wiringPi를 설치

```
git clone https://github.com/WiringPi/WiringPi.git
cd WiringPi/
./build
$ gpio -v
gpio version: 2.70
```
ref https://lunasword.tistory.com/42

run.sh
```
gcc -o gpio-led gpio-led.c -lwiringPi
./gpio-led
```

gpio-led.c
```
#include <stdio.h>
#include <wiringPi.h>
#define LED1 4 // BCM_GPIO 23
int main (void)
{
  if (wiringPiSetup () == -1)
  return 1 ;
  pinMode (LED1, OUTPUT) ;
  for (;;)
  {
    digitalWrite (LED1, 1) ; // LED ON
    delay (1000) ; // delay_1S
    digitalWrite (LED1, 0) ; // LED OFF
    delay (1000) ; // delay_1S
  }
  return 0 ;

}
```



### nCube-Thyme-Nodejs 설치

```
$ git clone https://github.com/IoTKETI/nCube-Thyme-Nodejs.git
$ cd nCube-Thyme-Nodejs 
$ npm install
$ node thyme.js
```



### ref
```
https://www.youtube.com/watch?v=vjw6w8s0wAw
https://www.youtube.com/watch?v=QvtAgIBC6Yg
https://youtu.be/kyCk6EZ0W4U?list=PL-ZgPBFZJJmmqbv4PvfCoLNVz40nKsGzZ

```





