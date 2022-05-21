package com.zq;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.data.elasticsearch.repository.config.EnableElasticsearchRepositories;

import java.util.Date;

@MapperScan("com.zq.school.manage.mapper")
@EnableElasticsearchRepositories(basePackages = "com.zq.school.es.dao")
@EnableDiscoveryClient
@SpringBootApplication
public class SchoolManageSystemApplication {

    public static void main(String[] args) {
        try {
            SpringApplication.run(SchoolManageSystemApplication.class, args);
            System.out.println("---   项目  启动成功---" + "version1.0.0        => " + new Date());
        } catch (Throwable e) {
            //异常级别越大越好，我之前测试的时候，用的是Exception，但是没有日志。
            e.printStackTrace();
        }

/*        SpringApplication.run(SchoolManageSystemApplication.class, args);
        System.out.println("start completed -----------------");*/
    }

}
