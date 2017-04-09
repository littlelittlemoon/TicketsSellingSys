package org.web.ssm.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.TypeReference;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.web.ssm.dto.OrderInfo;
import org.web.ssm.dto.ResultModel;

import java.util.List;

/**
 * Created by LUOLIANG on 2016/6/25.
 */
@RestController
@RequestMapping("/test")
public class testController {

    @RequestMapping("/testajax")
    public String testajax(@RequestParam("json") String json) {
        System.out.println(json);
        List<OrderInfo> list = JSON.parseObject(json, new TypeReference<List<OrderInfo>>() {
        });
        System.out.println(list);

        return JSON.toJSONString(new ResultModel<>("成功", true));
    }
}
