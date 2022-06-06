package com.zq.school.common.enums;


import com.zq.school.common.exception.ErrorCode;
import com.zq.school.common.exception.IErrorCode;

public enum SystemErrorCodeEnum implements IErrorCode {
    UNKNOW_EXCEPTION("100001", "未知错误"),
    CODE_ERROR("100002", "错误码{0}非法:错误码必须为6位"),
    CODE_EMPTY("100003", "错误码不能为空"),
    UNSUPPORT_REQUEST_TYPE("100004", "请求方式:{0}不支持"),
    SQL_ERROR("100005", "数据库错误"),
    VALIDATION_ERROR("100006", "参数校验错误:{0}"),
    BIZ_ID_NOT_EMPTY("100021", "业务id不能为空"),
    ILLEGAL_ARGUMENT("100023", "非法参数异常:{0}"),
    ILLEGAL_STATEMENT("100024", "无效状态异常:{0}"),
    MYSQL_CONNECTION_ERROR("100027", "数据库连接异常"),
    ELASTIC_PARSE_ERROR("100028", "es解析错误"),
    JSON_PARSE_EXCEPTION("100029", "json解析异常"),
    REPEATED_REQUEST_EXCEPTION("100030", "重复请求"),
    SQL_PARSE_EXCEPTION("100031", "数据库语法错误"),
    MAX_UPLOAD_EXCEED_EXCEPTION("100032", "上传文件超过限制"),
    NULL_POINTER_EXCEPTION("100033", "空指针异常"),
    ASSERT_ILLEGAL_ARGUMENT("100034", "断言参数异常"),
    INTERNAL_SERVER_ERROR("100035", "服务内部错误"),
    CLIENT_LOAD_BALANCER_EXCEPTION("100036", "客户端连接异常"),
    DATA_PARSE_ERROR("100037", "数据转换失败");

    private final ErrorCode errorCode;

    private SystemErrorCodeEnum(String code, String message) {
        this.errorCode = new ErrorCode(code, message);
    }

    public String getCode() {
        return this.errorCode.getCode();
    }

    public String getMessage(Object... params) {
        return this.errorCode.getMessage(params);
    }

    public String getMessageWithCode(Object... params) {
        return this.errorCode.getMessageWithCode(params);
    }
}

