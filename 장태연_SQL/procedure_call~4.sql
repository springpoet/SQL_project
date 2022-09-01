exec add_ticket(('ticket-'||lpad(ticket_seq.nextval,4, 0)),'KAL-005','aa001',38,'11D','2022-08-01 11:30','KR/ICN','KR/CJU');

exec delete_ticket('ticket-0001');

exec update_ticket_seat('ticket-0002', '99D');