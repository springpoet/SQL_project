--create
create or replace procedure add_ticket
(
t_num in varchar2,
f_num in varchar2,
name in varchar2,
gate in number,
seat in varchar2,
dated date,
depart_nation varchar2,
arrive_nation varchar2
)
is begin
insert into ticket values(t_num, f_num, name, gate, seat, dated, depart_nation, arrive_nation);
end add_ticket;

--delete
create or replace procedure delete_ticket
( tnum in varchar2 )
is begin 
delete from ticket where ticket_num = tnum;
end delete_ticket;

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

