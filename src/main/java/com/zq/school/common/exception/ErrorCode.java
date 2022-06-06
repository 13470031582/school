package com.zq.school.common.exception;


import com.zq.school.common.enums.SystemErrorCodeEnum;

import java.text.MessageFormat;

public class ErrorCode implements IErrorCode {
    public static final int ERROR_CODE_LENGTH = 6;
    private static final Object[] ARRAY_OF_SINGLE_NULL = new Object[]{null};
    private final String code;
    private final String message;
    private final boolean doReplace;

    public ErrorCode(String code, String message) {
        if (null != code && !code.trim().isEmpty()) {
            if (6 != code.length()) {
                throw new BusinessException(SystemErrorCodeEnum.CODE_ERROR, new Object[]{code});
            } else {
                if (null == message) {
                    message = "";
                } else {
                    message = message.trim();
                }

                boolean doReplace = false;

                try {
                    MessageFormat mf = new MessageFormat(message);
                    doReplace = mf.getFormats().length > 0;
                } catch (IllegalArgumentException var5) {
                    var5.printStackTrace();
                }

                this.code = code;
                this.message = message;
                this.doReplace = doReplace;
            }
        } else {
            throw new BusinessException(SystemErrorCodeEnum.CODE_EMPTY, new Object[0]);
        }
    }

    public String getCode() {
        return this.code;
    }

    public String getMessageWithCode(Object... params) {
        String msg = this._getMessage(params);
        if (!msg.startsWith(this.code)) {
            msg = this.code + " - " + msg;
        }

        return msg;
    }

    public String getMessage(Object... params) {
        String msg = this._getMessage(params);
        return msg;
    }

    String _getMessage(Object... params) {
        if (this.message.isEmpty()) {
            String message = this.code + " - UNKONWN ERROR";
            if (null != params && 0 != params.length) {
                StringBuilder sb = new StringBuilder(message);
                sb.append("(");

                for(int i = 0; i < params.length; ++i) {
                    Object param = params[i];
                    if (i > 0) {
                        sb.append(", ");
                    }

                    sb.append(param.toString());
                }

                sb.append(")");
                return sb.toString();
            } else {
                return message;
            }
        } else if (!this.doReplace) {
            return this.message;
        } else {
            Object[] _params = params;
            if (params == null) {
                _params = ARRAY_OF_SINGLE_NULL;
            }

            String _message = this.message;
            if (_params.length > 0) {
                try {
                    _message = MessageFormat.format(_message, _params);
                } catch (Exception var6) {
                }
            }

            return _message;
        }
    }
}
