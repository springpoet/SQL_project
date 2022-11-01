--모든 승객 다 조회하는 select 문 
select ticket.flight_num as 탑승편, passenger.name as 승객명, dated as 출발시간, gate as "탑승 게이트",
seat as 좌석번호, depart_nation.name as 출발지 ,arrive_nation.name as 목적지
from ticket
join passenger on ticket.name=passenger.passport
join depart_nation on ticket.depart_nation=depart_nation.code
join arrive_nation on ticket.arrive_nation=arrive_nation.code;

--특정 비행기만 타는 승객들 조회하는 select 문 
select ticket.flight_num as 탑승편, passenger.name as 승객명, ticket.dated as 탑승시간, gate as "탑승 게이트",
seat as 좌석번호, depart_nation.name as 출발지 ,arrive_nation.name as 목적지
from ticket
join passenger on ticket.name=passenger.passport
join depart_nation on ticket.depart_nation=depart_nation.code
join arrive_nation on ticket.arrive_nation=arrive_nation.code
where ticket.flight_num='7C-001';

-- drop view ticket_all;
-- view로 ticket_all 보기
select ticket.ticket_num as 탑승편, flight_num 항공번호, passenger.name as 승객명, passenger.birth 나이, 
passenger.passport 여권번호, ticket.dated as 탑승시간, gate as "탑승 게이트", seat as 좌석번호, depart_nation.name as 출발지 ,arrive_nation.name as 목적지
from ticket
join passenger on ticket.name=passenger.passport
join depart_nation on ticket.depart_nation=depart_nation.code
join arrive_nation on ticket.arrive_nation=arrive_nation.code;

select * from ticket_all;
--
select passenger.name, 나이, 항공번호
from ticket_all join passenger on ticket_all.여권번호 = passenger.passport;
--
-- drop view max_age;
create view max_age as 
select passenger.name, 나이, 항공번호
from ticket_all join passenger on ticket_all.여권번호 = passenger.passport;

-- drop view max_age;
create view max_age as
select passenger.name, 나이, 항공번호
from ticket_all join passenger on ticket_all.여권번호 = passenger.passport;

select name, max_age.나이,max_age.항공번호
from max_age;

-- 가장 나이 많은 사람의 항공번호, 이름
select 항공번호, 나이, name
from max_age
where 나이 = (select max(나이) from max_Age);
--

-- 20 ~ 40까지 항공번호 이름 나이
select 항공번호, name, max_age.나이
from max_age
group by 항공번호, name, 나이
having max_age.나이 >= 20 and 나이 <=30
order by 항공번호;
--


select ticket.name passname, passenger.birth age, flight.flight_num flightname
from ticket
join passenger on ticket.name=passenger.passport
join flight on ticket.flight_num=flight.flight_num;










