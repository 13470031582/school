package com.zq.school.common.exception;

public interface IErrorCode {
    String getCode();

    String getMessageWithCode(Object... params);

    String getMessage(Object... params);
}
