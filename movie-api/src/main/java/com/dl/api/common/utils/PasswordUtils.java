package com.dl.api.common.utils;

import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.util.ByteSource;

public class PasswordUtils {

    public static String saltAndMd5(String username, String password){
        //加密算法
        String algorithmName = "MD5";
        //盐值（需要唯一，一般为用户ID）
        Object salt = ByteSource.Util.bytes(username);
        //加密次数
        int hashIterations = 10;
        SimpleHash hash = new SimpleHash(algorithmName, password, salt, hashIterations);
        return hash.toString();	//32位
    }

    public static void main(String[] args) {
        System.out.println(saltAndMd5("小白", "123456"));
    }
}
