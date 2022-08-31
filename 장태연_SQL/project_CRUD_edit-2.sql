--depart_nation 추가
insert into depart_nation values('KR', '대한민국');
insert into depart_nation values('JP', '일본');
insert into depart_nation values('US', '미국');
insert into depart_nation values('GB', '영국');
insert into depart_nation values('TW', '대만');
insert into depart_nation values('IT', '이탈리아');
insert into depart_nation values('DE', '독일');
insert into depart_nation values('CH', '스위스');

--arrive_nation 추가
insert into arrive_nation values('KR', '대한민국');
insert into arrive_nation values('JP', '일본');
insert into arrive_nation values('US', '미국');
insert into arrive_nation values('GB', '영국');
insert into arrive_nation values('TW', '대만');
insert into arrive_nation values('IT', '이탈리아');
insert into arrive_nation values('DE', '독일');
insert into arrive_nation values('CH', '스위스');

--airport 추가
insert into airport values('ICN', '인천국제공항');
insert into airport values('CJU', '제주국제공항');
insert into airport values('HND', '하네다국제공항');--일본 도쿄
insert into airport values('NRT', '나리타국제공항');--일본 도쿄
insert into airport values('JFK', '케네디국제공항');--미국 뉴욕
insert into airport values('LAX', '로스엔젤레스공항');--미국 LA
insert into airport values('LHR', '히드로국제공항');--영국 런던
insert into airport values('TPE', '타오위안국제공항');--대만 타오위안
insert into airport values('FCO', '피우미치노국제공항');--이탈리아 로마
insert into airport values('HHH', '프랑크푸르트국제공항');--독일 프랑크푸르트
insert into airport values('ZRH', '취리히국제공항');--스위스 취리히

--passenger 추가
insert into passenger values('SJ960','안서준',960522,'010-9465-7709');
insert into passenger values('SJ777','이정석',951227,'010-1115-9999');
insert into passenger values('SH987','이승호',960522,'010-5156-9977');
insert into passenger values('MW305','김민우',960301,'010-1234-7895');
insert into passenger values('HM458','최효민',901005,'010-3214-9876');
insert into passenger values('JH667','배재현',890427,'010-4567-6543');
insert into passenger values('HW123','한현후',990516,'010-6543-7418');
insert into passenger values('MJ872','김민준',971027,'010-9009-8888');
insert into passenger values('TY446','장태연',951120,'010-4945-7236');
insert into passenger values('SZ996','송지원',960914,'010-2233-4411');
insert into passenger values('YY411','윤예일',910430,'010-7755-3369');
insert into passenger values('CH119','채상혁',971113,'010-5471-6664');
insert into passenger values('JY454','정용운',950909,'010-4521-1614');
insert into passenger values('GA777','곽지원',950904,'010-4451-6771');
insert into passenger values('MW123','최유석',950211,'010-4778-8774');
insert into passenger values('JH852','문지호',900101,'010-7891-1234');
insert into passenger values('PK557','박재성',890522,'010-5068-4741');
insert into passenger values('SY004','송용수',951115,'010-7412-6678');
insert into passenger values('KI112','김계영',951118,'010-3214-3369');
insert into passenger values('KL447','김경엽',951115,'010-7412-6678');

--flight 추가
insert into flight values('KAL-001','2022-09-10',27,1445,'KR','JP','HND');
insert into flight values('KAL-002','2022-09-25',41,2225,'KR','TW','TPE');
--ticket 추가
insert into ticket values('ticket-001','KAL-001','SJ960',27,'51D',1415,'KR','JP');
insert into ticket values('ticket-002','KAL-001','SJ777',27,'51C',1415,'KR','JP');
insert into ticket values('ticket-003','KAL-002','SH987',41,'15A',2225,'KR','TW');

--모든 승객 다 조회하는 select 문 
select ticket.flight_num as 탑승편, passenger.name as 승객명, ticket.boarding as 탑승시간, gate as "탑승 게이트", seat as 좌석번호, depart_nation.name as 출발지 ,arrive_nation.name as 목적지
from ticket
join passenger on ticket.name=passenger.passport
join depart_nation on ticket.depart_nation=depart_nation.code
join arrive_nation on ticket.arrive_nation=arrive_nation.code;

--같은 비행기만 타는 승객들 조회하는 select 문 
select ticket.flight_num as 탑승편, passenger.name as 승객명, ticket.boarding as 탑승시간, gate as "탑승 게이트", seat as 좌석번호, depart_nation.name as 출발지 ,arrive_nation.name as 목적지
from ticket
join passenger on ticket.name=passenger.passport
join depart_nation on ticket.depart_nation=depart_nation.code
join arrive_nation on ticket.arrive_nation=arrive_nation.code
where ticket.flight_num='KAL-001';
