package com.dl.api.common;

import lombok.Getter;
import lombok.Setter;

/**
 * Created by 001977 on 2019-07-10 14:49.
 */
@Getter
@Setter
public class MovieException extends RuntimeException {

    private int code;

    public MovieException(String message, int code) {
        super(message);
        this.code = code;
    }


}
