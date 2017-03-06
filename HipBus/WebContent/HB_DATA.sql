/* 관리자*/
insert into hb_member values('admin@hipbus.com', 'Admin1', 'a1a1a1', 3, sysdate, 'AdminLogo.png');
insert into hb_verification values('admin@hipbus.com', -1);

/* 1등급 회원 */
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

/* 2등급 회원*/
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
