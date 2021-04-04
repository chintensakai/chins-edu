package org.chins.edu.service.entity;

import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import java.io.Serializable;
import java.time.LocalDateTime;
import lombok.Builder;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * <p>
 * 课程简介
 * </p>
 *
 * @author chins
 * @since 2021-04-04
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Builder
public class EduCourseDescription implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 课程ID，描述ID就是课程ID，使用手动输入的值，而不是自动生成的
     */
    @TableId(value = "id", type = IdType.INPUT)
    private String id;

    /**
     * 课程简介
     */
    private String description;

    /**
     * 创建时间
     */
    @TableField(fill = FieldFill.INSERT)
    private LocalDateTime gmtCreate;

    /**
     * 更新时间
     */
    @TableField(fill = FieldFill.INSERT_UPDATE)
    private LocalDateTime gmtModified;


}
