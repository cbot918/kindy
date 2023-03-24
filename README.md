# kindy
A Local K8S Bootstrap Template For Quick Learning

<br/>

## Pre Requesties
- linux or mac ( vm suggestion )

<br/>

## Getting Started
```
git clone https://github.com/cbot918/kindy && cd kindy
./install.sh
make image
```
then follow Makefile

<br/>

## 步驟說明
1. install docker / go / kind / kubectl
2. build image
3. apply pod
4. apply service
5. port-forward
6. curl to test server connection

<br/>

## 檔案說明
#### Makefile
- commands here
#### install.sh: 
- install requirements
#### services/auth/main.go: 
- a normal http server to test
#### services/auth/Dockerfile: 
- simple config to build image

#### pod.yaml
- create pod ( like container )
#### service.yaml
- create service ( like proxy server)

<br/>

## Dependencies
- docker-image: cbot918/auth ( kind 抓不到 local docker image 所以得依賴 放在雲上的image )

## 測試環境
1. ubuntu 20.04 ( native )
2. virtualbox ubuntu 20.04 ( vm )