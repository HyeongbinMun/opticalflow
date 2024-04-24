# Optical-flow
 - 지능형비디오신호처리 중간 프로젝트

## Requirements
- [Docker](https://velog.io/@jinhasong/Docker-install)
- [Docker-compose](https://velog.io/@jinhasong/Docker-compose-install)

## How to Build
```shell
git clone [https://${PERSONAL_TOKEN}@github.com/${GithubID}/EDC-frontend.git](https://github.com/HyeongbinMun/opticalflow.git)
cd opticalflow
vi docker-compose.yml
```shell
# 포트 포워딩 변경
    ports:
      - "35000:22"     # ssh port
      - "35001:6006"   # tensorboard port
      - "35002:8000"   # jupyter notebook port
      - "35003:8888"   # web port
docker-compose up -d   # 도커 컨데이너 생성
```

## How to Use
### 프로젝트 시작
 - 도커 컨테이너 사용
```shell
# in local
docker attach optical-flow   # 도커 컨테이너 접속
cd croco                     # croco 모델 사용(자세한 사용은 croce README 참고)
cd unimatch                  # GMflow 모델 사용(자세한 사용은 Unifying README 참고)
```
- 도커 컨테이너 다중 접속 사용
```shell
# in local
docker exce -it ${container id or name} bash
```
```shell
# in local
ssh ${SERVER_IP}:${SSH PORT}
```

### jupyter notebook 사용
```shell
# in docker container
jupyter notebook password   # 주피터노트북 패스워드 설정
jupyter notebook            # 주피터노트북 실행
```
* 웹브라우저에서 ```http://${SERVER_IP}:${8888 PORT}/```으로 접속 가능

### tensorboard 사용
```shell
# in docker container
cd ${jupyter log directory}                          # 텐서보드 로그 위치로 이동
tensorboard --logdir=./ --port=6006 --bind_all       # 텐서보드 실행
```
* 웹브라우저에서 ```http://${SERVER_IP}:${8888 PORT}/```으로 접속 가능
