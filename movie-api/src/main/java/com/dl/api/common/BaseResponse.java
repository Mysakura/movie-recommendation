package com.dl.api.common;

import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;

/**
 * Created by 001977 on 2019-07-10 14:38.
 * 基本请求结果包装类
 */
@Getter
@Setter
public class BaseResponse<T> implements Serializable {

    private int code;
    private String message;
    private T data;

}
