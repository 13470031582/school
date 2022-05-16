package com.zq.school.manage.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.zq.school.es.service.ESStudentService;
import com.zq.school.manage.entity.Student;
import com.zq.school.manage.mapper.StudentMapper;
import com.zq.school.manage.pojo.dto.StudentDTO;
import com.zq.school.manage.service.StudentService;
import com.zq.school.manage.utils.WrapperBeanUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;

@Slf4j
@Service
public class StudentServiceImpl extends ServiceImpl<StudentMapper, Student> implements StudentService {
    @Autowired
    private RedisTemplate redisTemplate;

    @Autowired
    private ESStudentService esStudentService;
    @Override
    public Long addStudent(StudentDTO studentDTO) {
        Student student = WrapperBeanUtil.copyProperties(studentDTO, Student.class);
        student.setCreateBy("daqiaoweijiu");
        student.setModifyBy("daqiaoweijiu");
        student.setCreateTime(LocalDateTime.now());
        student.setModifyTime(LocalDateTime.now());
        this.save(student);
        //保存数据到ES中去
        esStudentService.addStudent(student);
        //把对象存入redis中去，并且存入redis的对象必须实现Serializable接口
        redisTemplate.opsForValue().set("student:" + student.getId(), student);
        Object redisStudent = redisTemplate.opsForValue().get("student:" + student.getId());
        System.out.println("redisStudent--------------"+redisStudent);
        return student.getId();
    }

}
