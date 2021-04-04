package org.chins.edu.service.entity.excel;

import com.alibaba.excel.annotation.ExcelProperty;
import lombok.Data;

/***
 * excel表对应实体类
 */
@Data
public class SubjectData {

  @ExcelProperty(index = 0)
  private String parentName;
  @ExcelProperty(index = 1)
  private String subName;
}
