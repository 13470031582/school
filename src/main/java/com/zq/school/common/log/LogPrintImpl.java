package com.zq.school.common.log;


import com.zq.school.common.exception.BusinessException;
import com.zq.school.common.exception.IErrorCode;
import org.slf4j.Logger;

import java.text.MessageFormat;

public class LogPrintImpl implements LogPrint {
    private final Logger logger;

    LogPrintImpl(Logger logger) {
        this.logger = logger;
    }

    public void trace(String logText) {
        if (this.logger.isTraceEnabled()) {
            this.logger.trace(logText);
        }

    }

    public void trace(String logText, Object... args) {
        if (this.logger.isTraceEnabled()) {
            String s = this.formatText(logText, args);
            this.logger.trace(s);
        }

    }

    public void debug(String logText) {
        if (this.logger.isDebugEnabled()) {
            this.logger.debug(logText);
        }

    }

    public void debug(String logText, Object... args) {
        if (this.logger.isDebugEnabled()) {
            String s = this.formatText(logText, args);
            this.logger.debug(s);
        }

    }

    public void info(String logText) {
        if (this.logger.isInfoEnabled()) {
            this.logger.info(logText);
        }

    }

    public void info(String logText, Object... args) {
        if (this.logger.isInfoEnabled()) {
            String s = this.formatText(logText, args);
            this.logger.info(s);
        }

    }

    public void info(IErrorCode errorCode, Object... args) {
        if (this.logger.isInfoEnabled()) {
            String s = errorCode.getMessage(args);
            this.logger.info(s);
        }

    }

    public void warn(IErrorCode errorCode, Object... args) {
        if (this.logger.isWarnEnabled()) {
            String s = errorCode.getMessage(args);
            this.logger.warn(s);
        }

    }

    public void warn(BusinessException e) {
        if (this.logger.isWarnEnabled()) {
            String s = e.getMessage();
            this.logger.warn(s, e);
        }

    }

    public void warn(Throwable t, IErrorCode errorCode, Object... args) {
        if (this.logger.isWarnEnabled()) {
            String s = errorCode.getMessage(args);
            this.logger.warn(s, t);
        }

    }

    public void error(IErrorCode errorCode, Object... args) {
        if (this.logger.isErrorEnabled()) {
            String s = errorCode.getMessage(args);
            this.logger.error(s);
        }

    }

    public void error(BusinessException e) {
        if (this.logger.isErrorEnabled()) {
            String s = e.getMessage();
            this.logger.error(s, e);
        }

    }

    public void error(Throwable t, IErrorCode errorCode, Object... args) {
        if (this.logger.isErrorEnabled()) {
            String s = errorCode.getMessage(args);
            this.logger.error(s, t);
        }

    }

    private String formatText(String pattern, Object... args) {
        return MessageFormat.format(pattern, args);
    }
}

