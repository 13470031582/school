package com.zq.school.common.exception;

public class BusinessException extends RuntimeException {
    private static final long serialVersionUID = 2074707635527872856L;
    private final IErrorCode code;
    private final Object[] params;

    public BusinessException(IErrorCode errorCode, Object... params) {
        super(errorCode.getMessageWithCode(params));
        this.code = errorCode;
        this.params = params;
    }

    public BusinessException(Throwable cause, IErrorCode errorCode, Object... params) {
        super(errorCode.getMessageWithCode(params), cause);
        this.code = errorCode;
        this.params = params;
    }

    public String getCode() {
        return this.code.getCode();
    }

    public Object[] getParams() {
        return this.params;
    }

    public String getMessage() {
        return this.code.getMessage(this.params);
    }

    public boolean hasCause() {
        return this.getCause() != null;
    }
}
