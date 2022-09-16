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
