package com.zq.school.es.model;

import com.fasterxml.jackson.annotation.JsonFormat;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import org.springframework.data.elasticsearch.annotations.Document;
import org.springframework.data.annotation.Id;

import java.io.Serializable;

@Data
//通过这个注解可以声明一个文档，指定其所在的索引库和type
@Document(indexName = "student")
public class ESStudentModel implements Serializable {
    private static final long serialVersionUID = 1L;

    // 必须指定一个id，
    @Id
    @ApiModelProperty(value = "学生id")
    private Long Id;

    @JsonFormat(shape = JsonFormat.Shape.NUMBER_INT)
    @ApiModelProperty(value = "班级id")
    private Long classId;

    @ApiModelProperty(value = "学生姓名")
    private String name;

    @ApiModelProperty(value = "学生年龄")
    private Integer age;

}
