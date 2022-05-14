package com.zq.school.manage.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.time.LocalDateTime;

@Data
@TableName("student")
@ApiModel("产品类目表")
public class Student {
    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.ASSIGN_ID)
    @JsonFormat(shape = JsonFormat.Shape.NUMBER_INT)
    @ApiModelProperty(value = "学生id")
    private Long Id;

    @JsonFormat(shape = JsonFormat.Shape.NUMBER_INT)
    @ApiModelProperty(value = "班级id")
    private Long classId;

    @ApiModelProperty(value = "学生姓名")
    private String name;

    @ApiModelProperty(value = "学生年龄")
    private Integer age;

    @ApiModelProperty(value = "是否刪除：0-未刪除；1-刪除")
    private Integer delFlag;

    @ApiModelProperty(value = "创建时间")
    @JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd HH:mm:ss")
    @DateTimeFormat(pattern = "yyyy-MM-DD hh:mm:ss")
    private LocalDateTime createTime;

    @ApiModelProperty(value = "创建人id")
    private String createBy;

    @ApiModelProperty(value = "最新修改时间")
    @JsonFormat(shape= JsonFormat.Shape.STRING, pattern="yyyy-MM-dd HH:mm:ss")
    @DateTimeFormat(pattern = "yyyy-MM-DD hh:mm:ss")
    private LocalDateTime modifyTime;

    @ApiModelProperty(value = "修改人id")
    private String modifyBy;
}
