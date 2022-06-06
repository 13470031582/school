package com.zq.school.common.log;

import com.zq.school.common.exception.BusinessException;
import com.zq.school.common.exception.IErrorCode;

public interface LogPrint {
    void debug(String var1);

    void debug(String var1, Object... var2);

    void info(String var1);

    void info(String var1, Object... var2);

    void info(IErrorCode var1, Object... var2);

    void warn(IErrorCode var1, Object... var2);

    void warn(BusinessException var1);

    void warn(Throwable var1, IErrorCode var2, Object... var3);

    void error(IErrorCode var1, Object... var2);

    void error(BusinessException var1);

    void error(Throwable var1, IErrorCode var2, Object... var3);
}
