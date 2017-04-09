
---------------------------车次信息视图---------------------------
create view V_TrainInfo
as
select T_Id 车次编号, T_Num 列车编号, SSTA_Name 出发站,ESTA_Name 终点站,
T_StartTime  出发时间,T_EndTime 到达时间, T_AllDistance 总里程 ,T_StandNum 剩余站票数量,
T_SeatNum 剩余坐票数量,T_SleepNum 剩余卧票数量
from T_TrainInfo, T_StartStation, T_EndStation 
where  T_TrainInfo.T_StartStaId =  T_StartStation.SSTA_Id
and  T_TrainInfo.T_EndStaId =  T_EndStation.ESTA_Id

--select * from V_TrainInfo
--drop view V_TrainInfo


---------------------------票价信息视图---------------------------
create view V_TicketPrice
as
select T_Id 车次编号, SSTA_Name 出发站, ESTA_Name 目的站,
TP_StartTime  出发时间, TP_ArriveTime 到达时间, TP_Distance 里程 , S_Name 座位类型,TP_Price 票价
from T_PriceInfo, T_StartStation, T_EndStation, T_Seat
where T_PriceInfo.TP_StartStaId =  T_StartStation.SSTA_Id
and  T_PriceInfo.TP_GoleStaId =  T_EndStation.ESTA_Id
and  T_PriceInfo.S_Id =  T_Seat.S_Id

select * from V_TicketPrice where 车次编号 = 'CK1001' AND  出发站 = '成都' 
and 目的站 = '资中'

