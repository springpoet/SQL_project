--depart_nation 추가
insert into depart_nation values('KR/ICH', '대한민국/인천');
insert into depart_nation values('KR/CJU', '대한민국/제주');
insert into depart_nation values('JP/HND', '일본/하네다');
insert into depart_nation values('JP/NRT', '일본/나리타');
insert into depart_nation values('US/JFK', '미국/뉴욕');
insert into depart_nation values('US/LAX', '미국/LA');
insert into depart_nation values('GB/LHR', '영국/런던');
insert into depart_nation values('TW/TPE', '대만/타오위안');
insert into depart_nation values('IT/FCO', '이탈리아/로마');
insert into depart_nation values('DE/HHH', '독일/프랑크푸르트');
insert into depart_nation values('CH/ZRH', '스위스/취리히');

--arrive_nation 추가
insert into arrive_nation values('KR/ICH', '대한민국/인천');
insert into arrive_nation values('KR/CJU', '대한민국/제주');
insert into arrive_nation values('JP/HND', '일본/하네다');
insert into arrive_nation values('JP/NRT', '일본/나리타');
insert into arrive_nation values('US/JFK', '미국/뉴욕');
insert into arrive_nation values('US/LAX', '미국/LA');
insert into arrive_nation values('GB/LHR', '영국/런던');
insert into arrive_nation values('TW/TPE', '대만/타오위안');
insert into arrive_nation values('IT/FCO', '이탈리아/로마');
insert into arrive_nation values('DE/HHH', '독일/프랑크푸르트');
insert into arrive_nation values('CH/ZRH', '스위스/취리히');

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

--flight 추가
insert into flight values('KAL-001','2022-09-10',27,1445,'KR/ICU','JP/HND');
insert into flight values('KAL-002','2022-09-25',41,2225,'KR/CJU','TW/TPE');
--ticket 추가
insert into ticket values('ticket-001','KAL-001','SJ960',27,'51D',1415,'KR/ICH','JP/HND');
insert into ticket values('ticket-002','KAL-001','SJ777',27,'51C',1415,'KR/CJU','JP/NRT');
insert into ticket values('ticket-003','KAL-002','SH987',41,'15A',2225,'KR/ICH','TW/TPE');

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
where ticket.arrive_nation='TW';
