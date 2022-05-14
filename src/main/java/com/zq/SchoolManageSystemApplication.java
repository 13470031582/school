package com.zq;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@MapperScan("com.zq.school.manage.mapper")
@SpringBootApplication
public class SchoolManageSystemApplication {

    public static void main(String[] args) {
        SpringApplication.run(SchoolManageSystemApplication.class, args);
        System.out.println("start completed -----------------");
    }

}
