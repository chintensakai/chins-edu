package org.chins.edu.service.controller;


import org.chins.edu.common.utils.Result;
import org.chins.edu.service.entity.vo.CourseInfoVo;
import org.chins.edu.service.service.IEduCourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * <p>
 * 课程 前端控制器
 * </p>
 *
 * @author chins
 * @since 2021-04-04
 */
@RestController
@RequestMapping("/service.course/edu-course")
public class EduCourseController {

  @Autowired
  private IEduCourseService courseService;

  @PostMapping("/add-course")
  public Result addCourse(@RequestBody CourseInfoVo infoVo) {
    courseService.saveCourse(infoVo);
    return Result.success();
  }
}
