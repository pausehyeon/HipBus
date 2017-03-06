/* 관리자*/
insert into hb_member values('admin@hipbus.com', '관리자1', 'a1a1a1', 1, sysdate, '');
insert into hb_verification values('admin@hipbus.com', -1);

/* 1등급 회원 */
insert into hb_member values('aaa@email.com', 'AAA', 'a1a1a1', 1, sysdate, '');
insert into hb_member values('bbb@email.com', 'BBB', 'a1a1a1', 1, sysdate, '');
insert into hb_member values('ccc@email.com', 'CCC', 'a1a1a1', 1, sysdate, '');
insert into hb_member values('ddd@email.com', 'DDD', 'a1a1a1', 1, sysdate, '');
insert into hb_member values('eee@email.com', 'EEE', 'a1a1a1', 1, sysdate, '');

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
insert into hb_member values('fff@email.com', 'FFF', 'a1a1a1', 2, sysdate, '');
insert into hb_member values('ggg@email.com', 'GGG', 'a1a1a1', 2, sysdate, '');
insert into hb_member values('hhh@email.com', 'HHH', 'a1a1a1', 2, sysdate, '');
insert into hb_member values('iii@email.com', 'III', 'a1a1a1', 2, sysdate, '');
insert into hb_member values('jjj@email.com', 'JJJ', 'a1a1a1', 2, sysdate, '');

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
