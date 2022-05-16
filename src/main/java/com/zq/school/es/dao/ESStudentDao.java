package com.zq.school.es.dao;

import com.zq.school.es.model.ESStudentModel;
import org.springframework.data.repository.CrudRepository;

import java.util.List;


public interface ESStudentDao extends CrudRepository<ESStudentModel, Long> {

    List<ESStudentModel> findAllByOrderByAge();
}
