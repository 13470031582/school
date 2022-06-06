package com.zq.school.common.enums;

public enum Type {
    SUCCESS(0),
    ERROR(1);

    public final Integer value;

    private Type(int value) {
        this.value = value;
    }

    public int value() {
        return this.value;
    }
}
