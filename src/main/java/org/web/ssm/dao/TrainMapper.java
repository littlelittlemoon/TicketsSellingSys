package org.web.ssm.dao;

import org.apache.ibatis.annotations.Param;
import org.web.ssm.model.Pages;
import org.web.ssm.model.PriceInfoView;
import org.web.ssm.model.Train;

import java.util.Date;
import java.util.List;

public interface TrainMapper {

    Train selectByPrimaryKey(String trainid);

    //@Param()注解
    //如果有多个参数，将会默认命名为如#{param1},#{param2},可以使用此注解重命名
    List<PriceInfoView> selectByStation(@Param("startStation") String startStation, @Param("endStation") String endStation, @Param("date") Date date);

    List<PriceInfoView> selectPriceByStation(@Param("startStation") String startStation, @Param("endStation") String endStation);

    List<Train> selectAll(Pages<Train> pages);

    Integer getCount(Pages<Train> pages);

    Integer insertTrain(Train train);

    Integer deleteTrain(String trainid);

    Integer updateTrain(Train train);

    //站票数量-1
    void reduceStandNumberByid(String trainid);

    //    坐票数量-1
    void reduceSeatNumberByid(String trainid);

    //    卧票数量-1
    void reduceSleepNumberByid(String trainid);

    //站票数量+1
    void addStandNumberByid(String trainid);

    //    坐票数量+1
    void addSeatNumberByid(String trainid);

    //    卧票数量+1
    void addSleepNumberByid(String trainid);


}
