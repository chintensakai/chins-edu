package org.chins.edu.service.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import org.chins.edu.service.entity.EduTeacher;
import org.chins.edu.service.entity.TeacherVo;

/**
 * <p>
 * 讲师 服务类
 * </p>
 *
 * @author chins
 * @since 2021-03-24
 */
public interface IEduTeacherService extends IService<EduTeacher> {

  Page<EduTeacher> findTeacherByCondition(TeacherVo teacherVo);
}
