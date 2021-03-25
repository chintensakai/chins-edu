package org.chins.edu.service.teacher.entity;

import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableLogic;
import java.io.Serializable;
import java.time.LocalDateTime;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * <p>
 * 讲师
 * </p>
 *
 * @author chins
 * @since 2021-03-24
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class EduTeacher implements Serializable {

  private static final long serialVersionUID = 1L;

  /**
   * 讲师ID
   */
  @TableId(value = "id", type = IdType.ASSIGN_ID)
  private String id;

  /**
   * 讲师姓名
   */
  private String name;

  /**
   * 讲师简介
   */
  private String intro;

  /**
   * 讲师资历,一句话说明讲师
   */
  private String career;

  /**
   * 头衔 1高级讲师 2首席讲师
   */
  private Integer level;

  /**
   * 讲师头像
   */
  private String avatar;

  /**
   * 排序
   */
  private Integer sort;

  /**
   * 逻辑删除 1（true）已删除， 0（false）未删除
   */
  @TableLogic
  private Integer isDeleted;

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
