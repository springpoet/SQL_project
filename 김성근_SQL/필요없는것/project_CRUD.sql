--나라, 공항, 승객, 항공편 순으로 insert 입력.
insert into nation values('KR', '대한민국');
insert into nation values('JP', '일본');
insert into nation values('US', '미국');
insert into nation values('GB', '영국');
insert into nation values('TW', '대만');
insert into nation values('IT', '이탈리아');
insert into nation values('DE', '독일');
insert into nation values('CH', '스위스');

--공항 10개
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

--승객 30명
insert into passenger values('SJ960','안서준',960522,'010-9465-7709','orbitahj@naver.com','KAL-001');
insert into passenger values('SJ777','이정석',951227,'010-1115-9999','dlwjdtjr22@naver.com','KAL-001');
insert into passenger values('SH987','이승호',960522,'010-5156-9977','dltmdgh345@naver.com','KAL-001');
insert into passenger values('MW305','김민우',960301,'010-1234-7895','rlaalsdnzid9@gmail.com','KAL-001');
insert into passenger values('HM458','최효민',901005,'010-3214-9876','7chlgyals@naver.com','KAL-001');
insert into passenger values('JH667','배재현',890427,'010-4567-6543','89qowogus@gmail.com','KAL-002');
insert into passenger values('HW123','한현후',990516,'010-6543-7418','9gksgusdn9@naver.com','KAL-002');
insert into passenger values('MJ872','김민준',971027,'010-9009-8888','rkddnjsalswns4@navr.com','KAL-002');

--항공권 5개    
insert into flight values('KAL-001','SJ960','2022-09-10','51','28E',1445,1615,'KR','JP','NRT');

--select flight.flight_num, passenger.name, passenger.passport ,nation.name as 출발지, nation.name as 도착지
--from flight
--join passenger on  passenger.flight_num=flight.flight_num
--join nation on nation.code=flight.departure
--join nation on nation.code=flight.arrived;
--
--select flight.flight_num, passenger.name, passenger.passport ,nation.name as 출발지, nation.name as 도착지
--from flight
--join passenger on  passenger.flight_num=flight.flight_num
--join nation on flight.arrived=nation.code
--join nation on flight.departure=nation.code;







