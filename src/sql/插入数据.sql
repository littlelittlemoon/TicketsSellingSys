
----------------------------��λ���ͱ�-----------------------------
insert into T_Seat 
values('S101','վƱ');

insert into T_Seat 
values('S102','��Ʊ');

insert into T_Seat 
values('S103','��Ʊ');

select * from T_Seat

------------------------------��ɫ��-----------------------------

insert into T_Role 
values('R101','����Ա');

insert into T_Role 
values('R102','��ƱԱ');

select * from T_Role

------------------------------��Ʊ���ͱ�-----------------------------

insert into T_SellStyle 
values('B101','��Ʊ');

insert into T_SellStyle 
values('B102','��Ʊ');

insert into T_SellStyle 
values('B103','��Ʊ');

select * from T_SellStyle

------------------------------����վվ�������-----------------------------

insert into T_StartStation 
values('SST101','��ɽ');

insert into T_StartStation 
values('SST102','�ɶ�');

insert into T_StartStation 
values('SST103','�ڽ�');

insert into T_StartStation 
values('SST104','����');

insert into T_StartStation 
values('SST105','����');

insert into T_StartStation 
values('SST106','¡��');

--delete from T_StartStation where SSTA_Id='EST106'
select * from T_StartStation

------------------------------Ŀ��վվ�������-----------------------------

insert into T_EndStation 
values('EST101','��ɽ');

insert into T_EndStation 
values('EST102','�ɶ�');

insert into T_EndStation 
values('EST103','�ڽ�');

insert into T_EndStation 
values('EST104','����');

insert into T_EndStation 
values('EST105','����');

insert into T_EndStation 
values('EST106','¡��');

--delete from T_EndStation where ESTA_Id='SST101'
select * from T_EndStation


------------------------------�û�������-----------------------------

insert into T_UserInfo 
values('US1001','123456','̷����','Ů', 'R101');

insert into T_UserInfo 
values('US1002','123456','�ƺ�','Ů', 'R102');

select * from T_UserInfo


------------------------------������Ϣ������-----------------------------

insert into T_TrainInfo 
values('CK1001','TR1001','SST102','EST105',to_date('2016-05-20 9:00:00','yyyy-mm-dd hh24:mi:ss'),to_date('2016-05-20 12:30:00','yyyy-mm-dd hh24:mi:ss'),1024,24,45,12);

insert into T_TrainInfo 
values('CK1002','TR1002','SST102','EST105',to_date('2016-05-20 10:00:00','yyyy-mm-dd hh24:mi:ss'),to_date('2016-05-20 13:30:00','yyyy-mm-dd hh24:mi:ss'),1024,13,9,12);

insert into T_TrainInfo 
values('CK1003','TR1001','SST105','EST102',to_date('2016-05-20 15:00:00','yyyy-mm-dd hh24:mi:ss'),to_date('2016-05-20 18:30:00','yyyy-mm-dd hh24:mi:ss'),1024,24,6,4);

insert into T_TrainInfo 
values('CK1004','TR1002','SST105','EST102',to_date('2016-05-20 16:00:00','yyyy-mm-dd hh24:mi:ss'),to_date('2016-05-20 19:30:00','yyyy-mm-dd hh24:mi:ss'),1024,3,25,8);

insert into T_TrainInfo 
values('CK1005','TR1003','SST102','EST106',to_date('2016-05-20 9:00:00','yyyy-mm-dd hh24:mi:ss'),to_date('2016-05-20 13:30:00','yyyy-mm-dd hh24:mi:ss'),1980,30,10,12);



delete from T_TrainInfo where T_Id='CK1005'

select * from T_TrainInfo  where T_Id = 'CK1002'


------------------------------Ʊ�ۻ�����-----------------------------

insert into T_PriceInfo 
values('CK1001','S101','SST102','EST105',to_date('2016-05-20 9:00:00','yyyy-mm-dd hh24:mi:ss'),to_date('2016-05-20 12:30:00','yyyy-mm-dd hh24:mi:ss'),1024,20);

insert into T_PriceInfo 
values('CK1001','S102','SST102','EST105',to_date('2016-05-20 9:00:00','yyyy-mm-dd hh24:mi:ss'),to_date('2016-05-20 12:30:00','yyyy-mm-dd hh24:mi:ss'),1024,30);

insert into T_PriceInfo 
values('CK1001','S103','SST102','EST105',to_date('2016-05-20 9:00:00','yyyy-mm-dd hh24:mi:ss'),to_date('2016-05-20 12:30:00','yyyy-mm-dd hh24:mi:ss'),1024,40);


insert into T_PriceInfo 
values('CK1001','S101','SST102','EST104',to_date('2016-05-20 9:00:00','yyyy-mm-dd hh24:mi:ss'),to_date('2016-05-20 11:00:00','yyyy-mm-dd hh24:mi:ss'),780,10);

insert into T_PriceInfo 
values('CK1001','S102','SST102','EST104',to_date('2016-05-20 9:00:00','yyyy-mm-dd hh24:mi:ss'),to_date('2016-05-20 11:00:00','yyyy-mm-dd hh24:mi:ss'),780,20);

insert into T_PriceInfo 
values('CK1001','S103','SST102','EST104',to_date('2016-05-20 9:00:00','yyyy-mm-dd hh24:mi:ss'),to_date('2016-05-20 11:00:00','yyyy-mm-dd hh24:mi:ss'),780,30);

insert into T_PriceInfo 
values('CK1002','S101','SST102','EST105',to_date('2016-05-20 10:00:00','yyyy-mm-dd hh24:mi:ss'),to_date('2016-05-20 13:30:00','yyyy-mm-dd hh24:mi:ss'),1024,10);

insert into T_PriceInfo 
values('CK1002','S102','SST102','EST105',to_date('2016-05-20 10:00:00','yyyy-mm-dd hh24:mi:ss'),to_date('2016-05-20 13:30:00','yyyy-mm-dd hh24:mi:ss'),1024,20);

insert into T_PriceInfo 
values('CK1002','S103','SST102','EST105',to_date('2016-05-20 10:00:00','yyyy-mm-dd hh24:mi:ss'),to_date('2016-05-20 13:30:00','yyyy-mm-dd hh24:mi:ss'),1024,30);



select * from T_PriceInfo


------------------------------��Ʊ������-----------------------------

insert into T_TicketInfo 
values('TK1001','SST102','EST105',to_date('2016-05-20 9:00:00','yyyy-mm-dd hh24:mi:ss'),to_date('2016-05-20 12:30:00','yyyy-mm-dd hh24:mi:ss'),'S102',30,'CK1001');

delete from T_TicketInfo where TI_Id = 'TK1001'
select * from T_TicketInfo

------------------------------�ÿͻ�����-----------------------------

insert into T_PassengerInfo 
values('5010451234567','��С��','TK1001','B101');

select * from T_PassengerInfo


drop table T_PassengerInfo;
drop table T_TicketInfo;
drop table T_PriceInfo;
drop table T_TrainInfo;
drop table T_UserInfo;
drop table T_Station;
drop table T_SellStyle;


select * from V_TrainInfo
