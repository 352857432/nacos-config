package com.test.nacos.service1;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

public class PasswordEncoderUtil {
    public static void main(String[] args) {
        String encode = new BCryptPasswordEncoder().encode("456");
        System.out.println(encode);
    }
}
