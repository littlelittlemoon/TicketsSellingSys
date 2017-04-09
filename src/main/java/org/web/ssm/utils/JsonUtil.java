package org.web.ssm.utils;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializeConfig;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.alibaba.fastjson.serializer.SimpleDateFormatSerializer;

import java.util.Date;

/**
 * Created  on 2016/5/29.
 * 对json序列化中的时间进行处理
 */
public class JsonUtil {
    private static SerializeConfig mapping = new SerializeConfig();
    private static String dateFormat;

    static {
        dateFormat = "yyyy-mm-dd hh:mm:ss";
    }

    /**
     * 默认时间格式
     *
     * @param jsonText
     * @return
     */
    public static String toJson(Object jsonText) {
        return JSON.toJSONString(jsonText, SerializerFeature.WriteDateUseDateFormat);
    }

    /**
     * 自定义时间格式
     *
     * @param dateFormat
     * @param jsonText
     * @return
     */
    public static String toJson(String dateFormat, Object jsonText) {
        mapping.put(Date.class, new SimpleDateFormatSerializer(dateFormat));
        return JSON.toJSONString(jsonText, mapping);
    }
}
