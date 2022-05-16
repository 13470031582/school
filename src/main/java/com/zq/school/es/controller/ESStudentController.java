package com.zq.school.es.controller;

import com.zq.school.es.model.ESStudentModel;
import com.zq.school.es.service.ESStudentService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@Api(tags = "es列表查询")
@RequestMapping("/es/student")
public class ESStudentController {
    @Autowired
    private ESStudentService esStudentService;

    @GetMapping("findAllCategoryDoucment")
    @ApiOperation("查询类目与文档")
    //@PreAuthorize("hasAuthority('xaas-knowledge/product:es:findAllCategoryDoucment')")
    public List<ESStudentModel> findAllCategory() {
        return esStudentService.findAllStudent();

    }
}
