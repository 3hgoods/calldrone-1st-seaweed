
### 라즈베리파이 서버타입 wifi 설정변경
 1. raspi-config / 1-s1  변경
 
 2.  sudo nano /etc/wpa_supplicant/wpa_supplicant.conf 수정




### 라즈베리파이에 nCube Thyme 설치
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









