/* ������*/
insert into hb_member values('admin@hipbus.com', 'Admin1', 'a1a1a1', 3, sysdate, 'AdminLogo.png');
insert into hb_verification values('admin@hipbus.com', -1);

/* 1���ȸ�� */
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

/* 2���ȸ��*/
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

/* ���� */
insert into hb_ad values(1, '', 'ad1.png');
insert into hb_ad values(2, '', 'ad2.png');
insert into hb_ad values(3, '', 'ad3.png');

/* Station�۾���*/
insert into hb_station values(hb_stationseq.nextval,'aaa@email.com',6,'Jueun Jeong','�ߺ�Ź�帳�ϴ�.','<p>�ȳ��ϼ��� ������ .</p>Ȱ���������ϰڽ��ϴ�.
',0,0,sysdate);
insert into hb_station values(hb_stationseq.nextval,'aaa@email.com',1,'Jueun Jeong','(â�� �������� �ǾƳ� ��Ʈ) Piano Scribble','<p>�ȳ��ϼ��� Jueun �Դϴ�.</p>
<p>Youtube :</p><iframe allowfullscreen="" frameborder="0" height="360" src="//www.youtube.com/embed/hRngH4aDBgU" width="640"></iframe><p>�ߺ�Ź�帳�ϴ�.</p>',0,0,sysdate);
insert into hb_station values(hb_stationseq.nextval,'aaa@email.com',1,'Jueun Jeong','���ۺ�Ʈ�Դϴ�.�ǵ���Ź�帳�ϴ�.','<p>�ȳ��ϼ��� Jueun �Դϴ�.</p>
<p>Youtube :</p><iframe allowfullscreen="" frameborder="0" height="360" src="//www.youtube.com/embed/fkmkGcvFEVA" width="640"></iframe><p>�ǵ������Ź�帳�ϴ�.</p>',0,0,sysdate);
insert into hb_station values(hb_stationseq.nextval,'aaa@email.com',5,'Jueun Jeong','������ ���ּ���..','<p>�ȳ��ϼ��� Jueun �Դϴ�.</p>��Ź����� ���� �Ф�<p>��Ƴ׿�Ф�</p>
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
insert into hb_station values(hb_stationseq.nextval,'aaa@email.com',1,'Jueun Jeong','Ű�������� ��Ʈ �����غþ��~','<p>�ȳ��ϼ��� Jueun �Դϴ�.</p>
<iframe allowfullscreen="" frameborder="0" height="360" src="//www.youtube.com/embed/_NL7CWwFUso" width="640"></iframe><p>�ߺ�Ź�帳�ϴ�.</p>',0,0,sysdate);
insert into hb_station values(hb_stationseq.nextval,'aaa@email.com',4,'Jueun Jeong','������ �� ����(�ſ���) �ҷ��ý��ϴ�.','<p>�ȳ��ϼ��� Jueun �Դϴ�.</p>
<iframe allowfullscreen="" frameborder="0" height="360" src="//www.youtube.com/embed/WsjCuh0TZe8" width="640"></iframe><p>�ߺ�Ź�帳�ϴ�.</p>',0,0,sysdate);
insert into hb_station values(hb_stationseq.nextval,'aaa@email.com',1,'Jueun Jeong','����ü ��...','<p>�ȳ��ϼ��� Jueun �Դϴ�.</p>
<iframe allowfullscreen="" frameborder="0" height="360" src="//www.youtube.com/embed/9n5UpGXCqcg" width="640"></iframe><p>�ߺ�Ź�帳�ϴ�.</p>',0,0,sysdate);
insert into hb_station values(hb_stationseq.nextval,'aaa@email.com',3,'Jueun Jeong','BaddyHomie (luda)','<p>�ȳ��ϼ��� Jueun �Դϴ�.</p>
<iframe allowfullscreen="" frameborder="0" height="360" src="//www.youtube.com/embed/-w2UWCUBWDM" width="640"></iframe><p>�ߺ�Ź�帳�ϴ�.</p>',0,0,sysdate);
insert into hb_station values(hb_stationseq.nextval,'aaa@email.com',2,'Jueun Jeong','ù��ó�� �ʿ��� ���ڴ�(Rap ver)','<p>�ȳ��ϼ��� Jueun �Դϴ�.</p>
<iframe allowfullscreen="" frameborder="0" height="360" src="//www.youtube.com/embed/2pZQr7y5VoM" width="640"></iframe><p> ���� ���׿�..</p>',0,0,sysdate);

insert into hb_crew values(HB_crewidseq.nextval,'AOMG','AOMG.png');
insert into hb_driver values(1);
insert into hb_crewmember values('ggg@email.com',1,2);
insert into hb_crewmember values('fff@email.com',1,1);
insert into hb_crewmember values('hhh@email.com',1,1);
insert into hb_crewmember values('iii@email.com',1,1);
insert into hb_crewmember values('jjj@email.com',1,1);