package org.chins.edu.service.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.chins.edu.service.entity.EduCourse;
import org.chins.edu.service.entity.course.CoursePublishVo;

/**
 * <p>
 * 课程 Mapper 接口
 * </p>
 *
 * @author chins
 * @since 2021-04-04
 */
public interface EduCourseMapper extends BaseMapper<EduCourse> {

  CoursePublishVo getPublishCourseInfo(String courseId);
}
