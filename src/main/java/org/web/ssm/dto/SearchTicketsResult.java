package org.web.ssm.dto;

import org.web.ssm.model.PriceInfoView;
import org.web.ssm.model.Train;

import java.io.Serializable;
import java.util.List;

/**
 * 查询车票操作后返回的结果实体类
 */
public class SearchTicketsResult implements Serializable {
    private Train train;
    private List<PriceInfoView> ticketinfolist;

    public Train getTrain() {
        return train;
    }

    public void setTrain(Train train) {
        this.train = train;
    }

    public SearchTicketsResult() {
    }

    public SearchTicketsResult(Train train, List<PriceInfoView> ticketinfolist) {
        this.train = train;
        this.ticketinfolist = ticketinfolist;
    }

    @Override
    public String toString() {
        return "SearchTicketsResult{" +

                "train=" + train +
                ", ticketinfolist=" + ticketinfolist +
                '}';
    }

    public List<PriceInfoView> getTicketinfolist() {
        return ticketinfolist;
    }

    public void setTicketinfolist(List<PriceInfoView> ticketinfolist) {
        this.ticketinfolist = ticketinfolist;
    }
}
