package com.dl.api.common;

import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;

/**
 * Created by 001977 on 2019-07-10 14:38.
 * 基本请求类
 */
@Getter
@Setter
public class BaseRequest implements Serializable {
    // 页码
    private int pageNo;
    // 每一页大小
    private int pageSize;
    private int limitStart;
    private int limitEnd;

    public int getLimitStart() {
        return (pageNo-1)*pageSize;
    }

    public int getLimitEnd() {
        return pageSize;
    }
}
