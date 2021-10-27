package com.bingbing.utils;

import java.util.UUID;

public class UUIDUtils {

    /**
     * 生成随机数
     * @return
     */
    public static String randomUUID(){
        return UUID.randomUUID().toString().replace("-","");
    }

}
