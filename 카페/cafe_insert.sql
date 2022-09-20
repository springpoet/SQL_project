insert into category values('001','빵');

insert into menu values('0001','떡케이크',5000,'001');

insert into customer(cus_id,cus_name,phone) values('springpoet','김성근','010-5242-4439');

insert into supply values('abc001','001','랄로',11,8000);

insert into inventory values('1','커피',100);

insert into cafe_order values('00001','springpoet','0001',1,5000,'2022-09-26');

select * from cafe_order;
select order_id as 주문번호, customer.cus_name as 고객명, menu.menu_name as 메뉴명, amount as 수량, price as 가격, dated as 날짜
from cafe_order
join customer on cafe_order.customer_id=customer.cus_id
join menu on cafe_order.menu_id=menu.menu_id;


--추가해봅니다 랄뚜기1
--category
update category set cate_name = '케이크' where cate_id = 001;
insert into category values('002','커피');
insert into category values('003','티백');

--menu
insert into menu values('0002','아이스박스',5700,'001');
insert into menu values('0003','당근케이크',4500,'001');
insert into menu values('0004','티라미수 케이크',5500,'001');

insert into menu values('0005','에스프레소',3500,'002');
insert into menu values('0006','아메리카노',4500,'002');
insert into menu values('0007','카페라떼',4800,'002');
insert into menu values('0008','연유라떼',5500,'002');
insert into menu values('0009','카라멜 마키아또',5600,'002');
insert into menu values('0010','아인슈페너',5600,'002');

insert into menu values('0011','카모마일',5100,'003');
insert into menu values('0012','크림카라멜',5100,'003');
insert into menu values('0013','얼그레이',5100,'003');
insert into menu values('0014','민트티',5100,'003');
insert into menu values('0015','허니레몬티',5100,'003');

--customer
insert into customer(cus_id,cus_name,phone) values('09-714j','장태연','010-4945-7236');
insert into customer(cus_id,cus_name,phone) values('sangpa','채상혁','010-2233-7441');
insert into customer(cus_id,cus_name,phone) values('ttcas','김수희','010-7112-2117');
insert into customer(cus_id,cus_name,phone) values('mulso','곽지원','010-1144-7744');

--inventory
insert into inventory values('2','케이크',30);
insert into inventory values('3','티백',80);

--cafe_order
insert into cafe_order values('00002','09-714j','0005',5,17500,'2022-09-26');
insert into cafe_order values('00003','mulso','0011',1,5100,'2022-09-20');
insert into cafe_order values('00004','ttcas','0010',2,11200,'2022-09-20');
insert into cafe_order values('00005','sangpa','0006',2,9000,'2022-09-21');
