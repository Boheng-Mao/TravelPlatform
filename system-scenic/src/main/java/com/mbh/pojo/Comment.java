package com.mbh.pojo;

import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

@Data
@TableName("comment")//maps to the comment table
public class Comment {
    private Integer id;
    private Integer scenicId;
    private Integer star;
    private String customer;//reviewer name
    private String cimage;//reviewer avatar path
    private String comment;//review text

    @TableField(fill = FieldFill.INSERT) //auto-filled on insert
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date commentTime;//time of the review

}
