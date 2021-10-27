package com.bingbing.utils;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

public class PasswordUtil {


    /**
     * 加密
     * @param password
     * @return
     */
    public static String encode(String password){
        return new BCryptPasswordEncoder().encode(password);
    }

}
