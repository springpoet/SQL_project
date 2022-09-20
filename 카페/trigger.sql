--트리거 예시
create or replace trigger insert_order
after insert on cafe_order 
for each row
begin
update inventory set stock = stock + :new.price
where inven_id = 4; 
end;