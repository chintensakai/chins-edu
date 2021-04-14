package org.chins.edu.service.controller;


import org.chins.edu.common.utils.Result;
import org.chins.edu.service.entity.course.CourseInfoVo;
import org.chins.edu.service.service.IEduCourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
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
@CrossOrigin
public class EduCourseController {

  @Autowired
  private IEduCourseService courseService;

  @PostMapping("/add-course")
  public Result addCourse(@RequestBody CourseInfoVo infoVo) {
    String courseId = courseService.saveCourse(infoVo);
    return Result.success().data("courseId", courseId);
  }

  @GetMapping("/get-course-info/{courseId}")
  public Result getCourseInfo(@PathVariable String courseId) {
    CourseInfoVo courseInfo = courseService.getCourseInfoById(courseId);
    return Result.success().data("courseInfo", courseInfo);
  }

  @PutMapping("/update-course-info")
  public Result updateCourseInfo(@RequestBody CourseInfoVo courseInfoVo) {
    courseService.updateCourseInfo(courseInfoVo);
    return Result.success();
  }

}
