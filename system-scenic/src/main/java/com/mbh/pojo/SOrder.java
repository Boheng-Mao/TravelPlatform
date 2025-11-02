package com.mbh.pojo;

import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

@Data
@TableName("s_order")
public class SOrder {
    @TableId
    private Integer id;
    private Integer cid;
    private Integer sid;
    private Integer count;
    private Double total;
    @TableField(fill = FieldFill.INSERT) //auto-filled on insert
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date startTime;
    @TableField(fill = FieldFill.INSERT) //auto-filled on insert
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date endTime;

    @TableField(exist = false)
    private Customer customer;
    @TableField(exist = false)
    private Scenic scenic;

    private Integer status;

    @TableField(exist = false)
    private String totalMoney;
    @TableField(exist = false)
    private String scenicId;
}
