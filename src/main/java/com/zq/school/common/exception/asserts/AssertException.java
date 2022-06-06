package com.zq.school.common.exception.asserts;

import com.zq.school.common.exception.BusinessException;
import com.zq.school.common.exception.IErrorCode;

public class AssertException extends BusinessException {
    private static final long serialVersionUID = -2437654128033393978L;

    public AssertException(IErrorCode errorCode, Object... params) {
        super(errorCode, params);
    }

    public AssertException(Throwable cause, IErrorCode errorCode, Object... params) {
        super(cause, errorCode, params);
    }
}

