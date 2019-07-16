package com.dl.api.common.enums;

import lombok.Getter;
import lombok.Setter;

/**
 * Created by 001977 on 2019-07-10 14:39.
 */
@Getter
public enum UserTypeEnum {

    ADMIN(1, "管理员"),
    USER(2, "普通用户");

    private Integer code;
    private String name;

    UserTypeEnum(Integer code, String name) {
        this.code = code;
        this.name = name;
    }
}
