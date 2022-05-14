package com.zq.school.manage.pojo.dto;

import com.fasterxml.jackson.annotation.JsonFormat;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

@ApiModel
@Data
public class StudentDTO {
    @ApiModelProperty(value = "班级id")
    private Long classId;

    @ApiModelProperty(value = "学生姓名")
    private String name;

    @ApiModelProperty(value = "学生年龄")
    private Integer age;
}
