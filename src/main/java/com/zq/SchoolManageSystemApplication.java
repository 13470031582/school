package com.zq;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.data.elasticsearch.repository.config.EnableElasticsearchRepositories;

@MapperScan("com.zq.school.manage.mapper")
@EnableElasticsearchRepositories(basePackages = "com.zq.school.es.dao")
@SpringBootApplication
public class SchoolManageSystemApplication {

    public static void main(String[] args) {
        SpringApplication.run(SchoolManageSystemApplication.class, args);
        System.out.println("start completed -----------------");
    }

}
