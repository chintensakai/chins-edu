package org.chins.edu.service.entity.subject;

import java.util.List;
import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class ParentSubjectVo {

  private String id;
  private String label;
  private List<SubSubjectVo> children;
}
