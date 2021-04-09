package org.chins.edu.service.service;

import com.baomidou.mybatisplus.extension.service.IService;
import org.chins.edu.service.entity.EduCourse;
import org.chins.edu.service.entity.course.CourseInfoVo;

/**
 * <p>
 * 课程 服务类
 * </p>
 *
 * @author chins
 * @since 2021-04-04
 */
public interface IEduCourseService extends IService<EduCourse> {

  String saveCourse(CourseInfoVo infoVo);

  CourseInfoVo getCourseInfoById(String courseId);

  void updateCourseInfo(CourseInfoVo courseInfoVo);
}
