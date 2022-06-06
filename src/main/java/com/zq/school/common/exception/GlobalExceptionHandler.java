package com.zq.school.common.exception;

import com.fasterxml.jackson.core.JsonParseException;
import com.zq.school.common.enums.SystemErrorCodeEnum;
import com.zq.school.common.exception.asserts.AssertException;
import com.zq.school.common.log.LogPrint;
import com.zq.school.common.log.LogPrintFactory;
import com.zq.school.common.result.CommonResult;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.dao.DataAccessException;
import org.springframework.http.converter.HttpMessageConversionException;
import org.springframework.stereotype.Component;
import org.springframework.validation.BindException;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.validation.ObjectError;
import org.springframework.web.HttpRequestMethodNotSupportedException;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;
import org.springframework.web.multipart.MaxUploadSizeExceededException;

import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import javax.validation.ValidationException;
import javax.websocket.DecodeException;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.sql.SQLException;
import java.sql.SQLNonTransientConnectionException;
import java.sql.SQLNonTransientException;
import java.sql.SQLSyntaxErrorException;
import java.util.Iterator;
import java.util.Set;

@Component
@RestControllerAdvice
public class GlobalExceptionHandler {
    private final LogPrint logger = LogPrintFactory.getLogger(GlobalExceptionHandler.class);
    @Value("${global.module.errorCode:100000}")
    private Integer errorCode;

    public GlobalExceptionHandler() {
    }

    @ExceptionHandler({BindException.class})
    public CommonResult validatedBindException(BindException e) {
        BindingResult bindingResult = e.getBindingResult();
        FieldError fieldError = e.getFieldError();
        String message = "[" + ((ObjectError)e.getAllErrors().get(0)).getDefaultMessage() + "]";
        return CommonResult.failed(message);
    }

    @ExceptionHandler({JsonParseException.class})
    public CommonResult validatedBindException(JsonParseException e) {
        this.logger.error(new ErrorCode(String.valueOf(this.errorCode), this.getMessage(e)), new Object[0]);
        return CommonResult.buildEmptyCommonResult().code(this.errorCode).msg(SystemErrorCodeEnum.JSON_PARSE_EXCEPTION.getMessageWithCode(new Object[0]));
    }

    @ExceptionHandler({MethodArgumentNotValidException.class})
    public CommonResult handleMethodArgumentNotValidException(MethodArgumentNotValidException e) {
        BindingResult bindingResult = e.getBindingResult();
        StringBuilder sb = new StringBuilder("校验失败:");
        Iterator var4 = bindingResult.getFieldErrors().iterator();

        while(var4.hasNext()) {
            FieldError fieldError = (FieldError)var4.next();
            sb.append(fieldError.getField()).append("：").append(fieldError.getDefaultMessage()).append(", ");
        }

        String msg = sb.toString();
        this.logger.error(new ErrorCode(String.valueOf(this.errorCode), this.getMessage(e)), new Object[0]);
        return CommonResult.buildEmptyCommonResult().code(this.errorCode).msg(SystemErrorCodeEnum.VALIDATION_ERROR.getMessageWithCode(new Object[]{msg}));
    }

    @ExceptionHandler({ConstraintViolationException.class})
    public CommonResult handle(ValidationException e) {
        String errorInfo = "";
        ConstraintViolationException exs = (ConstraintViolationException)e;
        Set<ConstraintViolation<?>> violations = exs.getConstraintViolations();

        ConstraintViolation item;
        for(Iterator var5 = violations.iterator(); var5.hasNext(); errorInfo = errorInfo + "[" + item.getMessage() + "]") {
            item = (ConstraintViolation)var5.next();
        }

        this.logger.error(new ErrorCode(String.valueOf(this.errorCode), this.getMessage(e)), new Object[0]);
        return CommonResult.buildEmptyCommonResult().code(this.errorCode).msg(SystemErrorCodeEnum.VALIDATION_ERROR.getMessageWithCode(new Object[]{errorInfo}));
    }

    @ExceptionHandler({SQLException.class})
    public CommonResult handleSQLException(SQLException e) {
        this.logger.error(new ErrorCode(String.valueOf(this.errorCode), this.getMessage(e)), new Object[0]);
        return CommonResult.buildEmptyCommonResult().code(this.errorCode).msg(SystemErrorCodeEnum.SQL_ERROR.getMessageWithCode(new Object[0]));
    }

    @ExceptionHandler({SQLNonTransientConnectionException.class})
    public CommonResult handleMysqlConnectionException(SQLNonTransientConnectionException e) {
        this.logger.error(new ErrorCode(String.valueOf(this.errorCode), this.getMessage(e)), new Object[0]);
        return CommonResult.buildEmptyCommonResult().code(this.errorCode).msg(SystemErrorCodeEnum.MYSQL_CONNECTION_ERROR.getMessageWithCode(new Object[0]));
    }

    @ExceptionHandler({DataAccessException.class})
    public CommonResult handleDataAccessException(DataAccessException e) {
        this.logger.error(new ErrorCode(String.valueOf(this.errorCode), this.getMessage(e)), new Object[0]);
        return CommonResult.buildEmptyCommonResult().code(this.errorCode).msg(SystemErrorCodeEnum.SQL_ERROR.getMessageWithCode(new Object[0]));
    }

    @ExceptionHandler({SQLNonTransientException.class})
    public CommonResult handleSQLNonTransientException(SQLNonTransientException e) {
        this.logger.error(new ErrorCode(String.valueOf(this.errorCode), this.getMessage(e)), new Object[0]);
        return CommonResult.buildEmptyCommonResult().code(this.errorCode).msg(SystemErrorCodeEnum.MYSQL_CONNECTION_ERROR.getMessageWithCode(new Object[0]));
    }

    @ExceptionHandler({SQLSyntaxErrorException.class})
    public CommonResult handleSQLSyntaxErrorException(SQLSyntaxErrorException e) {
        this.logger.error(new ErrorCode(String.valueOf(this.errorCode), this.getMessage(e)), new Object[0]);
        return CommonResult.buildEmptyCommonResult().code(this.errorCode).msg(SystemErrorCodeEnum.SQL_PARSE_EXCEPTION.getMessageWithCode(new Object[0]));
    }

    @ExceptionHandler({HttpMessageConversionException.class})
    public CommonResult handleHttpMessageConversionException(HttpMessageConversionException e) {
        this.logger.error(new ErrorCode(String.valueOf(this.errorCode), this.getMessage(e)), new Object[0]);
        return CommonResult.buildEmptyCommonResult().code(this.errorCode).msg(SystemErrorCodeEnum.ILLEGAL_ARGUMENT.getMessageWithCode(new Object[0]));
    }

    @ExceptionHandler({MaxUploadSizeExceededException.class})
    public CommonResult handleMaxUploadExceedException(MaxUploadSizeExceededException e) {
        this.logger.error(new ErrorCode(String.valueOf(this.errorCode), this.getMessage(e)), new Object[0]);
        return CommonResult.buildEmptyCommonResult().code(this.errorCode).msg(SystemErrorCodeEnum.MAX_UPLOAD_EXCEED_EXCEPTION.getMessageWithCode(new Object[]{e.getMessage()}));
    }

    @ExceptionHandler({IllegalArgumentException.class})
    public CommonResult handleIllegalArgumentException(IllegalArgumentException e) {
        this.logger.error(new ErrorCode(String.valueOf(this.errorCode), this.getMessage(e)), new Object[0]);
        return CommonResult.buildEmptyCommonResult().code(this.errorCode).msg(SystemErrorCodeEnum.ILLEGAL_ARGUMENT.getMessageWithCode(new Object[]{e.getMessage()}));
    }

    @ExceptionHandler({IllegalStateException.class})
    public CommonResult handleConstraintException(IllegalStateException e) {
        this.logger.error(new ErrorCode(String.valueOf(this.errorCode), this.getMessage(e)), new Object[0]);
        return CommonResult.buildEmptyCommonResult().code(this.errorCode).msg(SystemErrorCodeEnum.ILLEGAL_STATEMENT.getMessageWithCode(new Object[0]));
    }

    @ExceptionHandler({HttpRequestMethodNotSupportedException.class})
    public CommonResult handleException(HttpRequestMethodNotSupportedException e) {
        this.logger.error(new ErrorCode(String.valueOf(this.errorCode), this.getMessage(e)), new Object[0]);
        return CommonResult.buildEmptyCommonResult().code(this.errorCode).msg(SystemErrorCodeEnum.UNSUPPORT_REQUEST_TYPE.getMessageWithCode(new Object[0]));
    }

    @ExceptionHandler({BusinessException.class})
    public CommonResult businessException(BusinessException e) {
        this.logger.error(new ErrorCode(e.getCode(), this.getMessage(e)), new Object[0]);
        return CommonResult.buildEmptyCommonResult().code(this.errorCode).msg(e.getMessage());
    }

    @ExceptionHandler({AssertException.class})
    public CommonResult handleAssertException(AssertException e) {
        this.logger.error(new ErrorCode(e.getCode(), this.getMessage(e)), new Object[0]);
        return CommonResult.buildEmptyCommonResult().code(this.errorCode).msg(e.getMessage());
    }

    @ExceptionHandler({Exception.class})
    public CommonResult handleException(Exception e) {
        this.logger.error(new ErrorCode(String.valueOf(this.errorCode), this.getMessage(e)), new Object[0]);
        return CommonResult.buildEmptyCommonResult().code(this.errorCode).msg(e.getMessage());
    }

    @ExceptionHandler({DecodeException.class})
    public CommonResult businessException(DecodeException e) {
        this.logger.error(new ErrorCode(String.valueOf(this.errorCode), this.getMessage(e)), new Object[0]);
        return CommonResult.buildEmptyCommonResult().code(this.errorCode).msg(e.getMessage());
    }

    @ExceptionHandler({NullPointerException.class})
    public CommonResult handleNullPointerException(NullPointerException e) {
        this.logger.error(new ErrorCode(String.valueOf(this.errorCode), this.getMessage(e)), new Object[0]);
        return CommonResult.buildEmptyCommonResult().code(this.errorCode).msg(SystemErrorCodeEnum.NULL_POINTER_EXCEPTION.getMessage(new Object[0]));
    }

    public String getMessage(Exception e) {
        String swStr = null;

        try {
            StringWriter sw = new StringWriter();
            Throwable var4 = null;

            try {
                PrintWriter pw = new PrintWriter(sw);
                Throwable var6 = null;

                try {
                    e.printStackTrace(pw);
                    pw.flush();
                    sw.flush();
                    swStr = sw.toString();
                } catch (Throwable var31) {
                    var6 = var31;
                    throw var31;
                } finally {
                    if (pw != null) {
                        if (var6 != null) {
                            try {
                                pw.close();
                            } catch (Throwable var30) {
                                var6.addSuppressed(var30);
                            }
                        } else {
                            pw.close();
                        }
                    }

                }
            } catch (Throwable var33) {
                var4 = var33;
                throw var33;
            } finally {
                if (sw != null) {
                    if (var4 != null) {
                        try {
                            sw.close();
                        } catch (Throwable var29) {
                            var4.addSuppressed(var29);
                        }
                    } else {
                        sw.close();
                    }
                }

            }
        } catch (IOException var35) {
            var35.printStackTrace();
            this.logger.error(new ErrorCode(String.valueOf(this.errorCode), e.getMessage()), new Object[0]);
        }

        return swStr;
    }
}
