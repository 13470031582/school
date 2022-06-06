package com.zq.school.common.exception.controller;

import com.zq.school.common.exception.BusinessException;
import com.zq.school.common.exception.IErrorCode;

public class ControllerException extends BusinessException {
    private static final long serialVersionUID = 1412104290896291466L;

    public ControllerException(IErrorCode errorCode, Object... params) {
        super(errorCode, params);
    }

    public ControllerException(Throwable cause, IErrorCode errorCode, Object... params) {
        super(cause, errorCode, params);
    }
}