package com.zq.school.manage.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.zq.school.manage.entity.Student;
import com.zq.school.manage.mapper.StudentMapper;
import com.zq.school.manage.pojo.dto.StudentDTO;
import com.zq.school.manage.service.StudentService;
import com.zq.school.manage.utils.WrapperBeanUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;

@Slf4j
@Service
public class StudentServiceImpl extends ServiceImpl<StudentMapper, Student> implements StudentService {


    @Override
    public Long addStudent(StudentDTO studentDTO) {
        Student student = WrapperBeanUtil.copyProperties(studentDTO, Student.class);
        student.setCreateBy("daqiaoweijiu");
        student.setModifyBy("daqiaoweijiu");
        student.setCreateTime(LocalDateTime.now());
        student.setModifyTime(LocalDateTime.now());
        this.save(student);
        return student.getId();
    }

}
