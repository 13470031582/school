package com.zq.school.manage.controller;

import com.zq.school.common.exception.controller.ControllerException;
import com.zq.school.manage.common.SchoolErrorCodeEnum;
import com.zq.school.manage.pojo.bo.StudentBO;
import com.zq.school.manage.pojo.dto.StudentDTO;
import com.zq.school.manage.service.StudentService;
import com.zq.school.manage.utils.WrapperBeanUtil;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.cloud.context.config.annotation.RefreshScope;
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
@RefreshScope
public class StudentController {

    @Autowired
    private StudentService studentService;

    @Value("${name:lisi}")
    private String name;

    @PostMapping("/add")
    @ApiOperation("新增学生")
    public Long add(@Valid @RequestBody StudentBO studentBO) {
        StudentDTO studentDTO = WrapperBeanUtil.copyProperties(studentBO, StudentDTO.class);
        if (true) {
            throw new ControllerException(SchoolErrorCodeEnum.SCHOOL_NOT_NULL,"测试");
        }
        Long id = studentService.addStudent(studentDTO);
        return id;
    }
}
