package org.web.ssm.dao;

import org.web.ssm.model.TicketInfo;

//
public interface TicketInfoMapper {
    TicketInfo selectByPrimaryKey(String ticketid);

    void insertTicketInfo(TicketInfo ticketInfo);
}
