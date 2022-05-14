package com.zq.school.manage.utils;

import com.esotericsoftware.reflectasm.ConstructorAccess;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.cglib.beans.BeanCopier;
import org.springframework.cglib.core.Converter;

public class WrapperBeanUtil {
    private static final Map<String, BeanCopier> BEAN_COPIER_CACHE = new ConcurrentHashMap();
    private static final Map<String, ConstructorAccess> CONSTRUCTOR_ACCESS_CACHE = new ConcurrentHashMap();

    private WrapperBeanUtil() {
    }

    public static void copyProperties(Object source, Object target) {
        BeanCopier copier = getBeanCopier(source.getClass(), target.getClass());
        copier.copy(source, target, (Converter)null);
    }

    private static BeanCopier getBeanCopier(Class sourceClass, Class targetClass) {
        String beanKey = generateKey(sourceClass, targetClass);
        BeanCopier copier = null;
        if (!BEAN_COPIER_CACHE.containsKey(beanKey)) {
            copier = BeanCopier.create(sourceClass, targetClass, false);
            BEAN_COPIER_CACHE.put(beanKey, copier);
        } else {
            copier = (BeanCopier)BEAN_COPIER_CACHE.get(beanKey);
        }

        return copier;
    }

    private static String generateKey(Class<?> sourceClass, Class<?> targetClass) {
        return sourceClass.getName() + targetClass.getName();
    }

    public static <T> T copyProperties(Object source, Class<T> targetClass) {
        Object t = null;

        try {
            t = targetClass.newInstance();
        } catch (IllegalAccessException | InstantiationException var4) {
            throw new RuntimeException(String.format("Create new instance of %s failed: %s", targetClass, var4.getMessage()));
        }

        copyProperties(source, t);
        return (T) t;
    }

    public static <T> List<T> copyPropertiesOfList(List<?> sourceList, Class<T> targetClass) {
        if (sourceList != null && !sourceList.isEmpty()) {
            ConstructorAccess<T> constructorAccess = getConstructorAccess(targetClass);
            List<T> resultList = new ArrayList(sourceList.size());
            Iterator var4 = sourceList.iterator();

            while(var4.hasNext()) {
                Object o = var4.next();
                Object t = null;

                try {
                    t = constructorAccess.newInstance();
                    copyProperties(o, t);
                    resultList.add((T) t);
                } catch (Exception var8) {
                    throw new RuntimeException(var8);
                }
            }

            return resultList;
        } else {
            return Collections.emptyList();
        }
    }

    private static <T> ConstructorAccess<T> getConstructorAccess(Class<T> targetClass) {
        ConstructorAccess<T> constructorAccess = (ConstructorAccess)CONSTRUCTOR_ACCESS_CACHE.get(targetClass.getName());
        if (constructorAccess != null) {
            return constructorAccess;
        } else {
            try {
                constructorAccess = ConstructorAccess.get(targetClass);
                constructorAccess.newInstance();
                CONSTRUCTOR_ACCESS_CACHE.put(targetClass.toString(), constructorAccess);
                return constructorAccess;
            } catch (Exception var3) {
                throw new RuntimeException(String.format("Create new instance of %s failed: %s", targetClass, var3.getMessage()));
            }
        }
    }
}

