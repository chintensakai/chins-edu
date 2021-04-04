package org.chins.edu.service.entity;

import lombok.Data;

@Data
public class TeacherVo {

  private String name;
  private Integer level;
  private String begin;
  private String end;
  private Integer current = 1;
  private Integer size = 10;
}
