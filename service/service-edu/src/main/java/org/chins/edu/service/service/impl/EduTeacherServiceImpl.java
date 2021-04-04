package org.chins.edu.service.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.chins.edu.service.entity.EduTeacher;
import org.chins.edu.service.entity.vo.TeacherVo;
import org.chins.edu.service.mapper.EduTeacherMapper;
import org.chins.edu.service.service.IEduTeacherService;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

/**
 * <p>
 * 讲师 服务实现类
 * </p>
 *
 * @author chins
 * @since 2021-03-24
 */
@Service
public class EduTeacherServiceImpl extends ServiceImpl<EduTeacherMapper, EduTeacher> implements
    IEduTeacherService {

  @Override
  public Page<EduTeacher> findTeacherByCondition(TeacherVo teacherVo) {
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
    wrapper.orderByDesc("gmt_modified");
    return page(page, wrapper);
  }
}
