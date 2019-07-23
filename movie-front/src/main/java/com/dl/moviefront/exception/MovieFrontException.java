package com.dl.moviefront.exception;

/**
 * Created by 001977 on 2019-07-23 15:58.
 */
public class MovieFrontException extends RuntimeException {
    public MovieFrontException(String message) {
        super(message);
    }

    public MovieFrontException(String message, Throwable cause) {
        super(message, cause);
    }

    public MovieFrontException(Throwable cause) {
        super(cause);
    }
}
