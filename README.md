# Optical-flow
 - 지능형비디오신호처리 중간 프로젝트

## Requirements
- [Docker](https://velog.io/@jinhasong/Docker-install)
- [Docker-compose](https://velog.io/@jinhasong/Docker-compose-install)

## How to Build
```shell
git clone https://${PERSONAL_TOKEN}@github.com/${GithubID}/EDC-frontend.git
cd EDC-frontend
docker-compose up -d
```

## How to Use
### 개발 환경
```shell
# in Host
docker attach edc-frontend_main
# in docker container
npm start
```
* 웹브라우저에서 ```http://${SERVER_IP}:3000/```으로 접속 가능 
### Nginx 배포
```shell
# in Host
docker attach edc-frontend_main
# in docker container
npm run build
```
* 웹브라우저에서 ```http://${SERVER_IP}:3080/```으로 접속 가능
