package com.zq.school.manage.common;

import com.zq.school.common.exception.ErrorCode;
import com.zq.school.common.exception.IErrorCode;

public enum SchoolErrorCodeEnum implements IErrorCode {
    DOCUMENT_NOT_NULL("120004", "{0}不能为空"),
    ;
    private final ErrorCode errorCode;

    SchoolErrorCodeEnum(String code, String message) {
        this.errorCode = new ErrorCode(code, message);
    }

    @Override
    public String getCode() {
        return errorCode.getCode();
    }

    @Override
    public String getMessageWithCode(Object... params) {
        return errorCode.getMessageWithCode(params);
    }

    @Override
    public String getMessage(Object... params) {
        return errorCode.getMessage(params);
    }


}
