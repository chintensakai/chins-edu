package org.chins.edu.service.entity.course;

import java.math.BigDecimal;
import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class CourseInfoVo {

  private String id;
  private String teacherId;
  private String subjectId;
  private String subjectParentId;
  private String title;
  //  课程价格 精确度高一点
  private BigDecimal price;
  private Integer lessonNum;
  private String cover;
  private String description;
}
