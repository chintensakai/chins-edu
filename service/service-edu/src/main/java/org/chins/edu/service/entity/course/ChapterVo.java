package org.chins.edu.service.entity.course;

import java.util.List;
import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class ChapterVo {

  private String id;
  private String courseId;
  private String title;
  private List<VideoVo> videos;
}
