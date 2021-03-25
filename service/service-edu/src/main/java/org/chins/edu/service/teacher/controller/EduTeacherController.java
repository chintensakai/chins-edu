package org.chins.edu.service.teacher.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.chins.edu.common.utils.Result;
import org.chins.edu.service.teacher.entity.EduTeacher;
import org.chins.edu.service.teacher.entity.TeacherVo;
import org.chins.edu.service.teacher.service.IEduTeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
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

  //  分页 & 条件查询
  @PostMapping("/find-teacher")
  public Result findTeacher(@RequestBody TeacherVo teacherVo) {
    Page<EduTeacher> page = new Page<>(teacherVo.getCurrent(), teacherVo.getSize());
    QueryWrapper<EduTeacher> wrapper = new QueryWrapper();
    if (!StringUtils.isEmpty(teacherVo.getName())) {
      wrapper.like("name", teacherVo.getName());
    }
    if (!StringUtils.isEmpty(teacherVo.getLevel())) {
      wrapper.eq("level", teacherVo.getLevel());
    }
    if (!StringUtils.isEmpty(teacherVo.getBegin())) {
      wrapper.ge("gmt_create", teacherVo.getBegin());
    }
    if (!StringUtils.isEmpty((teacherVo.getEnd()))) {
      wrapper.le("gmt_create", teacherVo.getEnd());
    }

    Page<EduTeacher> teacherPage = teacherService.page(page, wrapper);
    return Result.success().data("total", teacherPage.getTotal())
        .data("items", teacherPage.getRecords());
  }
}
