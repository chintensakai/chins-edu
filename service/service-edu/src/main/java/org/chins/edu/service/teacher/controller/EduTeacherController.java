package org.chins.edu.service.teacher.controller;


import org.chins.edu.common.utils.Result;
import org.chins.edu.service.teacher.entity.EduTeacher;
import org.chins.edu.service.teacher.service.IEduTeacherService;
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
  public Result getAllTeacher() {
    return Result.success().data("items", teacherService.list());
  }

  @DeleteMapping("{id}")
  public Result deleteTeacherById(@PathVariable String id) {
    boolean remove = teacherService.removeById(id);
    return remove ? Result.success().success(remove) : Result.error().success(remove);
  }
}
