package org.web.servicetest;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import javafx.scene.input.DataFormat;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.web.ssm.dto.SearchTicketsResult;
import org.web.ssm.model.Pages;
import org.web.ssm.model.Train;
import org.web.ssm.service.ITrainService;
import org.web.ssm.utils.JsonUtil;

import java.io.File;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:configs/spring-*.xml"})
public class trainServiceTest {
    private Logger logger = LogManager.getLogger(trainServiceTest.class);
    @Autowired
    private ITrainService trainService;

//    @Test
//    public void testSearch() throws ParseException {
//        List<SearchTicketsResult> list = trainService.getTrainByStation("成都", "资中", "2016-05-20");
//        System.out.println(JsonUtil.toJson("hh:mm:ss", list));
//    }

    @Test
    public void testquery() throws JsonProcessingException, ParseException {
        Pages<Train> list = trainService.getAllTrain(1, 1, "");
//        SimpleDateFormat  df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//        for (int i = 0; i < list.getResults().size(); i++) {
//            Date date = list.getResults().get(i).getStarttime();
//            date = df.parse(df.format(date));
//            list.getResults().get(i).setarrtime(date);
//        }
//        System.out.println(list.getResults().get(0).getarrtime());
//        ObjectMapper mapper = new ObjectMapper();
//        String json = mapper.writeValueAsString(list.getResults().get(0));
//        System.out.println(json);
        System.out.println(JSON.toJSONString(trainService.getTrainById("CK1001")));
//        System.out.println(JSON.toJSONStringWithDateFormat(list.getResults().get(0),"yyyy-MM-dd HH:mm:ss"));
    }
}
