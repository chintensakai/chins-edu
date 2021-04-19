package org.chins.edu.service.entity.course;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class CoursePublishVo {

  private String id;
  private String title;
  private String cover;
  private String description;
  private Integer lessonNum;
  private String parentSubjectName;
  private String subSubjectName;
  private String teacherName;
  private String price;  // 只用于展示
}
