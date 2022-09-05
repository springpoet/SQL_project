--function (ex)
create or replace function test_date (date DATE)
return varchar2
is
    change_date varchar2(30);
begin
    change_date := NULL;
    change_date := TO_CHAR(date, 'YYYY-MM-DD HH24:MI');
    return change_date||' �Դϵ�';
end;

/
select test_date(sysdate) from dual;
/
--
commit;
--

--Won -> dollar �� ���
create or replace function dollar (won number)
return varchar2
is 
cul_dollar number(10);
begin select flight.price  into cul_dollar from
flight where price = won;
return round(won/1330)||'$ �Դϴ�';
end;

/
select dollar(2100000) as ȯ���� from dual;

--
/
CREATE OR REPLACE FUNCTION ticket_info (ticketinfo in VARCHAR2 ) 
RETURN VARCHAR2
IS v_nm varchar2(20);
BEGIN 
    select passenger.name into v_nm
    from ticket
    join passenger on ticket.name = passenger.passport
    where ticketinfo=ticket.ticket_num;
return ticketinfo||'�� �°����� '||v_nm||' �Դϴ�.';
end ticket_info;
    
/
select ticket_info('ticket-030') as �°����� from dual;