package com.chins.edu.service.teacher.controller;


import com.chins.edu.service.teacher.entity.EduTeacher;
import com.chins.edu.service.teacher.service.IEduTeacherService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;

/**
 * <p>
 * 讲师 前端控制器
 * </p>
 *
 * @author chins
 * @since 2021-03-24
 */
@RestController
@RequestMapping("/service.teacher/edu-teacher")
public class EduTeacherController {

  @Autowired
  private IEduTeacherService teacherService;

  @GetMapping("/get-all-teacher")
  public List<EduTeacher> getAllTeacher() {
    return teacherService.list();
  }

  @DeleteMapping("{id}")
  public boolean deleteTeacherById(@PathVariable String id) {
    return teacherService.removeById(id);
  }
}
