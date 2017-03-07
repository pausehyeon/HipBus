/* 관리자*/
insert into hb_member values('admin@hipbus.com', 'Admin1', 'a1a1a1', 3, sysdate, 'AdminLogo.png');
insert into hb_verification values('admin@hipbus.com', -1);

/* 1등급회원 */
insert into hb_member values('aaa@email.com', 'Jueun Jeong', 'a1a1a1', 1, sysdate, 'aaa.png');
insert into hb_member values('bbb@email.com', 'Gahyeon Nam', 'a1a1a1', 1, sysdate, 'bbb.png');
insert into hb_member values('ccc@email.com', 'Jihyeon Jeong', 'a1a1a1', 1, sysdate, 'ccc.png');
insert into hb_member values('ddd@email.com', 'Victory Lee', 'a1a1a1', 1, sysdate, 'ddd.png');
insert into hb_member values('eee@email.com', 'Jaeduek Yoo', 'a1a1a1', 1, sysdate, 'eee.png');

insert into hb_driver values('aaa@email.com');
insert into hb_driver values('bbb@email.com');
insert into hb_driver values('ccc@email.com');
insert into hb_driver values('ddd@email.com');
insert into hb_driver values('eee@email.com');

insert into hb_verification values('aaa@email.com', -1);
insert into hb_verification values('bbb@email.com', -1);
insert into hb_verification values('ccc@email.com', -1);
insert into hb_verification values('ddd@email.com', -1);
insert into hb_verification values('eee@email.com', -1);

/* 2등급회원*/
insert into hb_member values('fff@email.com', 'Jihun Kim', 'a1a1a1', 2, sysdate, 'fff.png');
insert into hb_member values('ggg@email.com', 'Jaehyeon Jo', 'a1a1a1', 2, sysdate, 'ggg.png');
insert into hb_member values('hhh@email.com', 'Seongyong Moon', 'a1a1a1', 2, sysdate, 'hhh.png');
insert into hb_member values('iii@email.com', 'Betrayer Moon', 'a1a1a1', 2, sysdate, 'iii.png');
insert into hb_member values('jjj@email.com', 'Juda Moon', 'a1a1a1', 2, sysdate, 'jjj.png');

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
insert into hb_station values(hb_stationseq.nextval,'aaa@email.com',6,'Jueun Jeong','잘부탁드립니다.','<p>안녕하세요 ㅋㅋㅋ .</p>활동열심히하겠습니다.
',0,0,sysdate);
insert into hb_station values(hb_stationseq.nextval,'aaa@email.com',1,'Jueun Jeong','(창모 느낌나는 피아노 비트) Piano Scribble','<p>안녕하세요 Jueun 입니다.</p>
<p>Youtube :</p><iframe allowfullscreen="" frameborder="0" height="360" src="//www.youtube.com/embed/hRngH4aDBgU" width="640"></iframe><p>잘부탁드립니다.</p>',0,0,sysdate);
insert into hb_station values(hb_stationseq.nextval,'aaa@email.com',1,'Jueun Jeong','자작비트입니다.피드백부탁드립니다.','<p>안녕하세요 Jueun 입니다.</p>
<p>Youtube :</p><iframe allowfullscreen="" frameborder="0" height="360" src="//www.youtube.com/embed/fkmkGcvFEVA" width="640"></iframe><p>피드백좀부탁드립니다.</p>',0,0,sysdate);
insert into hb_station values(hb_stationseq.nextval,'aaa@email.com',5,'Jueun Jeong','라임좀 봐주세요..','<p>안녕하세요 Jueun 입니다.</p>부탁드려요 형들 ㅠㅠ<p>어렵네요ㅠㅠ</p>
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
insert into hb_station values(hb_stationseq.nextval,'aaa@email.com',1,'Jueun Jeong','키스에이프 비트 수정해봤어요~','<p>안녕하세요 Jueun 입니다.</p>
<iframe allowfullscreen="" frameborder="0" height="360" src="//www.youtube.com/embed/_NL7CWwFUso" width="640"></iframe><p>잘부탁드립니다.</p>',0,0,sysdate);
insert into hb_station values(hb_stationseq.nextval,'aaa@email.com',4,'Jueun Jeong','가수가 된 이유(신용재) 불러봤습니다.','<p>안녕하세요 Jueun 입니다.</p>
<iframe allowfullscreen="" frameborder="0" height="360" src="//www.youtube.com/embed/WsjCuh0TZe8" width="640"></iframe><p>잘부탁드립니다.</p>',0,0,sysdate);
insert into hb_station values(hb_stationseq.nextval,'aaa@email.com',1,'Jueun Jeong','도대체 난...','<p>안녕하세요 Jueun 입니다.</p>
<iframe allowfullscreen="" frameborder="0" height="360" src="//www.youtube.com/embed/9n5UpGXCqcg" width="640"></iframe><p>잘부탁드립니다.</p>',0,0,sysdate);
insert into hb_station values(hb_stationseq.nextval,'aaa@email.com',3,'Jueun Jeong','BaddyHomie (luda)','<p>안녕하세요 Jueun 입니다.</p>
<iframe allowfullscreen="" frameborder="0" height="360" src="//www.youtube.com/embed/-w2UWCUBWDM" width="640"></iframe><p>잘부탁드립니다.</p>',0,0,sysdate);
insert into hb_station values(hb_stationseq.nextval,'aaa@email.com',2,'Jueun Jeong','첫눈처럼 너에게 가겠다(Rap ver)','<p>안녕하세요 Jueun 입니다.</p>
<iframe allowfullscreen="" frameborder="0" height="360" src="//www.youtube.com/embed/2pZQr7y5VoM" width="640"></iframe><p> 숨이 차네요..</p>',0,0,sysdate);

insert into hb_crew values(HB_crewidseq.nextval,'AOMG','AOMG.png');
insert into hb_driver values(1);
insert into hb_crewmember values('ggg@email.com',1,2);
insert into hb_crewmember values('fff@email.com',1,1);
insert into hb_crewmember values('hhh@email.com',1,1);
insert into hb_crewmember values('iii@email.com',1,1);
insert into hb_crewmember values('jjj@email.com',1,1);