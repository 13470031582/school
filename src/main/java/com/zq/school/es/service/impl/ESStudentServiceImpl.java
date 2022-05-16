package com.zq.school.es.service.impl;

import com.zq.school.es.dao.ESStudentDao;
import com.zq.school.es.model.ESStudentModel;
import com.zq.school.es.service.ESStudentService;
import com.zq.school.manage.entity.Student;
import com.zq.school.manage.utils.WrapperBeanUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.data.domain.PageImpl;
import java.util.ArrayList;
import java.util.List;

@Service
public class ESStudentServiceImpl implements ESStudentService {
    @Autowired
    private ESStudentDao esStudentDao;


    @Override
    public List<ESStudentModel> findAllStudent() {
        System.out.println("student count:" + esStudentDao.count());
        if (esStudentDao.count() < 0) {
            return new ArrayList<>();
        }
        List<ESStudentModel> esStudentModels =  esStudentDao.findAllByOrderByAge();

        return esStudentModels;
    }

    @Override
    public void addStudent(Student student) {
        ESStudentModel esStudentModel = WrapperBeanUtil.copyProperties(student, ESStudentModel.class);
        esStudentDao.save(esStudentModel);
    }
}
