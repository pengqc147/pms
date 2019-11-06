package com.pqc.common;

import java.util.HashMap;
import java.util.Map;
import java.util.Set;

public class PageCut {

    public static String searchToString(Map<String, Object> search) {
        Set<Map.Entry<String, Object>> entries = search.entrySet();
        String str="";
        for (Map.Entry<String, Object> entry : entries) {
            String key = entry.getKey();
            String value =(String) entry.getValue();
            str=str+"&"+"search_"+key+"="+value;
        }
        return str;
    }

    private  static Map<String, String> findSearchIsLike(Map<String, Object> search) {
        Map<String, String> resultMap = new HashMap<String, String>();
        Set<Map.Entry<String, Object>> entries = search.entrySet();
        for (Map.Entry<String, Object> entry : entries) {
            String key = entry.getKey();
            String value = (String) entry.getValue();
            if(key.contains("like")){
                value="%"+value+"%";
            }
            resultMap.put(key,value);
        }
        return resultMap;
    }
}
