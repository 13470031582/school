package com.zq.school.manage.pojo.bo;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.ToString;

import javax.validation.constraints.NotBlank;
import java.io.Serializable;

@Data
@ToString
@ApiModel("添加产品类目请求类")
public class StudentBO implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "班级ID")
    private Long classId;

    @ApiModelProperty(value = "学生姓名")
    @NotBlank(message = "学生姓名不能为空")
    private String name;

    @ApiModelProperty(value = "文档上传文件id")
    private Integer age;


}
