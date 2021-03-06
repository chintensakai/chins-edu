package org.chins.edu.service.controller;


import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.chins.edu.common.utils.Result;
import org.chins.edu.service.entity.EduTeacher;
import org.chins.edu.service.entity.vo.TeacherVo;
import org.chins.edu.service.service.IEduTeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
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
@RequestMapping("/eduservice/edu-teacher")
public class EduTeacherController {

  @Autowired
  private IEduTeacherService teacherService;

  @GetMapping("/get-all-teacher-page/{current}/{size}")
  public Result getAllTeacher(@PathVariable int current, @PathVariable int size) {
    if (current == 0 && size == 0) {
      return Result.success().data("items", teacherService.list());
    }
    TeacherVo teacherVo = new TeacherVo();
    teacherVo.setSize(size);
    teacherVo.setCurrent(current);
    return Result.success().data("items", teacherService.findTeacherByCondition(teacherVo));
  }

  @DeleteMapping("/{id}")
  public Result deleteTeacherById(@PathVariable String id) {
    boolean remove = teacherService.removeById(id);
    return remove ? Result.success().success(remove) : Result.error().success(remove);
  }

  //  分页 & 条件查询
  @PostMapping("/find-teacher")
  public Result findTeacher(@RequestBody TeacherVo teacherVo) {

    Page<EduTeacher> teacherByCondition = teacherService.findTeacherByCondition(teacherVo);
    return Result.success().data("total", teacherByCondition.getTotal())
        .data("items", teacherByCondition.getRecords());
  }

  @PostMapping("/add-teacher")
  public Result addTeacher(@RequestBody EduTeacher teacher) {
    boolean save = teacherService.save(teacher);
    return save ? Result.success().success(Boolean.TRUE) : Result.error().success(Boolean.FALSE);
  }

  @GetMapping("/teacher/{id}")
  public Result getTeacherById(@PathVariable String id) {
    EduTeacher teacher = teacherService.getById(id);
    return Result.success().success(Boolean.TRUE).data("teacher", teacher);
  }

  @PutMapping("/teacher/{id}")
  public Result updateTeacher(@PathVariable String id, @RequestBody EduTeacher teacher) {
    teacher.setId(id);
    boolean b = teacherService.updateById(teacher);
    return b ? Result.success().success(Boolean.TRUE) : Result.error().success(Boolean.FALSE);
  }
}
