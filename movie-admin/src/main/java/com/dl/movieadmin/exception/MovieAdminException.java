package com.dl.movieadmin.exception;

/**
 * Created by 001977 on 2019-07-23 15:56.
 */
public class MovieAdminException extends RuntimeException {
    public MovieAdminException(String message) {
        super(message);
    }

    public MovieAdminException(String message, Throwable cause) {
        super(message, cause);
    }

    public MovieAdminException(Throwable cause) {
        super(cause);
    }
}
