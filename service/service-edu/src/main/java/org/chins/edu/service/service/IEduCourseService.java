package org.chins.edu.service.service;

import com.baomidou.mybatisplus.extension.service.IService;
import org.chins.edu.service.entity.EduCourse;
import org.chins.edu.service.entity.vo.CourseInfoVo;

/**
 * <p>
 * 课程 服务类
 * </p>
 *
 * @author chins
 * @since 2021-04-04
 */
public interface IEduCourseService extends IService<EduCourse> {

  void saveCourse(CourseInfoVo infoVo);
}
