package com.zq.school.common.result;


import com.zq.school.common.enums.Type;

import java.io.Serializable;

public class CommonResult<T> implements Serializable {
    private static final long serialVersionUID = -4696008537295855861L;
    private T data;
    private Integer code;
    private String msg;
    private Long count;
    private Integer success;

    public static <T> CommonResult<T> buildEmptyCommonResult() {
        CommonResult commonResult = new CommonResult();
        commonResult.setCount(0L);
        commonResult.setSuccess(Type.SUCCESS.value);
        return commonResult;
    }

    public static <T> CommonResult<T> succeed() {
        return succeedWith((T)null, Type.SUCCESS.value, "Success!");
    }

    public static <T> CommonResult<T> succeed(String msg) {
        return succeedWith((T)null, Type.SUCCESS.value, msg);
    }

    public static <T> CommonResult<T> succeed(T model, String msg) {
        return succeedWith(model, Type.SUCCESS.value, msg);
    }

    public static <T> CommonResult<T> success(T model) {
        return succeedWith(model, Type.SUCCESS.value, "Success!");
    }

    public static <T> CommonResult<T> succeedWith(T data, Integer code, String msg) {
        return new CommonResult(data, code, msg);
    }

    public static <T> CommonResult<T> failed(String msg) {
        return failedWith((T)null, Type.ERROR.value, msg);
    }

    public static <T> CommonResult<T> failed(T model, String msg) {
        return failedWith(model, Type.ERROR.value, msg);
    }

    public static <T> CommonResult<T> failedWith(T data, Integer code, String msg) {
        return new CommonResult(data, code, msg);
    }

    public static <T> CommonResult<T> fail(T data) {
        return failedWith(data, Type.ERROR.value, "Error!");
    }

    public T getData() {
        return this.data;
    }

    public Integer getCode() {
        return this.code;
    }

    public String getMsg() {
        return this.msg;
    }

    public void setData(final T data) {
        this.data = data;
    }

    public void setCode(final Integer code) {
        this.code = code;
    }

    public CommonResult code(final Integer code) {
        this.code = code;
        return this;
    }

    public CommonResult msg(final String msg) {
        this.msg = msg;
        return this;
    }

    public void setMsg(final String msg) {
        this.msg = msg;
    }

    public boolean isSuccess() {
        return this.getCode().equals(Type.SUCCESS.value);
    }

    public boolean equals(final Object o) {
        if (o == this) {
            return true;
        } else if (!(o instanceof CommonResult)) {
            return false;
        } else {
            CommonResult<?> other = (CommonResult)o;
            if (!other.canEqual(this)) {
                return false;
            } else {
                label42: {
                    Object this$data = this.getData();
                    Object other$data = other.getData();
                    if (this$data == null) {
                        if (other$data == null) {
                            break label42;
                        }
                    } else if (this$data.equals(other$data)) {
                        break label42;
                    }

                    return false;
                }

                Object this$code = this.getCode();
                Object other$code = other.getCode();
                if (this$code == null) {
                    if (other$code != null) {
                        return false;
                    }
                } else if (!this$code.equals(other$code)) {
                    return false;
                }

                Object this$msg = this.getMsg();
                Object other$msg = other.getMsg();
                if (this$msg == null) {
                    if (other$msg != null) {
                        return false;
                    }
                } else if (!this$msg.equals(other$msg)) {
                    return false;
                }

                return true;
            }
        }
    }

    protected boolean canEqual(final Object other) {
        return other instanceof CommonResult;
    }

    public int hashCode() {
        Boolean PRIME = true;
        int result = 1;
        Object $data = this.getData();
        result = result * 59 + ($data == null ? 43 : $data.hashCode());
        Object $code = this.getCode();
        result = result * 59 + ($code == null ? 43 : $code.hashCode());
        Object $msg = this.getMsg();
        result = result * 59 + ($msg == null ? 43 : $msg.hashCode());
        return result;
    }

    public String toString() {
        return "CommonResult(data=" + this.getData() + ", code=" + this.getCode() + ", msg=" + this.getMsg() + ")";
    }

    public CommonResult() {
    }

    public CommonResult(final T data, final Integer code, final String msg) {
        this.data = data;
        this.code = code;
        this.msg = msg;
    }

    public Long getCount() {
        return this.count;
    }

    public Integer getSuccess() {
        return this.success;
    }

    public void setCount(final Long count) {
        this.count = count;
    }

    public void setSuccess(final Integer success) {
        this.success = success;
    }
}

