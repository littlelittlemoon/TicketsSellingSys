
----------------------------座位类型表-----------------------------
insert into T_Seat 
values('S101','站票');

insert into T_Seat 
values('S102','坐票');

insert into T_Seat 
values('S103','卧票');

select * from T_Seat

------------------------------角色表-----------------------------

insert into T_Role 
values('R101','管理员');

insert into T_Role 
values('R102','售票员');

select * from T_Role

------------------------------购票类型表-----------------------------

insert into T_SellStyle 
values('B101','购票');

insert into T_SellStyle 
values('B102','订票');

insert into T_SellStyle 
values('B103','退票');

select * from T_SellStyle

------------------------------出发站站点基本表-----------------------------

insert into T_StartStation 
values('SST101','乐山');

insert into T_StartStation 
values('SST102','成都');

insert into T_StartStation 
values('SST103','内江');

insert into T_StartStation 
values('SST104','资阳');

insert into T_StartStation 
values('SST105','资中');

insert into T_StartStation 
values('SST106','隆昌');

--delete from T_StartStation where SSTA_Id='EST106'
select * from T_StartStation

------------------------------目的站站点基本表-----------------------------

insert into T_EndStation 
values('EST101','乐山');

insert into T_EndStation 
values('EST102','成都');

insert into T_EndStation 
values('EST103','内江');

insert into T_EndStation 
values('EST104','资阳');

insert into T_EndStation 
values('EST105','资中');

insert into T_EndStation 
values('EST106','隆昌');

--delete from T_EndStation where ESTA_Id='SST101'
select * from T_EndStation


------------------------------用户基本表-----------------------------

insert into T_UserInfo 
values('US1001','123456','谭凯悦','女', 'R101');

insert into T_UserInfo 
values('US1002','123456','黄浩','女', 'R102');

select * from T_UserInfo


------------------------------车次信息基本表-----------------------------

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


------------------------------票价基本表-----------------------------

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


------------------------------车票基本表-----------------------------

insert into T_TicketInfo 
values('TK1001','SST102','EST105',to_date('2016-05-20 9:00:00','yyyy-mm-dd hh24:mi:ss'),to_date('2016-05-20 12:30:00','yyyy-mm-dd hh24:mi:ss'),'S102',30,'CK1001');

delete from T_TicketInfo where TI_Id = 'TK1001'
select * from T_TicketInfo

------------------------------旅客基本表-----------------------------

insert into T_PassengerInfo 
values('5010451234567','陈小清','TK1001','B101');

select * from T_PassengerInfo


drop table T_PassengerInfo;
drop table T_TicketInfo;
drop table T_PriceInfo;
drop table T_TrainInfo;
drop table T_UserInfo;
drop table T_Station;
drop table T_SellStyle;


select * from V_TrainInfo
