/* ������*/
insert into hb_member values('admin@hipbus.com', 'Admin1', 'a1a1a1', 3, sysdate, 'AdminLogo.png');
insert into hb_verification values('admin@hipbus.com', -1);

/* 1���ȸ�� */
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

/* 2���ȸ��*/
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

/* ���� */
insert into hb_ad values(1, '', 'ad1.png');
insert into hb_ad values(2, '', 'ad2.png');
insert into hb_ad values(3, '', 'ad3.png');

/* Station�۾���*/
insert into hb_station values(hb_stationseq.nextval,'aaa@email.com',6,'Jueun','�ߺ�Ź�帳�ϴ�.','<p>�ȳ��ϼ��� ������ .</p>Ȱ���������ϰڽ��ϴ�.
',0,0,sysdate);
insert into hb_station values(hb_stationseq.nextval,'aaa@email.com',1,'Jueun','(â�� �������� �ǾƳ� ��Ʈ) Piano Scribble','<p>�ȳ��ϼ��� Jueun �Դϴ�.</p>
<p>Youtube :</p><iframe allowfullscreen="" frameborder="0" height="360" src="//www.youtube.com/embed/hRngH4aDBgU" width="640"></iframe><p>�ߺ�Ź�帳�ϴ�.</p>',0,0,sysdate);
insert into hb_station values(hb_stationseq.nextval,'aaa@email.com',1,'Jueun','���ۺ�Ʈ�Դϴ�.�ǵ���Ź�帳�ϴ�.','<p>�ȳ��ϼ��� Jueun �Դϴ�.</p>
<p>Youtube :</p><iframe allowfullscreen="" frameborder="0" height="360" src="//www.youtube.com/embed/fkmkGcvFEVA" width="640"></iframe><p>�ǵ������Ź�帳�ϴ�.</p>',0,0,sysdate);
insert into hb_station values(hb_stationseq.nextval,'aaa@email.com',5,'Jueun','ù���� �����þ��. ������ ���ּ���..','<p>�ȳ��ϼ��� Jueun �Դϴ�.</p>��Ź����� ���� �Ф�<p>��Ƴ׿�Ф�</p>
<p>(verse1
<p>���� ������� ������ ������</p>
<p>�� �������ִ� ���� �� ������</p>
<p>�� ���� �� �� �� �ڲ� ������?</p>
<p>���� �����°� ��ȭ��</p>
<p>���� ���� ��������</p>
<p>����� �츰 �κ��� �ƴұ�</p>
<p>�Է��� ���� ��� ����Ǵ� system</p>
<p>�� ����</p>
<p>�Ǳ� �Ⱦ ���� ���� ����</p>
<p>�� ��μ��� �ʹ�</p>
<p>���� �� ���� ������ ���س�</p>
<p>���� ������ ��䵵</p>
<p>�������� ���ݾ� �� �� ��</p>
<p>�̰� ���� �� �������� �� ��</p>
<p>�� �� �ƺ����� ������ ����</p>
<p>�緯 ���� ���� ���� ���� lotto</p>
<p>�ƺ��� �� ��� ���� ��÷�ǰ� �ش޶��</p>
<p>���� �ȵ��� ��÷ �Ǿ���� �⺻�� 1000��</p>
<p>���� �Ǹ��忡 ���</p>
<p>�Ѿ�� �ȵ� �� ���</p>
<p>�̷��� ���ϸ� �� ȸ��� ���� �ϼ�</p>
<p>�� ���ζ�� �� �׷��� ��� ���ϰŵ�</p>
<p>�� ������?</p>
<p>�׷� ��� �׸� ���</p>
<p>�������� ��� �ؼ��� ������</p>
<p>(hook)</p>
<p>�� �׻� �� �� ��</p>
<p>�������� ���ٴ� ��</p>
<p>�� �� �۴� �� ��</p>
<p>���� �������� ��</p>
<p>��� �ؾ��� �� �� �ƴ� ��</p>
<p>�� �׳� �� �� ��</p>
<p>���� ��Ĵ� ��</p>
<p>���� ������ �� ��</p>
<p>��� �ո������� ���� �� ��</p>
<p>���� ���� �ƴ� ����</p>
<p>(verse2</p>
<p>�� ��Ÿ�Ͽ� �̷��� ������</p>
<p>������ ���θ� ����� ����</p>
<p>���� �� ���� �𸣸鼭 �Ը� ��� ����</p>
<p>���� ���� �ư��� ������</p>
<p>ģ�������� ���� �о���</p>
<p>�ٵ� ���� ģ�������</p>
<p>�� �ڽŰ� �����ϰ� �������� �տ�</p>
<p>�������鼭 �����</p>
<p>���� �����ϳ� ���ߵų�</p>
<p>���� fuck or shit</p>
<p>���� ���±��� ����</p>
<p>���� ���� ���� ����</p>
<p>�� �߰��߳� ���� ���ο� ��</p>
<p>��ġ �ݷ������� ����� �߰��ߴ�</p>
<p>�̰�ó�� ���� ���翡 �⸮���ڴ�</p>
<p>�; ���� �������� �Ѵ�</p>
<p>��ְ� �̷�</p>
<p>������ �ϴ� �λ� �� ���ٰ�</p>
<p>Fuck you</p>
<p>�� �λ� ���� ���</p>
<p>�û����</p>
<p>�� ���� �����</p>
<p>�� �ȵ鸰�� ye a</p>
<p>(hook)</p>
<p>�� �׻� �� �� ��</p>
<p>�������� ���ٴ� ��</p>
<p>�� �� �۴� �� ��</p>
<p>���� �������� ��</p>
<p>��� �ؾ��� �� �� �ƴ� ��</p>
<p>�� �׳� �� �� ��</p>
<p>���� ��Ĵ� ��</p>
<p>���� ������ �� ��</p>
<p>��� �ո������� ���� �� ��</p>
<p>���� ���� �ƴ� ����</p>
<p>(�κ�</p>
<p>�׷� �� ��������</p> 
<p>���� ������</p>
<p>����� �� ������ �𸣰�����</p>
<p>���� ���� �ѹ��� �������</p>
<p>�׸��� �� ����ؾ���</p>
Chi ca no</p>',0,0,sysdate);
insert into hb_station values(hb_stationseq.nextval,'aaa@email.com',1,'Jueun','Ű�������� ��Ʈ �����غþ��~','<p>�ȳ��ϼ��� Jueun �Դϴ�.</p>
<iframe allowfullscreen="" frameborder="0" height="360" src="//www.youtube.com/embed/_NL7CWwFUso" width="640"></iframe><p>�ߺ�Ź�帳�ϴ�.</p>',0,0,sysdate);
insert into hb_station values(hb_stationseq.nextval,'aaa@email.com',4,'Jueun','������ �� ����(�ſ���) �ҷ��ý��ϴ�.','<p>�ȳ��ϼ��� Jueun �Դϴ�.</p>
<iframe allowfullscreen="" frameborder="0" height="360" src="//www.youtube.com/embed/WsjCuh0TZe8" width="640"></iframe><p>�ߺ�Ź�帳�ϴ�.</p>',0,0,sysdate);
insert into hb_station values(hb_stationseq.nextval,'aaa@email.com',1,'Jueun','���ۺ�Ʈ�Դϴ� ����ü ��...','<p>�ȳ��ϼ��� Jueun �Դϴ�.</p>
<iframe allowfullscreen="" frameborder="0" height="360" src="//www.youtube.com/embed/9n5UpGXCqcg" width="640"></iframe><p>�ߺ�Ź�帳�ϴ�.</p>',0,0,sysdate);
insert into hb_station values(hb_stationseq.nextval,'aaa@email.com',3,'Jueun','BaddyHomie (luda)','<p>�ȳ��ϼ��� Jueun �Դϴ�.</p>
<iframe allowfullscreen="" frameborder="0" height="360" src="//www.youtube.com/embed/-w2UWCUBWDM" width="640"></iframe><p>�ߺ�Ź�帳�ϴ�.</p>',0,0,sysdate);
insert into hb_station values(hb_stationseq.nextval,'aaa@email.com',2,'Jueun','ù��ó�� �ʿ��� ���ڴ�(Rap ver)','<p>�ȳ��ϼ��� Jueun �Դϴ�.</p>
<iframe allowfullscreen="" frameborder="0" height="360" src="//www.youtube.com/embed/2pZQr7y5VoM" width="640"></iframe><p> ���� ���׿�..</p>',0,0,sysdate);

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

																										
insert into hb_upcoming values(HB_upcomingseq.nextval,'ggg@email.com','Jaehyeong','�����÷��̾� �佺Ƽ�� 2017','ChIJ77fEAzuffDURLEWNv56G2KQ@���ѹα� ����Ư���� �������� ���ǵ� ���ǵ��� 330 ���ǵ��Ѱ�����',to_date('04-08-2017 13:00:00','mm-dd-yyyy hh24:mi:ss'),'���� �� ���̾� ���� �˻� ���н� ���ö� ����� ����� ���繫�� �ȷξ��� �β� ��Ŭ������ �� ���� â�� ��ȿ�� �ؽ�����',180,50000,'<strong>�ѱ����� 17������ �����÷��̾��� ��Ը� ������Ʈ</strong><p><strong>HIPHOPPLAYA FESTIVAL 2017�� ���� 4�� ���￡�� ���ֵȴ�.</strong></p>','cons.png',0,sysdate);

insert into hb_upcoming values(HB_upcomingseq.nextval,'iii@email.com','Betrayer','2017 �����佺Ƽ��-�λ�','ChIJlZOAoeDsaDUR-BoxSrh69zc@���ѹα� �λ걤���� ������ ��õ�� ������ 429',to_date('04-23-2017 19:00:00','mm-dd-yyyy hh24:mi:ss'),'�ŵ�Ŭ��� ���̳��͵�� ����',60,50000,'�佺Ƽ���մϴ�','Busan.png',0,sysdate);

insert into hb_upcoming values(HB_upcomingseq.nextval,'hhh@email.com','Seongyong','�ε��佺Ÿ1 �������Ͽ�','ChIJLZZXYbHAfDURgMoGuwSdjxI@���ѹα� ��⵵ �����ν� ������2�� 323',to_date('04-07-2017 20:00:00','mm-dd-yyyy hh24:mi:ss'),'�ŵ�Ŭ��� ���̽� �㽺 ',90,40000,'<p>��̴��Ӵ��� ������ ���밡 �翬�ȴ�.</p> <p>�Ƿ°� �α⸦ ����� ���� �����ǵ��� �����̴� �濬 �ƴ�, ������ ����!</p> ','jungbu.png',0,sysdate);

insert into hb_upcoming values(HB_upcomingseq.nextval,'eee@email.com','Jaeduek','Awesome U - brokenday','ChIJ8WuuPUulfDURGV0009pz9TM@���ѹα� ����Ư���� ������ ���嵿 ��õ��� 20',to_date('04-01-2017 20:00:00','mm-dd-yyyy hh24:mi:ss'),'���̸� ���̴� �׷��� ���� ������ ų��׷� ����� ',90,77000,'��ģ ����� ������ �ٰ� �ϰ� ������ �Ͱ������� �����մϴ�.','yes24.png',0,sysdate);

insert into hb_news values('admin@hipbus.com',hb_newsseq.nextval,'Admin1','��̴��Ӵ�6�� ���� �������� ����','<p>���� Mnet ����̴��Ӵ�5���� ����� �������(BewhY)���� ���� ���� ������ �Բ�</p><p>2017�� �� ���� ����̴��Ӵ�6�� ������ ������ ���۵ȴ�.</p><p>Mnet�� ���� 2��, ���� SNS������ ���� ������� ��� ���� ���� ����� �˷ȴ�.</p><p>������� ���� ������ ���� ���� 7�ú��� Ŭ�� ��Ÿ�￡�� ����ȴ�.</p><p>���� ��¦ ���������� ����̰� ����̴��Ӵ�6���� ���ο� ������ �˸���</p><p>������ ������ ���۵��� ���� ���� ���� ���۰ ���ʷ� �����ȴ�.</p><p>����, �ҵ��� ���� ��������Ӹ� �ƴ϶� ����̴��Ӵϡ� �����ε� ���丮 ��</p><p>���� �����ڵ��� ���� ���� ������ �̾��� �����̴�.</p>','news.png',0,sysdate);

insert into hb_news values('admin@hipbus.com',hb_newsseq.nextval,'Admin1','ĭ�� ����Ʈ ������� �޾��� "����� ȸ��"','<p>�˰��� ī�Ͽ� ����Ʈ�� ����� ������ �޾��ٰ� �̱� ������ü �Ҹ����������� ���� 13��(���� �����ð�) �����ߴ�.</p><p>������ ������ ī�Ͽ� ����Ʈ�� 8�� �� ���� ��ȯ���� ������ �Կ������� ���, ��� ��� ������ ���� ������ ��������.</p><p>���� 12�� ���ȴ� �׷��� ����� ����ī�꿡�� ī�Ͽ� ����Ʈ�� ��ģ���� ���� ������ ���� �������� ���� ���� �˷�����.</p><p>�״� ����ī�꿡�� ������Ʈ�� �Կ��� �ִ� ���� 6~7�ð� ���� �Բ� �ð��� ������ �ߴ١��� ����� ��� ������ ��������</p><p>������ ȸ���� ���¡���� ������.</p><p>�̾� ������� �ַ� ������� �Բ� �ð��� ������ �ִ� ������ �ȴ١��鼭</p><p>"���̰� ���� Ŀ�� ������ �ɾ�ٴϰ� �峭���� ������ ��� �Ѵ�. �׷� ���̸� ���� �� ����Ʈ�� ���� ū �����̶�� ���ߴ�.</p>','news1.png',0,sysdate);

insert into hb_channel values('fff@email.com','UCSXqBJql66rcAiplPEBlKGw');
insert into hb_channel values('ggg@email.com','UCKDN9ey_tPWGPWPBIwGYVCw');
insert into hb_channel values('hhh@email.com','UCUuZODYHQ2KvoBNiwq_Ey1g');
insert into hb_channel values('iii@email.com','UC4OYayWn1eR2QpUB5DtLNPg');
insert into hb_channel values('jjj@email.com','UCA7DC5I9ZqF7dXsdT4G1COg');

update hb_station set likenum=4 where num=9;
update hb_station set likenum=4 where num=2;

insert into hb_stationreply values(hb_replyseq.nextval,9,'bbb@email.com','�뷡�� �� ������...',1,0,0,sysdate,1);

insert into hb_upcoming values(HB_upcomingseq.nextval,'eee@email.com','JaeDeuk','��Ƹ�Ʈ ��������','ChIJIZZrr6hCezURrS6f2hEQ6Pk@���ѹα� ��⵵ ������ �Ǽ��� �Ժϵ� 261-2',to_date('04-30-2017 20:00:00','mm-dd-yyyy hh24:mi:ss'),'����� ',30,1000,'��Ƹ�Ʈ�� �����߽��ϴ� ���̳�Ͷ�','mart.png',0,sysdate);

insert into hb_station values(hb_stationseq.nextval,'ddd@email.com',2,'Victory','����Ʈ�� �̻��ϳ� �Ѥ�','<p>��..�ȹٷ� ����</p>',0,0,sysdate);

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



insert into hb_wanted values('2',hb_wantedseq.nextval,'Gahyeon','Just Music.','�����ִ� ũ��������մϴ�.','crew1.png',to_date('04-08-2017','mm-dd-yyyy'),0,sysdate);
insert into hb_wanted values('3',hb_wantedseq.nextval,'Jihyeon','��Ŷ���ο��� ũ������մϴ�.','�Ƿ��ִ� ũ��� ��ø�����.','crew2.png',to_date('04-11-2017','mm-dd-yyyy'),0,sysdate);
insert into hb_wanted values('4',hb_wantedseq.nextval,'Victory','�ϸ��׾����','�����븦 �����','crew3.png',to_date('04-09-2017','mm-dd-yyyy'),0,sysdate);
insert into hb_wanted values('5',hb_wantedseq.nextval,'JaeDeuk','Hi-Lite','��������Ƽ ũ��������մϴ�.','crew4.png',to_date('04-07-2017','mm-dd-yyyy'),0,sysdate);
insert into hb_wanted values('6',hb_wantedseq.nextval,'Jihun','��ȦƮ ũ�����.','������ ũ��������մϴ�.','crew5.png',to_date('04-10-2017','mm-dd-yyyy'),0,sysdate);

