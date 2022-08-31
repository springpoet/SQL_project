create table flight(
flight_num varchar2(30) primary key,
passport varchar2(30),
date date,
gate varchar2(30),
departure_time number,
arrived_time number,
departure varchar2(30),
arrived varchar2(30),
airport varchar2(30),
constraint fk_passport foreign key(passport) references passenger(passport),
constraint fk_departure foreign key(departure) references nation(code),
constraint fk_arrived foreign key(arrived) references nation(code),
constraint fk_airport foreign key(passport) references airport(code));

create table passenger(
passport varchar2(30) primary key,
name varchar2(30),
birth number,
phone varchar2(30),
email varchar2(30),
flight_num varchar2(30),
constraint fk_flightnum foreign key(flight_num) references flight(flight_num));

create table nation(
code varchar2(30) primary key,
name varchar2(30));

create table airport(
code varchar2(30) primary key,
name varchar2(30))
