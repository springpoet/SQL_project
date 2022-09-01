--drop table flight;
create table flight(
flight_num varchar2(30) primary key,
passport varchar2(30),
dated date,
gate varchar2(30),
seat varchar2(30),
departure_time number,
arrived_time number,
departure varchar2(30),
arrived varchar2(30),
airport varchar2(30));

--drop table passenger;
create table passenger(
passport varchar2(30) primary key,
name varchar2(30),
birth number,
phone varchar2(30),
email varchar2(30),
flight_num varchar2(30));

--drop table nation;
create table nation(
code varchar2(30) primary key,
name varchar2(30));

--drop table airport;
create table airport(
code varchar2(30) primary key,
name varchar2(30));

alter table flight add constraint fk_passport foreign key(passport) references passenger(passport);
alter table flight add constraint fk_departure foreign key(departure) references nation(code);
alter table flight add constraint fk_arrived foreign key(arrived) references nation(code);
alter table flight add constraint fk_airport foreign key(airport) references airport(code);


