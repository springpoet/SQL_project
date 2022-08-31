--depart_nation �߰�
insert into depart_nation values('KR/ICH', '���ѹα�/��õ');
insert into depart_nation values('KR/CJU', '���ѹα�/����');
insert into depart_nation values('JP/HND', '�Ϻ�/�ϳ״�');
insert into depart_nation values('JP/NRT', '�Ϻ�/����Ÿ');
insert into depart_nation values('US/JFK', '�̱�/����');
insert into depart_nation values('US/LAX', '�̱�/LA');
insert into depart_nation values('GB/LHR', '����/����');
insert into depart_nation values('TW/TPE', '�븸/Ÿ������');
insert into depart_nation values('IT/FCO', '��Ż����/�θ�');
insert into depart_nation values('DE/HHH', '����/����ũǪ��Ʈ');
insert into depart_nation values('CH/ZRH', '������/�븮��');

--arrive_nation �߰�
insert into arrive_nation values('KR/ICH', '���ѹα�/��õ');
insert into arrive_nation values('KR/CJU', '���ѹα�/����');
insert into arrive_nation values('JP/HND', '�Ϻ�/�ϳ״�');
insert into arrive_nation values('JP/NRT', '�Ϻ�/����Ÿ');
insert into arrive_nation values('US/JFK', '�̱�/����');
insert into arrive_nation values('US/LAX', '�̱�/LA');
insert into arrive_nation values('GB/LHR', '����/����');
insert into arrive_nation values('TW/TPE', '�븸/Ÿ������');
insert into arrive_nation values('IT/FCO', '��Ż����/�θ�');
insert into arrive_nation values('DE/HHH', '����/����ũǪ��Ʈ');
insert into arrive_nation values('CH/ZRH', '������/�븮��');

--passenger �߰�
insert into passenger values('SJ960','�ȼ���',960522,'010-9465-7709');
insert into passenger values('SJ777','������',951227,'010-1115-9999');
insert into passenger values('SH987','�̽�ȣ',960522,'010-5156-9977');
insert into passenger values('MW305','��ο�',960301,'010-1234-7895');
insert into passenger values('HM458','��ȿ��',901005,'010-3214-9876');
insert into passenger values('JH667','������',890427,'010-4567-6543');
insert into passenger values('HW123','������',990516,'010-6543-7418');
insert into passenger values('MJ872','�����',971027,'010-9009-8888');
insert into passenger values('TY446','���¿�',951120,'010-4945-7236');
insert into passenger values('SZ996','������',960914,'010-2233-4411');
insert into passenger values('YY411','������',910430,'010-7755-3369');
insert into passenger values('CH119','ä����',971113,'010-5471-6664');
insert into passenger values('JY454','�����',950909,'010-4521-1614');
insert into passenger values('GA777','������',950904,'010-4451-6771');
insert into passenger values('MW123','������',950211,'010-4778-8774');
insert into passenger values('JH852','����ȣ',900101,'010-7891-1234');
insert into passenger values('PK557','���缺',890522,'010-5068-4741');
insert into passenger values('SY004','�ۿ��',951115,'010-7412-6678');
insert into passenger values('KI112','��迵',951118,'010-3214-3369');
insert into passenger values('KL447','��濱',951115,'010-7412-6678');

--flight �߰�
insert into flight values('KAL-001','2022-09-10',27,1445,'KR/ICH','JP/HND');
insert into flight values('KAL-002','2022-09-25',41,2225,'KR/CJU','TW/TPE');

insert into flight values('KAL-003','2022-10-10',25,1900,'KR/ICH','US/LAX');
insert into flight values('KAL-007','2022-05-10',19,1300,'KR/ICH','IT/FCO');

insert into flight values('KAL-005','2022-07-19',24,1430,'KR/ICH','GB/LHR');
insert into flight values('KAL-006','2022-07-12',24,0930,'GB/LHR','DE/HHH');

--ticket �߰�
insert into ticket values('ticket-001','KAL-001','SJ960',27,'51D',1415,'KR/ICH','JP/HND');
insert into ticket values('ticket-002','KAL-001','SJ777',27,'51C',1415,'KR/CJU','JP/NRT');
insert into ticket values('ticket-003','KAL-002','SH987',41,'15A',2225,'KR/ICH','TW/TPE');

--��� �°� �� ��ȸ�ϴ� select �� 
select ticket.flight_num as ž����, passenger.name as �°���, ticket.boarding as ž�½ð�, gate as "ž�� ����Ʈ", seat as �¼���ȣ, depart_nation.name as ����� ,arrive_nation.name as ������
from ticket
join passenger on ticket.name=passenger.passport
join depart_nation on ticket.depart_nation=depart_nation.code
join arrive_nation on ticket.arrive_nation=arrive_nation.code;

--���� ����⸸ Ÿ�� �°��� ��ȸ�ϴ� select �� 
select ticket.flight_num as ž����, passenger.name as �°���, ticket.boarding as ž�½ð�, gate as "ž�� ����Ʈ", seat as �¼���ȣ, depart_nation.name as ����� ,arrive_nation.name as ������
from ticket
join passenger on ticket.name=passenger.passport
join depart_nation on ticket.depart_nation=depart_nation.code
join arrive_nation on ticket.arrive_nation=arrive_nation.code
where ticket.arrive_nation='TW/TPE';