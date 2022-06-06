package com.zq.school.common.log;

import org.slf4j.LoggerFactory;

public class LogPrintFactory {
    public LogPrintFactory() {
    }

    public static LogPrint getLogger(Class<?> clazz) {
        return new LogPrintImpl(LoggerFactory.getLogger(clazz));
    }
}
