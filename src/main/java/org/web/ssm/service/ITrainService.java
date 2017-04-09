package org.web.ssm.service;

import org.web.ssm.dto.SearchTicketsResult;
import org.web.ssm.model.Pages;
import org.web.ssm.model.Train;

import java.text.ParseException;
import java.util.List;

/**
 * Created by LUOLIANG on 2016/5/26.
 */
public interface ITrainService {
    //根据id查询列车
    Train getTrainById(String id);

    //根据站点还有时间查询列车相关信息
    List<SearchTicketsResult> getTrainByStation(String startstation, String endstation, String date) throws ParseException;


    List<SearchTicketsResult> getTrainByStation(String startstation, String endstation);


    Pages<Train> getAllTrain(int pageSize, int pageCurrent, String keyword);

    void insertTrain(Train train);

    void deleteTrain(String trainid);

    void updateTrain(Train train);
}
