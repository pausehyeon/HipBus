/* 관리자*/
insert into hb_member values('admin@hipbus.com', 'Admin1', 'a1a1a1', 3, sysdate, 'AdminLogo.png');
insert into hb_verification values('admin@hipbus.com', -1);

/* 1등급회원 */
insert into hb_member values('aaa@email.com', 'Jueun', 'a1a1a1', 1, sysdate, 'aaa.png');
insert into hb_member values('bbb@email.com', 'Gahyeon', 'a1a1a1', 1, sysdate, 'bbb.png');
insert into hb_member values('ccc@email.com', 'Jihyeon', 'a1a1a1', 1, sysdate, 'ccc.png');
insert into hb_member values('ddd@email.com', 'Victory', 'a1a1a1', 1, sysdate, 'ddd.png');
insert into hb_member values('eee@email.com', 'Jaeduek', 'a1a1a1', 1, sysdate, 'eee.png');


insert into hb_member values('proj.hipbus@gmail.com', 'hipbus', 'a1a1a1', 1, sysdate, 'AdminLogo.png');

insert into hb_driver values('proj.hipbus@gmail.com');
insert into hb_driver values('aaa@email.com');
insert into hb_driver values('bbb@email.com');
insert into hb_driver values('ccc@email.com');
insert into hb_driver values('ddd@email.com');
insert into hb_driver values('eee@email.com');

insert into hb_verification values('proj.hipbus@gmail.com', -1);
insert into hb_verification values('aaa@email.com', -1);
insert into hb_verification values('bbb@email.com', -1);
insert into hb_verification values('ccc@email.com', -1);
insert into hb_verification values('ddd@email.com', -1);
insert into hb_verification values('eee@email.com', -1);

/* 2등급회원*/
insert into hb_member values('fff@email.com', 'Jihun', 'a1a1a1', 2, sysdate, 'fff.png');
insert into hb_member values('ggg@email.com', 'Jaehyeong', 'a1a1a1', 2, sysdate, 'ggg.png');
insert into hb_member values('hhh@email.com', 'Seongyong', 'a1a1a1', 2, sysdate, 'hhh.png');
insert into hb_member values('iii@email.com', 'Betrayer', 'a1a1a1', 2, sysdate, 'iii.png');
insert into hb_member values('jjj@email.com', 'Juda', 'a1a1a1', 2, sysdate, 'jjj.png');

insert into hb_driver values('fff@email.com');
insert into hb_driver values('ggg@email.com');
insert into hb_driver values('hhh@email.com');
insert into hb_driver values('iii@email.com');
insert into hb_driver values('jjj@email.com');

insert into hb_verification values('fff@email.com', -1);
insert into hb_verification values('ggg@email.com', -1);
insert into hb_verification values('hhh@email.com', -1);
insert into hb_verification values('iii@email.com', -1);
insert into hb_verification values('jjj@email.com', -1);

/* 광고 */
insert into hb_ad values(1, '', 'ad1.png');
insert into hb_ad values(2, '', 'ad2.png');
insert into hb_ad values(3, '', 'ad3.png');

/* Station글쓰기*/
insert into hb_station values(hb_stationseq.nextval,'aaa@email.com',6,'Jueun','잘부탁드립니다.','<p>안녕하세요 ㅋㅋㅋ .</p>활동열심히하겠습니다.
',0,0,sysdate);
insert into hb_station values(hb_stationseq.nextval,'aaa@email.com',1,'Jueun','(창모 느낌나는 피아노 비트) Piano Scribble','<p>안녕하세요 Jueun 입니다.</p>
<p>Youtube :</p><iframe allowfullscreen="" frameborder="0" height="360" src="//www.youtube.com/embed/hRngH4aDBgU" width="640"></iframe><p>잘부탁드립니다.</p>',0,0,sysdate);
insert into hb_station values(hb_stationseq.nextval,'aaa@email.com',1,'Jueun','자작비트입니다.피드백부탁드립니다.','<p>안녕하세요 Jueun 입니다.</p>
<p>Youtube :</p><iframe allowfullscreen="" frameborder="0" height="360" src="//www.youtube.com/embed/fkmkGcvFEVA" width="640"></iframe><p>피드백좀부탁드립니다.</p>',0,0,sysdate);
insert into hb_station values(hb_stationseq.nextval,'aaa@email.com',5,'Jueun','첫눈에 가사써봤어요. 라임좀 봐주세요..','<p>안녕하세요 Jueun 입니다.</p>부탁드려요 형들 ㅠㅠ<p>어렵네요ㅠㅠ</p>
<p>(verse1
<p>많은 사람들이 질문을 던지네</p>
<p>난 정해져있는 답을 또 던지네</p>
<p>또 묻네 너 너 뭘 자꾸 던져대?</p>
<p>내가 던지는건 변화구</p>
<p>쭉잘 가다 떨어지네</p>
<p>어찌보면 우린 로봇이 아닐까</p>
<p>입력해 놓은 대로 실행되는 system</p>
<p>난 절대</p>
<p>되기 싫어서 나의 몸을 지탱</p>
<p>목에 곤두서는 핏대</p>
<p>이젠 난 나의 열분을 토해내</p>
<p>이젠 귀찮아 대답도</p>
<p>같은말만 하잖아 또 또 또</p>
<p>이건 시팔 뭐 정해졌지 또 또</p>
<p>난 걍 아빠따라 갈꺼야 복권</p>
<p>사러 가서 내가 직접 긁지 lotto</p>
<p>아빠와 난 계속 빌어 당첨되게 해달라고</p>
<p>절대 안되지 당첨 되어봐야 기본이 1000원</p>
<p>저건 판매장에 상술</p>
<p>넘어가선 안돼 그 상술</p>
<p>이렇게 말하면 그 회사는 나의 싹수</p>
<p>가 별로라네 난 그런거 상관 안하거든</p>
<p>좀 좃같지?</p>
<p>그럼 계속 그리 살어</p>
<p>좃같은건 어떻게 해서든 좃같아</p>
<p>(hook)</p>
<p>난 항상 또 또 또</p>
<p>움직이지 혓바닥 도</p>
<p>도 를 닦는 행 동</p>
<p>이젠 질려버려 도</p>
<p>계속 해야해 난 모 아님 도</p>
<p>난 그냥 로 로 로</p>
<p>나의 방식대 로</p>
<p>내가 갈길은 대 로</p>
<p>계속 앞만봐야해 길을 가 로</p>
<p>질러 가로 아님 세로</p>
<p>(verse2</p>
<p>내 스타일에 이래라 저래라</p>
<p>옆에서 말로만 떠드는 새끼</p>
<p>정작 지 할줄 모르면서 입만 놀리는 새끼</p>
<p>나도 원래 아가리 파이터</p>
<p>친구옆에서 존나 털었지</p>
<p>근데 이젠 친구들덕에</p>
<p>난 자신감 충전하고 오르막길 앞에</p>
<p>서있으면서 고민해</p>
<p>여길 가야하나 말야돼나</p>
<p>몰라 fuck or shit</p>
<p>내가 가는길은 직진</p>
<p>절대 하지 않지 후진</p>
<p>난 발견했네 나의 새로운 땅</p>
<p>마치 콜럼버스가 대륙을 발견했다</p>
<p>이것처럼 나도 역사에 기리남겠다</p>
<p>싶어서 이젠 관종짓좀 한다</p>
<p>어떤애가 이래</p>
<p>관종짓 하다 인생 쫑 난다고</p>
<p>Fuck you</p>
<p>내 인생 내가 산다</p>
<p>씹새들아</p>
<p>니 들이 뭐라건</p>
<p>난 안들린다 ye a</p>
<p>(hook)</p>
<p>난 항상 또 또 또</p>
<p>움직이지 혓바닥 도</p>
<p>도 를 닦는 행 동</p>
<p>이젠 질려버려 도</p>
<p>계속 해야해 난 모 아님 도</p>
<p>난 그냥 로 로 로</p>
<p>나의 방식대 로</p>
<p>내가 갈길은 대 로</p>
<p>계속 앞만봐야해 길을 가 로</p>
<p>질러 가로 아님 세로</p>
<p>(싸비</p>
<p>그럼 난 정해졌네</p> 
<p>이젠 뭐할지</p>
<p>제대로 된 길인지 모르겠지만</p>
<p>몰라 남잔 한방을 노려야지</p>
<p>그리곤 날 기억해야지</p>
Chi ca no</p>',0,0,sysdate);
insert into hb_station values(hb_stationseq.nextval,'aaa@email.com',1,'Jueun','키스에이프 비트 수정해봤어요~','<p>안녕하세요 Jueun 입니다.</p>
<iframe allowfullscreen="" frameborder="0" height="360" src="//www.youtube.com/embed/_NL7CWwFUso" width="640"></iframe><p>잘부탁드립니다.</p>',0,0,sysdate);
insert into hb_station values(hb_stationseq.nextval,'aaa@email.com',4,'Jueun','가수가 된 이유(신용재) 불러봤습니다.','<p>안녕하세요 Jueun 입니다.</p>
<iframe allowfullscreen="" frameborder="0" height="360" src="//www.youtube.com/embed/WsjCuh0TZe8" width="640"></iframe><p>잘부탁드립니다.</p>',0,0,sysdate);
insert into hb_station values(hb_stationseq.nextval,'aaa@email.com',1,'Jueun','자작비트입니다 도대체 난...','<p>안녕하세요 Jueun 입니다.</p>
<iframe allowfullscreen="" frameborder="0" height="360" src="//www.youtube.com/embed/9n5UpGXCqcg" width="640"></iframe><p>잘부탁드립니다.</p>',0,0,sysdate);
insert into hb_station values(hb_stationseq.nextval,'aaa@email.com',3,'Jueun','BaddyHomie (luda)','<p>안녕하세요 Jueun 입니다.</p>
<iframe allowfullscreen="" frameborder="0" height="360" src="//www.youtube.com/embed/-w2UWCUBWDM" width="640"></iframe><p>잘부탁드립니다.</p>',0,0,sysdate);
insert into hb_station values(hb_stationseq.nextval,'aaa@email.com',2,'Jueun','첫눈처럼 너에게 가겠다(Rap ver)','<p>안녕하세요 Jueun 입니다.</p>
<iframe allowfullscreen="" frameborder="0" height="360" src="//www.youtube.com/embed/2pZQr7y5VoM" width="640"></iframe><p> 숨이 차네요..</p>',0,0,sysdate);

insert into hb_crew values(HB_crewidseq.nextval,'AOMG','AOMG.png');
insert into hb_driver values(1);
insert into hb_crewmember values('ggg@email.com',1,2);
insert into hb_crewmember values('fff@email.com',1,1);
insert into hb_crewmember values('hhh@email.com',1,1);
insert into hb_crewmember values('iii@email.com',1,1);
insert into hb_crewmember values('jjj@email.com',1,1);


insert into hb_passengers values('ggg@email.com','aaa@email.com');
insert into hb_passengers values('ggg@email.com','bbb@email.com');
insert into hb_passengers values('ggg@email.com','ccc@email.com');
insert into hb_passengers values('eee@email.com','ddd@email.com');
insert into hb_passengers values('eee@email.com','fff@email.com');
insert into hb_passengers values('ccc@email.com','bbb@email.com');

																										
insert into hb_upcoming values(HB_upcomingseq.nextval,'ggg@email.com','Jaehyeong','힙합플레이야 페스티벌 2017','ChIJ77fEAzuffDURLEWNv56G2KQ@대한민국 서울특별시 영등포구 여의동 여의동로 330 여의도한강공원',to_date('04-08-2017 13:00:00','mm-dd-yyyy hh24:mi:ss'),'도끼 더 콰이엇 씨잼 넉살 던밀스 나플라 박재범 비와이 서사무엘 팔로알토 로꼬 허클베리피 식 케이 창모 김효은 해쉬스완',180,50000,'<strong>한국힙합 17년지기 힙합플레이야의 대규모 프로젝트</strong><p><strong>HIPHOPPLAYA FESTIVAL 2017이 오는 4월 서울에서 개최된다.</strong></p>','cons.png',0,sysdate);

insert into hb_upcoming values(HB_upcomingseq.nextval,'iii@email.com','Betrayer','2017 힙합페스티벌-부산','ChIJlZOAoeDsaDUR-BoxSrh69zc@대한민국 부산광역시 수영구 남천동 수영로 429',to_date('04-23-2017 19:00:00','mm-dd-yyyy hh24:mi:ss'),'매드클라운 다이나믹듀오 지코',60,50000,'페스티벌합니다','Busan.png',0,sysdate);

insert into hb_upcoming values(HB_upcomingseq.nextval,'hhh@email.com','Seongyong','인디페스타1 힙합유니온','ChIJLZZXYbHAfDURgMoGuwSdjxI@대한민국 경기도 의정부시 의정부2동 323',to_date('04-07-2017 20:00:00','mm-dd-yyyy hh24:mi:ss'),'매드클라운 베이식 긱스 ',90,40000,'<p>쇼미더머니의 레전드 무대가 재연된다.</p> <p>실력과 인기를 겸비한 힙합 뮤지션들이 선보이는 경연 아닌, 축제의 무대!</p> ','jungbu.png',0,sysdate);

insert into hb_upcoming values(HB_upcomingseq.nextval,'eee@email.com','Jaeduek','Awesome U - brokenday','ChIJ8WuuPUulfDURGV0009pz9TM@대한민국 서울특별시 광진구 광장동 구천면로 20',to_date('04-01-2017 20:00:00','mm-dd-yyyy hh24:mi:ss'),'사이먼 도미닉 그레이 레디 저스디스 킬라그램 정상수 ',90,77000,'지친 당신의 심장을 뛰게 하고 현란한 귀가르즘을 선사합니다.','yes24.png',0,sysdate);

insert into hb_news values('admin@hipbus.com',hb_newsseq.nextval,'Admin1','쇼미더머니6’ 래퍼 공개모집 시작','<p>오늘 Mnet ‘쇼미더머니5’의 우승자 ‘비와이(BewhY)’의 무료 공약 공연과 함께</p><p>2017년 새 시즌 ‘쇼미더머니6’ 지원자 모집이 시작된다.</p><p>Mnet은 지난 2일, 공식 SNS계정을 통해 비와이의 우승 공약 이행 사실을 알렸다.</p><p>비와이의 무료 공연은 오늘 저녁 7시부터 클럽 옥타곤에서 진행된다.</p><p>오늘 깜짝 공연에서는 비와이가 ‘쇼미더머니6’의 새로운 시작을 알리고</p><p>앞으로 도전할 래퍼들을 위해 직접 만든 자작곡도 최초로 공개된다.</p><p>또한, 팬들을 위한 질의응답뿐만 아니라 ‘쇼미더머니’ 비하인드 스토리 와</p><p>예비 지원자들을 위한 꿀팁 공개도 이어질 예정이다.</p>','news.png',0,sysdate);

insert into hb_news values('admin@hipbus.com',hb_newsseq.nextval,'Admin1','칸예 웨스트 기억상실증 겪었다 "현재는 회복"','<p>팝가수 카니예 웨스트가 기억상실 증상을 겪었다고 미국 연예매체 할리우드라이프가 지난 13일(이하 현지시각) 보도했다.</p><p>보도에 따르면 카니예 웨스트는 8일 간 정신 질환으로 병원에 입원해있을 당시, 기억 상실 증상을 보인 것으로 전해졌다.</p><p>지난 12일 열렸던 그래미 어워즈 레드카펫에서 카니예 웨스트의 절친이자 동료 가수인 말릭 유세프의 입을 통해 알려졌다.</p><p>그는 레드카펫에서 “웨스트가 입원해 있는 동안 6~7시간 정도 함께 시간을 보내곤 했다”며 “기억 상실 증세를 보였지만</p><p>지금은 회복한 상태”라고 밝혔다.</p><p>이어 “현재는 주로 가족들과 함께 시간을 보내고 있는 것으로 안다”면서</p><p>"아이가 많이 커서 스스로 걸어다니고 장난감을 가지고 놀곤 한다. 그런 아이를 보는 게 웨스트의 가장 큰 힘”이라고 말했다.</p>','news1.png',0,sysdate);

insert into hb_channel values('fff@email.com','UCSXqBJql66rcAiplPEBlKGw');
insert into hb_channel values('ggg@email.com','UCKDN9ey_tPWGPWPBIwGYVCw');
insert into hb_channel values('hhh@email.com','UCUuZODYHQ2KvoBNiwq_Ey1g');
insert into hb_channel values('iii@email.com','UC4OYayWn1eR2QpUB5DtLNPg');
insert into hb_channel values('jjj@email.com','UCA7DC5I9ZqF7dXsdT4G1COg');

update hb_station set likenum=4 where num=9;
update hb_station set likenum=4 where num=2;

insert into hb_stationreply values(hb_replyseq.nextval,9,'bbb@email.com','노래가 참 뭐같네...',1,0,0,sysdate,1);

insert into hb_upcoming values(HB_upcomingseq.nextval,'eee@email.com','JaeDeuk','모아마트 개업ㅎㅎ','ChIJIZZrr6hCezURrS6f2hEQ6Pk@대한민국 경기도 수원시 권선구 입북동 261-2',to_date('04-30-2017 20:00:00','mm-dd-yyyy hh24:mi:ss'),'유재득 ',30,1000,'모아마트가 개업했습니다 많이놀러와라','mart.png',0,sysdate);

insert into hb_station values(hb_stationseq.nextval,'ddd@email.com',2,'Victory','사이트가 이상하네 ㅡㅡ','<p>ㅆ..똑바로 하자</p>',0,0,sysdate);

insert into hb_crew values(HB_crewidseq.nextval,'Just Music','crew1.png');
insert into hb_driver values(2);
insert into hb_crewmember values('bbb@email.com',2,2);

insert into hb_crew values(HB_crewidseq.nextval,'mkit rain','crew2.png');
insert into hb_driver values(3);
insert into hb_crewmember values('ccc@email.com',3,2);

insert into hb_crew values(HB_crewidseq.nextval,'illionaire','crew3.png');
insert into hb_driver values(4);
insert into hb_crewmember values('ddd@email.com',4,2);

insert into hb_crew values(HB_crewidseq.nextval,'Hi-Lite','crew4.png');
insert into hb_driver values(5);
insert into hb_crewmember values('eee@email.com',5,2);

insert into hb_crew values(HB_crewidseq.nextval,'Cohort','crew5.png');
insert into hb_driver values(6);
insert into hb_crewmember values('fff@email.com',6,2);



insert into hb_wanted values('2',hb_wantedseq.nextval,'Gahyeon','Just Music.','개성있는 크루원모집합니다.','crew1.png',to_date('04-08-2017','mm-dd-yyyy'),0,sysdate);
insert into hb_wanted values('3',hb_wantedseq.nextval,'Jihyeon','메킷레인에서 크루원구합니다.','실력있는 크루원 상시모집중.','crew2.png',to_date('04-11-2017','mm-dd-yyyy'),0,sysdate);
insert into hb_wanted values('4',hb_wantedseq.nextval,'Victory','일리네어레코즈','빈지노를 대신할','crew3.png',to_date('04-09-2017','mm-dd-yyyy'),0,sysdate);
insert into hb_wanted values('5',hb_wantedseq.nextval,'JaeDeuk','Hi-Lite','하이퀄리티 크루원모집합니다.','crew4.png',to_date('04-07-2017','mm-dd-yyyy'),0,sysdate);
insert into hb_wanted values('6',hb_wantedseq.nextval,'Jihun','코홀트 크루모집.','성실한 크루원모집합니다.','crew5.png',to_date('04-10-2017','mm-dd-yyyy'),0,sysdate);

