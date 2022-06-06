package com.zq.school.common.exception.service;

import com.zq.school.common.exception.BusinessException;
import com.zq.school.common.exception.IErrorCode;

public class ServiceException extends BusinessException {
    private static final long serialVersionUID = -2437160791033393978L;

    public ServiceException(IErrorCode errorCode, Object... params) {
        super(errorCode, params);
    }

    public ServiceException(Throwable cause, IErrorCode errorCode, Object... params) {
        super(cause, errorCode, params);
    }
}