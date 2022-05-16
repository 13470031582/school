package com.zq.school.es.service;

import com.zq.school.es.model.ESStudentModel;
import com.zq.school.manage.entity.Student;

import java.util.List;

public interface ESStudentService {

    List<ESStudentModel> findAllStudent();

    void addStudent(Student student);
}
