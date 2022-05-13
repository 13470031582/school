package com.zq.school.manage.controller;

import com.zq.school.manage.pojo.bo.StudentBO;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.validation.Valid;

/**
 * zq
 */
@RestController
@RequestMapping("/student")
@Api(tags = "学生模块")
public class StudentController {

    @PostMapping("/add")
    @ApiOperation("新增学生")

    public String add(@Valid @RequestBody StudentBO studentBO){
        return "hello world";
    }
}
