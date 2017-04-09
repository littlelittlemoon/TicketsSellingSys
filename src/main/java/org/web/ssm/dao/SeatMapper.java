package org.web.ssm.dao;

import org.web.ssm.model.Seat;

public interface SeatMapper {
    Seat selectByPrimaryKey(String seatid);

    Seat selectByName(String sname);
}
