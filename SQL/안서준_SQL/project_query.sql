--��� �°� �� ��ȸ�ϴ� select �� 
select ticket.flight_num as ž����, passenger.name as �°���, dated as ��߽ð�, gate as "ž�� ����Ʈ",
seat as �¼���ȣ, depart_nation.name as ����� ,arrive_nation.name as ������
from ticket
join passenger on ticket.name=passenger.passport
join depart_nation on ticket.depart_nation=depart_nation.code
join arrive_nation on ticket.arrive_nation=arrive_nation.code;

--Ư�� ����⸸ Ÿ�� �°��� ��ȸ�ϴ� select �� 
select ticket.flight_num as ž����, passenger.name as �°���, ticket.dated as ž�½ð�, gate as "ž�� ����Ʈ",
seat as �¼���ȣ, depart_nation.name as ����� ,arrive_nation.name as ������
from ticket
join passenger on ticket.name=passenger.passport
join depart_nation on ticket.depart_nation=depart_nation.code
join arrive_nation on ticket.arrive_nation=arrive_nation.code
where ticket.flight_num='7C-001';

-- drop view ticket_all;
-- view�� ticket_all ����
select ticket.ticket_num as ž����, flight_num �װ���ȣ, passenger.name as �°���, passenger.birth ����, 
passenger.passport ���ǹ�ȣ, ticket.dated as ž�½ð�, gate as "ž�� ����Ʈ", seat as �¼���ȣ, depart_nation.name as ����� ,arrive_nation.name as ������
from ticket
join passenger on ticket.name=passenger.passport
join depart_nation on ticket.depart_nation=depart_nation.code
join arrive_nation on ticket.arrive_nation=arrive_nation.code;

select * from ticket_all;
--
select passenger.name, ����, �װ���ȣ
from ticket_all join passenger on ticket_all.���ǹ�ȣ = passenger.passport;
--
-- drop view max_age;
create view max_age as 
select passenger.name, ����, �װ���ȣ
from ticket_all join passenger on ticket_all.���ǹ�ȣ = passenger.passport;

-- drop view max_age;
create view max_age as
select passenger.name, ����, �װ���ȣ
from ticket_all join passenger on ticket_all.���ǹ�ȣ = passenger.passport;

select name, max_age.����,max_age.�װ���ȣ
from max_age;

-- ���� ���� ���� ����� �װ���ȣ, �̸�
select �װ���ȣ, ����, name
from max_age
where ���� = (select max(����) from max_Age);
--

-- 20 ~ 40���� �װ���ȣ �̸� ����
select �װ���ȣ, name, max_age.����
from max_age
group by �װ���ȣ, name, ����
having max_age.���� >= 20 and ���� <=30
order by �װ���ȣ;
--


select ticket.name passname, passenger.birth age, flight.flight_num flightname
from ticket
join passenger on ticket.name=passenger.passport
join flight on ticket.flight_num=flight.flight_num;










