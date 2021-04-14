package org.chins.edu.service.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.SneakyThrows;
import org.chins.edu.service.entity.EduCourse;
import org.chins.edu.service.entity.EduCourseDescription;
import org.chins.edu.service.entity.course.CourseInfoVo;
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
  public String saveCourse(CourseInfoVo infoVo) {
//    1. 课程表添加课程
//    可以使用BeanUtils.copyProperties();
    EduCourse eduCourse = EduCourse.builder().id(infoVo.getId())
        .cover(infoVo.getCover())
        .lessonNum(infoVo.getLessonNum())
        .price(infoVo.getPrice())
        .title(infoVo.getTitle())
        .subjectId(infoVo.getSubjectId())
        .subjectParentId(infoVo.getSubjectParentId())
        .teacherId(infoVo.getTeacherId()).build();
    int insert = courseMapper.insert(eduCourse);

    if (insert <= 0) {
      throw new Exception("add course error.");
    }

//    2. 课程简介表添加简介，描述的id就是课程的id
    courseDescriptionMapper
        .insert(EduCourseDescription.builder()
            .id(eduCourse.getId()).description(infoVo.getDescription()).build());
    return eduCourse.getId();

//    to-do 回滚机制
  }

  @Override
  public CourseInfoVo getCourseInfoById(String courseId) {
    EduCourse course = courseMapper.selectById(courseId);
//    description和course是同一个id
    EduCourseDescription description = courseDescriptionMapper.selectById(courseId);
    return CourseInfoVo.builder().id(courseId).cover(course.getCover())
        .description(description.getDescription())
        .lessonNum(course.getLessonNum())
        .subjectId(course.getSubjectId())
        .price(course.getPrice())
        .title(course.getTitle())
        .teacherId(course.getTeacherId())
        .subjectParentId(course.getSubjectParentId()).build();
  }

  @Override
  public void updateCourseInfo(CourseInfoVo courseInfoVo) {
//    使用beanutils好像更方便
    courseMapper.updateById(EduCourse.builder().id(courseInfoVo.getId())
        .cover(courseInfoVo.getCover())
        .lessonNum(courseInfoVo.getLessonNum())
        .price(courseInfoVo.getPrice())
        .title(courseInfoVo.getTitle())
        .subjectId(courseInfoVo.getSubjectId())
        .teacherId(courseInfoVo.getTeacherId())
        .subjectParentId(courseInfoVo.getSubjectParentId()).build());

    courseDescriptionMapper.updateById(EduCourseDescription.builder().id(courseInfoVo.getId())
        .description(courseInfoVo.getDescription()).build());
  }
}
