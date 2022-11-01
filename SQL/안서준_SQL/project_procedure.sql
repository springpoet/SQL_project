--create

--drop procedure add_ticket;
create or replace procedure add_arrived
(
code varchar2,
name varchar2
)
is begin
insert into arrive_nation values(code, name);
end add_arrived;

/
--delete
create or replace procedure delete_ticket
( tnum in varchar2 )
is begin 
delete from ticket where ticket_num = tnum;
end delete_ticket;

/
--update
create or replace procedure update_ticket_seat
(
tnum in varchar2,
changeseat in varchar2
)
is begin
update ticket set seat = changeseat
where ticket_num = tnum;
end update_ticket_seat;