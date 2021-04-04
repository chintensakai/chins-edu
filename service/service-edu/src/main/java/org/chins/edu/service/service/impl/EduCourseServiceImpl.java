package org.chins.edu.service.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.SneakyThrows;
import org.chins.edu.service.entity.EduCourse;
import org.chins.edu.service.entity.EduCourseDescription;
import org.chins.edu.service.entity.vo.CourseInfoVo;
import org.chins.edu.service.mapper.EduCourseDescriptionMapper;
import org.chins.edu.service.mapper.EduCourseMapper;
import org.chins.edu.service.service.IEduCourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 课程 服务实现类
 * </p>
 *
 * @author chins
 * @since 2021-04-04
 */
@Service
public class EduCourseServiceImpl extends ServiceImpl<EduCourseMapper, EduCourse> implements
    IEduCourseService {

  @Autowired
  private EduCourseMapper courseMapper;

  @Autowired
  private EduCourseDescriptionMapper courseDescriptionMapper;

  @SneakyThrows
  @Override
  public void saveCourse(CourseInfoVo infoVo) {
//    1. 课程表添加课程
//    可以使用BeanUtils.copyProperties();
    EduCourse eduCourse = EduCourse.builder().id(infoVo.getId())
        .cover(infoVo.getCover())
        .lessonNum(infoVo.getLessonNum())
        .price(infoVo.getPrice())
        .title(infoVo.getTitle())
        .subjectId(infoVo.getSubjectId())
        .teacherId(infoVo.getTeacherId()).build();
    int insert = courseMapper.insert(eduCourse);

    if (insert <= 0) {
      throw new Exception("add course error.");
    }

//    2. 课程简介表添加简介，描述的id就是课程的id
    courseDescriptionMapper
        .insert(EduCourseDescription.builder()
            .id(eduCourse.getId()).description(infoVo.getDescription()).build());
  }
}
