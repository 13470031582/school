package com.zq.school.manage.controller;

import com.zq.school.manage.pojo.bo.StudentBO;
import com.zq.school.manage.pojo.dto.StudentDTO;
import com.zq.school.manage.service.StudentService;
import com.zq.school.manage.utils.WrapperBeanUtil;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
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

    @Autowired
    private StudentService studentService;

    @PostMapping("/add")
    @ApiOperation("新增学生")
    public Long add(@Valid @RequestBody StudentBO studentBO) {
        StudentDTO studentDTO = WrapperBeanUtil.copyProperties(studentBO, StudentDTO.class);
        Long id = studentService.addStudent(studentDTO);
        return id;
    }
}
