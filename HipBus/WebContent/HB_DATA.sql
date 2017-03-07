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

/* 광고 이미지 */
insert into hb_ad values(1, '', 'ad1.png');
insert into hb_ad values(2, '', 'ad2.png');
insert into hb_ad values(3, '', 'ad3.png');

/* Station에 aaa@email.com이 작성한 글 9개 - 인코딩 바꿈*/
/*
insert into hb_station values(hb_stationseq.nextval, 'aaa@email.com', 1, 'Jueun Jeong', 'KWANGHO - 색 ( COLOR )', '<p>비트 출처&nbsp;-&nbsp;&nbsp;|&nbsp;https://<strong>soundcloud.com</strong>/&hellip;<br /> 비트 이름 - onetwostep</p> <p><strong>Artwork by</strong> KWANGHO<br /> <strong>Mixed &amp; Mastered by </strong>VINTAGE<br /> <strong>Lyrics by</strong> KWANGHO</p> <p><strong>Lyrics</strong></p> <blockquote> <p>쟤네도 열심히 뛰어가는데 나만 멈춰있음 안 되지 발을 굴려<br /> 쟤네한테 자극은 받아도 쟤넬 따라갈 순 없어 쟤넨 너무 거칠고 무서워<br /> 그게 몇 년을 걸쳐 만들어낸 허구란 건 최근에 알았지만<br /> 난 거짓말은 하기 싫어 적어도 이 신나는 리듬 안에서는 솔직해지자고</p> <p>내가 원하던 것들이 더 가까워졌어&nbsp;<br /> 내 목소린 내가 고른 걸 내 손에 쥐어줘<br /> 망하면 어쩔 거 냐니 다시 덤비면 되지<br /> 넘어지면 옆사람부터&nbsp;<br /> 의심하는 네놈은 멀었어<br /> 난 벌써 다음 일을 생각하는데<br /> 넌 제자리에서 먼지도 안 털고 욕부터하고 앉았지<br /> 그런 태도로 성공은 무슨 개뿔&nbsp;<br /> 성공을 개나소나하냐 난 가사장만 200장이 넘는데도 한참 부족해 아직도<br /> 목적지에 다다랐는데 내가 그린 그림이랑 좀 다르면 난 처음으로 돌아가서 다시 걸어<br /> 나도 원래 흑백 공간에 갇혀서 좁은 문 틈 사이로 밖을 훔쳐보는 게 다였지<br /> 언젠가부터 그 사이로 무지개색 빛이 내게 오라 손짓했을 때 난 움직였네&nbsp;<br /> 그 빛을 따라서 난 믿지 못했네 내가 그들과 같을 수 있다니<br /> 아니 그들을 넘어서 나도 언젠가 모두가 우러러보는 최고가 될 수 있다니<br /> 아니 그럴수가 그런 사람들은 태어날 때부터 그런 줄 알았는데 난<br /> 맞아 그 사람들도 처음부터 그러진 않았어 다 뭔가를 위해 몇 년을 투자하지</p> <p>난 찾은거야 내 자신을<br /> 드디어 나도 내 힘으로 했네 자립을<br /> 더 이상 무언가에 의지하지 않아<br /> 전처럼 무지하지 않아 위에있는 시체들을 무례하게 밟아<br /> 어제의 내 한계보다 무리하지 항상<br /> 괜찮냐는 안부는 우리한테 묻지 말고<br /> 내 노래를 들어봐<br /> 니가 알던 나완 많이 다르겠지<br /> 내 감정이 내던 불협화음은<br /> 이제 자연스러워졌고 난 그걸 발음해대 지금도</p> <p>내 색은 안 섞여 다른 색이랑 부워놔도 한 쪽에 격리되지<br /> 난 달라야해 내 껄 만들기 위해 항상 다하네 최선을</p> <p>내 색은 안 섞여 다른 색이랑 부워놔도 한 쪽에 격리되지<br /> 난 달라야해 내가 좀 특별해졌으면 해 지금보다 더</p> <p>난 절대로 안 물들어 다른 새끼랑 붙여놔도 못할걸 물들이기<br /> 남이랑은 달라질거야 그러는 편이 너하고 나한테 더 재밌을테니까</p> <p>내 색은 안 섞여 다른 색이랑 부워놔도 한 쪽에 격리되지<br /> 이 노랠 듣고 한 번 생각해봤음해 무슨 뜻이 담겨있는 지 니 볼펜에는</p> <p>내 색은 안 섞여 다른 색이랑 부워놔도 한 쪽에 격리되지<br /> 이 노랠 듣고 한 번 생각해봤음해 무슨 뜻이 담겨있는 지 니 펜촉에는<br /> &nbsp;</p> </blockquote> <div class="ckeditor-html5-audio" style="text-align: center;"> <audio controls="controls" src="https://soundcloud.com/lee-kwangho/kwangho-color">&nbsp;</audio> </div>', 0, 0, sysdate);
insert into hb_station values(hb_stationseq.nextval, 'aaa@email.com', 3, 'Jueun Jeong', 'Hyphy - Devil Do not Cry', '<br /> <iframe frameborder="no" height="166" scrolling="no" src="https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/311049870&amp;color=ff5500" width="100%"></iframe><br /> <br /> &nbsp;', 0, 0, sysdate);
insert into hb_station values(hb_stationseq.nextval, 'aaa@email.com', 2, 'Jueun Jeong', '(seo min ju 플로화 Peullohwa)Good', '<div class="ckeditor-html5-audio" style="text-align: center;"> <audio controls="controls" src="https://soundcloud.com/ef8fzzwqxphb/seo-min-ju-peullohwagood">&nbsp;</audio> </div> &nbsp; <blockquote> <p>verse1</p> <p>무슨 말을 해야 할까</p> <p>이런 고민 한게 언제 였을까</p> <p>그래 맞아</p> <p>넌 나에게 너무 과분해</p> <p>&nbsp;</p> <p>지금 당장 널 위해서 라면</p> <p>헤어 지는게 당연해</p> <p>내가 지금 너와 라면을 먹고 싶은게 아냐</p> <p>넌 우대 받아야 당연해</p> <p>&nbsp;</p> <p>조금 만 기달려</p> <p>달려 가고 싶어</p> <p>널 우선순위 에 두지 않아도</p> <p>하지만 네가 곧 떠날걸 알아</p> <p>&nbsp;</p> <p>어색한 대화</p> <p>네가 사랑을 느끼지 못한다고 했어</p> <p>상관 하지 않아</p> <p>네가 웃는 다면 네가 사랑 받고 있는 거야</p> <p>&nbsp;</p> <p>hook</p> <p>지금 웃어봐</p> <p>지금 울어봐</p> <p>나도 똑같아</p> <p>나도 똑같아</p> <p><br /> verse2</p> <p>떠나기 전에</p> <p>마지막 춤을 춰</p> <p>널 좀더 기억 하고 싶어</p> <p>내가 별볼일 없어도</p> <p>&nbsp;</p> <p>너의 기억 속에 흑역사가 되더라도</p> <p>나의 기억 속에 너는 good</p> <p>내 전화를 무시해도 괜찮아</p> <p>내 말을 무시해도 괜찮아</p> <p>&nbsp;</p> <p>하지만</p> <p>너의 미소를 잊지는 마</p> <p>넌 vip 를 받아야 마땅해</p> <p>난 이 모든걸 말하지 않아</p> <p>&nbsp;</p> <p>왜냐면 네 성격을 잘알아</p> <p>부담 주지 않아</p> <p>너도 그렇다는걸 알아</p> <p>그런대 4개월은 길어</p> <p>&nbsp;</p> <p>hook</p> <p>지금 웃어봐</p> <p>지금 울어봐</p> <p>나도 똑같아</p> <p>나도 똑같아</p> <p>&nbsp;</p> <p>verse3</p> <p>어디를 가니?</p> <p>어디에 있니?</p> <p>항상 궁금해 할것 같아</p> <p>핸드폰은 항상 내 옆에</p> <p>&nbsp;</p> <p>혼자 있다고 느끼지마</p> <p>너에게 불만을 느끼는 사람 를 대려와</p> <p>나는 바로 그 사람 에게 불만을 가져</p> <p>난 이느낌이 좋아</p> <p>&nbsp;</p> <p>하지만 네가 내일 나를 떠날걸 알아</p> <p>하지만 네가 불안감을 느낄걸 알아</p> <p>언제나 네 옆에 있어</p> <p>언제나 네 옆에 있어</p> <p>&nbsp;</p> <p>그래도 난 너에게 이렇게 말할거야</p> <p>달려가고 싶어</p> <p>달려가고 싶어</p> <p>하루종일 네생각 네가 혼자 있지 않아&nbsp;</p> <p>&nbsp;</p> <p>&nbsp;</p> <p>hook</p> <p>지금 웃어봐</p> <p>지금 울어봐</p> <p>나도 똑같아</p> <p>나도 똑같아</p> </blockquote>', 0, 0, sysdate);
insert into hb_station values(hb_stationseq.nextval, 'aaa@email.com', 4, 'Jueun Jeong', 'Bugle 179 - Playas gon play', '재밌게 들어주세요<br /> <br /> <iframe frameborder="no" height="166" scrolling="no" src="https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/34019569&amp;color=0066cc" width="100%"></iframe>', 0, 0, sysdate);
insert into hb_station values(hb_stationseq.nextval, 'aaa@email.com', 5, 'Jueun Jeong', '미완성 가사 피드백좀요', '<p><strong>Dream</strong></p> <blockquote> <p>verse1<br /> 고작1년 전쯤만 해도<br /> 내가 보던 세상과 나의<br /> 거리는 너무 멀어<br /> 가까워 지기만을 hold up<br /> 기다리다 보니 시간이<br /> 많이 흘러 서<br /> 이젠 I want to achieve my dream<br /> 자숙 하는 동안에 만든 내 그림<br /> 꿈이란건 그리기만 하지 않아<br /> 아픔을 견디며 노력이 따라<br /> 그아픔이 쓰리기만 하지 않아<br /> 고통마저 달게 느끼는 자가<br /> 이루는 것이 A dream come true<br /> 아는 자는 아는 만큼 모르면 아는 대로<br /> Make your dream come true<br /> verse2<br /> hip hop이 내게 준 고통은<br /> 고통이 아닌 소통<br /> 으로 풀어</p> </blockquote> <p><br /> 출처 : HiphopPlaya&nbsp;Jay-free</p>', 0, 0, sysdate);
insert into hb_station values(hb_stationseq.nextval, 'aaa@email.com', 6, 'Jueun Jeong', '좋아하는 노래', '힙합을 제외하고 좋아하는 뮤지션을 뽑자면&nbsp;<br /> 자우림, 엘리엇스미스가 있습니다.<br /> <br /> <iframe allowfullscreen="" frameborder="0" height="360" src="//www.youtube.com/embed/rrRDs0uapaY" width="640"></iframe><br /> <br /> 자우림은 어렷을때 무슨일이있던 날인진<br /> 기억이 나진 않지만 무척 우울했던 날에<br /> 집에와서 Tv를 켜고 채널돌리고있던중에<br /> 하하하쏭 뮤직비디오가 나오는걸봤는데<br /> 우울한 감정이 싹 사라지더라구요&nbsp;<br /> 그때부터 참 즐겨듣고있어요 ㅎㅎ<br /> <br /> <br /> <iframe allowfullscreen="" frameborder="0" height="360" src="//www.youtube.com/embed/UuizNQUOFCI" width="640"></iframe><br /> <br /> 엘리엇스미스도 예전에 누나가 들려준 노래들 중에&nbsp;<br /> Everything means nothing to me 라는<br /> 노래가 있는데 처음 들었을때 무섭기도하고 충격적이었던 기억이 있는데,<br /> 스테이크용 나이프로 자신의 심장을 찔러 자살했다는<br /> 얘기를 알게되고 한번더 충격을 받았어요<br /> 저는 이 사람의 목소리에 담겨있는 우울한 감성을 좋아합니다<br /> <br /> <br /> (출처 : Hiphoplaya - sini )', 0, 0, sysdate);
insert into hb_station values(hb_stationseq.nextval, 'aaa@email.com', 1, 'Jueun Jeong', '올드스쿨 비트 올립니다', '<iframe frameborder="no" height="166" scrolling="no" src="https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/311044352&amp;color=ff5500" width="100%"></iframe><br /> <br /> 들어주셔서 감사합니다 :)<br /> 앞으로 곡 자주 업로드 할 예정입니다 ㅎㅎ<br /> 제 버스에 다른 곡들도 많아요! 놀러와주세요~', 0, 0, sysdate);
insert into hb_station values(hb_stationseq.nextval, 'aaa@email.com', 1, 'Jueun Jeong', '트랩비트 1개', '<iframe frameborder="no" height="166" scrolling="no" src="https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/310707106&amp;color=ff5500" width="100%"></iframe>', 0, 0, sysdate);
insert into hb_station values(hb_stationseq.nextval, 'aaa@email.com', 5, 'Jueun Jeong', '자작가사 피드백좀요', '<blockquote> <p>verse 1)</p> <p>이젠 자연스레 내가 공책을 펴고 가사를 적어</p> <p>맨날 가사만 적다보니 소통할 친구는 적어</p> <p>그래 친구 라고 해봤자 책상과 펜</p> <p>성공할려거든 친구따위 개나주고</p> <p>그냥 책상만 의지하고 앞으로만가</p> <p>이게내 목표와 성공의 뜻</p> <p>조금 극단적이지만 현실이라</p> <p>그게 진짜 내 모습이라</p> <p>이렇게 진짜 내모습은</p> <p>나한테서 멀어저만가</p> <p>다가가고 싶어도 너무 멀게만 느껴저</p> <p>눈물만 더럽게 흘려서 이젠 더이상</p> <p>울고 싶지 않아</p> <p>&nbsp;</p> <p>자연스레 남들은 날 가엽서라해</p> <p>나도 이런 모습이 싫어</p> <p>떠나 보아도 결국 나인걸</p> <p>나는 나인걸</p> </blockquote> 출처 : Hiphoplaya - Jayfree', 0, 0, sysdate);
*/