
--------------------------------座位类型表-----------------------------------------
create table T_Seat(
   S_Id char(4) primary key,
   S_Name varchar(10) not null
);

drop table T_Seat
select * from T_Seat

--------------------------------角色表-----------------------------------------
create table T_Role(
   R_Id char(4) primary key,
   R_Name varchar(10) not null
);

drop table T_Role
select * from T_Role

--------------------------------购票类型表-----------------------------------------
create table T_SellStyle(
   SS_Id char(4) primary key,
   SS_Name varchar(10) not null
);

drop table T_SellStyle
select * from T_SellStyle

--------------------------------出发站点基本表-----------------------------------------
create table T_StartStation(
   SSTA_Id char(6) primary key,
   SSTA_Name varchar(10) not null
);

drop table T_StartStation
select * from T_StartStation

--------------------------------目的站点基本表-----------------------------------------
create table T_EndStation(
   ESTA_Id char(6) primary key,
   ESTA_Name varchar(10) not null
);

drop table T_EndStation
select * from T_EndStation

--------------------------------用户基本表-----------------------------------------
create table T_UserInfo(
   U_Id char(6) primary key,
   U_Pass VARCHAR(20),
   U_Name varchar(10) not null,
   U_Sex CHAR(2) CHECK (U_Sex IN( '男', '女')),
   R_Id char(4),
   foreign key(R_Id) references T_Role(R_Id)
);

drop table T_UserInfo
select * from T_UserInfo

--------------------------------车次信息基本表-----------------------------------------
create table T_TrainInfo(
   T_Id char(6) primary key,
   T_Num char(6) not null,
   T_StartStaId char(6),
   T_EndStaId char(6),
   T_StartTime date ,
   T_EndTime date ,
   T_AllDistance number(6,2),
   T_StandNum int,
   T_SeatNum INT,
   T_SleepNum INT,
   foreign key (T_StartStaId) references T_StartStation(SSTA_Id),
   foreign key (T_EndStaId) references T_EndStation(ESTA_Id)
);

drop table T_TrainInfo
select * from T_TrainInfo where T_Id = 'CK1002'

--------------------------------票价信息基本表-----------------------------------------
create table T_PriceInfo(
   T_Id char(6) ,
   S_Id char(4) ,
   TP_StartStaId char(6),
   TP_GoleStaId char(6),
   TP_StartTime date ,
   TP_ArriveTime date ,
   TP_Distance number(6,2),
   TP_Price int,
   PRIMARY KEY(T_Id,S_Id,TP_StartStaId,TP_GoleStaId),
   foreign key (TP_StartStaId) references T_StartStation(SSTA_Id),
   foreign key (TP_GoleStaId) references T_EndStation(ESTA_Id),
   foreign key (T_Id) references T_TrainInfo(T_Id),
   foreign key (S_Id) references T_Seat(S_Id)
);

drop table T_PriceInfo
select * from T_PriceInfo


--------------------------------车票基本表-----------------------------------------
create table T_TicketInfo(
   TI_Id CHAR(6) primary key,
   TI_StartStaId char(6),
   TI_GoleStaId char(6),
   TI_StartTime date ,
   TI_ArriveTime date ,
   S_Id char(4),
   TI_PRICE int,
   T_Id char(6) ,
   foreign key (TI_StartStaId) references T_StartStation(SSTA_Id),
   foreign key (TI_GoleStaId) references T_EndStation(ESTA_Id),
   foreign key (S_Id) references T_Seat(S_Id),
   foreign key (T_Id) references T_TrainInfo(T_Id)
);

drop table T_TicketInfo
select * from T_TicketInfo


--------------------------------旅客基本表-----------------------------------------
create table T_PassengerInfo(
   P_Id CHAR(13) primary key,
   P_Name VARCHAR(6),
   TI_Id CHAR(6) ,
   SS_Id CHAR(4),
   foreign key (TI_Id) references T_TicketInfo(TI_Id),
   foreign key (SS_Id) references T_SellStyle(SS_Id)
);

drop table T_PassengerInfo
select * from T_PassengerInfo

-- 创建序列
CREATE SEQUENCE USERINFO_SEQ
INCREMENT BY 1
START WITH 1003
NOCACHE
NOCYCLE;

--创建列车序列
CREATE SEQUENCE TrainInfo_seq
INCREMENT BY 1
START WITH 1005
NOCACHE
NOCYCLE;