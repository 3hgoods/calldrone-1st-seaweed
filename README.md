# callrone-1st-worklab
이 싸이트는 스마트인재개발원 참여자들이 팀원으로 참여하는
인공지는산업융합사업단 지원 "인공지능 기반 식물활력도 분석전문가 교육과정"의 개발 내용을 
공유한 내용입니다.
AI 융합프로젝트 교육사업의 결과로 "인공지능 기반  김 수확저하(황백화) 예측 및 대응시스템 마련"을 주제로
개발과정의 내용을 정리한 공간입니다.

참여자는 최신애,조성국,이국진,이준호,정종선 5인이며
프로젝트 진행을 돕는 강사로 윤재순대표, 이지민교수, 김대연박사가 참여하였습니다.

역할 분담은 아래와 같습니다.
강사
 - 윤재순 대표: 초분광 카메라 광학계, 드론제어를 위한 Mavlink및 ROS 기초교육
 - 이지민 교수: 인공지능 기초(yolo-클래검사), 초분광 카메라 재구성 인공지능, 해수데이터 분석 인공지능 교육
 - 김대연 박사: 식생(김)지수 분석을 위한 강의, 해수데이타 분석 

참여자 개발자
 - 최신애(초분광 기반 프로젝트) : 김의 초분광이미지 획득
                                Snapshot 초분광 영상촬영
                                Linescan 초분광 영상 촬영
                                영상이어붙이기 등

 - 조성국 (인공지능 기반 프로젝트) :해양데이타 질병발병 알고리즘
                                  저성능 CPU기반 초분광 재구성
                                  초분광 해상도 증진 알고리즘 등
                                  
 - 이국진 (python기반 프로젝트) : 매크로를 이용한 해수공공정보 데이터화
                                MavSDK-python 이용 드론제어
                                scikit-learn(python) 이용 해수빅데이터 분석

 -이준호(app 기반 프로젝트): 백단 mobius 서버 app과의 연동 프로그램
                           해수발병예측정보서비스 APP(최가네 김샵)
                           스마트폰기반 초분광이미지 분석 APP
                           드론방역 APP 등등

 -정종선(셋팅 기반 프로젝트): mobius 통합관리 서버셋팅
                           라인스캔카메라 전동스테이지 프로그램
                           초분광시스템 구축지원 등


# docker 기반 mobius 설치
1. Download Mobius_Docker from KETI's git repository

$sudo git clone https://github.com/3hgoods/callrone-1st-worklab.git
$cd callrone-1st-worklab
$mkdir config
$mkdir data
$mkdir log

- 환경 설정 파일 작성
- 자동 개행 방식을 CR+LF가 아니라 LF로 저장해야 오류가 발생하지 않음
$ nano ./config/mosquitto.conf
persistence false
allow_anonymous true
connection_messages true
log_type all
listener 1883

$chmod +x install.sh

2. Execute "install.sh"
$sudo ./instatll.sh

3. Execute "run.sh"
$chmod +x run.sh
$sudo ./run.sh

4. Test using cURL
$sudo ./test.sh



You can follows below commands for each objective

Stop mobius docker containers 
"sudo ./stop.sh"

Remove mobius docker containers
"sudo ./remove.sh"

Check status of mobius docker containers
"sudo ./status.sh"

Show logs of mobius docker containers
"sudo ./logs.sh"



