create table cafe_order(
 order_id varchar2(255) primary key,
 customer_id varchar2(255) not null,
 menu_id varchar2(255) not null,
 amount number not null,
 price number,
 dated date not null);

--price : 만약에 인서트가 되면 메뉴.가격 x 수량 값을 order.price에 넣는다.

create table menu(
menu_id varchar2(255) primary key,
menu_name varchar2(255) not null unique,
menu_price number not null,
category varchar2(255) not null);

create table customer(
cus_id varchar2(255) primary key,
cus_name varchar2(255) not null,
phone varchar2(25),
visit number null);

--visit : 함수로 오더.고객번호를 cnt 한 값을 null에서 숫자로 update

create table category(
cate_id varchar2(255) primary key,
cate_name varchar2(255) not null);

create table supply(
sup_id varchar2(255) primary key,
category varchar2(255) not null,
sup_name varchar2(255) not null,
sup_amount varchar2(255) not null,
sup_price number not null);

alter table supply modify sup_amount number;

create table inventory(
inven_id varchar2(255) primary key,
inven_name varchar2(255) not null unique,
stock number null);

alter table cafe_order add constraint fk_cust foreign key(customer_id) references customer(cus_id);
alter table cafe_order add constraint fk_menu foreign key(menu_id) references menu(menu_id);

alter table menu add constraint fk_cate foreign key(category) references category(cate_id); 

alter table supply add constraint fk_sup foreign key(category) references category(cate_id);
