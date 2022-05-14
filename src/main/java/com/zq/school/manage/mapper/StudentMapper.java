package com.zq.school.manage.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.zq.school.manage.entity.Student;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface StudentMapper extends BaseMapper<Student> {
}
