package com.dl.api.common.response;

import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;

/**
 * Created by 001977 on 2019-07-10 15:33.
 */
@Getter
@Setter
public class DemoDTO implements Serializable {
    private Integer id;

    private String name;
}
