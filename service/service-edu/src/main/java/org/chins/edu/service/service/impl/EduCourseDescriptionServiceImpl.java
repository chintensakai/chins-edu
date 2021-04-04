package org.chins.edu.service.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.chins.edu.service.entity.EduCourseDescription;
import org.chins.edu.service.mapper.EduCourseDescriptionMapper;
import org.chins.edu.service.service.IEduCourseDescriptionService;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 课程简介 服务实现类
 * </p>
 *
 * @author chins
 * @since 2021-04-04
 */
@Service
public class EduCourseDescriptionServiceImpl extends
    ServiceImpl<EduCourseDescriptionMapper, EduCourseDescription> implements
    IEduCourseDescriptionService {

}
