package com.zq.school.manage.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.zq.school.manage.entity.Student;
import com.zq.school.manage.pojo.dto.StudentDTO;

public interface StudentService extends IService<Student> {
    Long addStudent(StudentDTO studentDTO);
}
