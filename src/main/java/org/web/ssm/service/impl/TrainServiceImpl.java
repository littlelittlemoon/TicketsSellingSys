package org.web.ssm.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.web.ssm.dao.PriceInfoMapper;
import org.web.ssm.dao.TrainMapper;
import org.web.ssm.dto.SearchTicketsResult;
import org.web.ssm.model.Pages;
import org.web.ssm.model.PriceInfoView;
import org.web.ssm.model.Train;
import org.web.ssm.service.IPriceInfoService;
import org.web.ssm.service.ITrainService;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

@Service("trainService")
public class TrainServiceImpl implements ITrainService {
    @Autowired
    private TrainMapper trainMapper;
    @Autowired
    private PriceInfoMapper priceInfoMapper;

    @Override
    public List<SearchTicketsResult> getTrainByStation(String startstation, String endstation, String date) throws ParseException {
        //格式化日期
        DateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
        Date d = format1.parse(date);

        List<PriceInfoView> ticketinfolist = trainMapper.selectByStation(startstation, endstation, d);
        Set<Object> idset = new HashSet<Object>();
        //利用set不重复记录所有列车id方便下面进行查询
        for (int i = 0; i < ticketinfolist.size(); i++) {
            idset.add(ticketinfolist.get(i).getTrainid());
        }

        Iterator it = idset.iterator();
        List<SearchTicketsResult> searchlist = new ArrayList<SearchTicketsResult>();
        while (it.hasNext()) {
            String trainid = String.valueOf(it.next());
            Train train = trainMapper.selectByPrimaryKey(trainid);
            List<PriceInfoView> l = new ArrayList<PriceInfoView>();
            for (int i = 0; i < ticketinfolist.size(); i++) {
                if (ticketinfolist.get(i).getTrainid().equals(trainid)) {
                    l.add(ticketinfolist.get(i));

                }
            }
            searchlist.add(new SearchTicketsResult(train, l));
        }

        return searchlist;
    }

    @Override
    public List<SearchTicketsResult> getTrainByStation(String startstation, String endstation) {
        List<PriceInfoView> ticketinfolist = trainMapper.selectPriceByStation(startstation, endstation);

        Set<Object> idset = new HashSet<Object>();
        //利用set不重复记录所有列车id方便下面进行查询
        for (int i = 0; i < ticketinfolist.size(); i++) {
            idset.add(ticketinfolist.get(i).getTrainid());
        }

        Iterator it = idset.iterator();
        List<SearchTicketsResult> searchlist = new ArrayList<SearchTicketsResult>();
        while (it.hasNext()) {
            String trainid = String.valueOf(it.next());
            Train train = trainMapper.selectByPrimaryKey(trainid);
            List<PriceInfoView> l = new ArrayList<PriceInfoView>();
            for (int i = 0; i < ticketinfolist.size(); i++) {
                if (ticketinfolist.get(i).getTrainid().equals(trainid)) {
                    l.add(ticketinfolist.get(i));

                }
            }
            searchlist.add(new SearchTicketsResult(train, l));
        }

        return searchlist;
    }

    @Override
    public Pages<Train> getAllTrain(int pageSize, int pageCurrent, String keyword) {
        Pages<Train> TrainPages = new Pages<Train>();
        TrainPages.setPageSize(pageSize);
        TrainPages.setMaxRow(pageSize * pageCurrent + 1);
        TrainPages.setMinRow(pageSize * (pageCurrent - 1));
        TrainPages.setCurrentPage(pageCurrent);
        TrainPages.setKeyWords(keyword);
        TrainPages.setResults(trainMapper.selectAll(TrainPages));
        TrainPages.setTotalRow(trainMapper.getCount(TrainPages));
        int totalPage = TrainPages.getTotalRow() % TrainPages.getPageSize() == 0 ? TrainPages.getTotalRow() / TrainPages.getPageSize() : TrainPages.getTotalRow() / TrainPages.getPageSize() + 1;
        TrainPages.setTotalPage(totalPage);
        System.out.println(TrainPages);

        return TrainPages;
    }

    @Override
    public Train getTrainById(String id) {
        return trainMapper.selectByPrimaryKey(id);
    }

    @Override
    public void insertTrain(Train train) {
        try {
            trainMapper.insertTrain(train);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void deleteTrain(String trainid) {

        try {
            int res = priceInfoMapper.deletePriceInfoBytrain(trainid);
            //如果列车删除成功，则继续删除票价信息
            if (res >= 0) {
                trainMapper.deleteTrain(trainid);
            } else {
                throw new Exception("删除异常");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void updateTrain(Train train) {
        trainMapper.updateTrain(train);
    }
}
