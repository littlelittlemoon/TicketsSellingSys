
---------------------------������Ϣ��ͼ---------------------------
create view V_TrainInfo
as
select T_Id ���α��, T_Num �г����, SSTA_Name ����վ,ESTA_Name �յ�վ,
T_StartTime  ����ʱ��,T_EndTime ����ʱ��, T_AllDistance ����� ,T_StandNum ʣ��վƱ����,
T_SeatNum ʣ����Ʊ����,T_SleepNum ʣ����Ʊ����
from T_TrainInfo, T_StartStation, T_EndStation 
where  T_TrainInfo.T_StartStaId =  T_StartStation.SSTA_Id
and  T_TrainInfo.T_EndStaId =  T_EndStation.ESTA_Id

--select * from V_TrainInfo
--drop view V_TrainInfo


---------------------------Ʊ����Ϣ��ͼ---------------------------
create view V_TicketPrice
as
select T_Id ���α��, SSTA_Name ����վ, ESTA_Name Ŀ��վ,
TP_StartTime  ����ʱ��, TP_ArriveTime ����ʱ��, TP_Distance ��� , S_Name ��λ����,TP_Price Ʊ��
from T_PriceInfo, T_StartStation, T_EndStation, T_Seat
where T_PriceInfo.TP_StartStaId =  T_StartStation.SSTA_Id
and  T_PriceInfo.TP_GoleStaId =  T_EndStation.ESTA_Id
and  T_PriceInfo.S_Id =  T_Seat.S_Id

select * from V_TicketPrice where ���α�� = 'CK1001' AND  ����վ = '�ɶ�' 
and Ŀ��վ = '����'

