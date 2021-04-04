package org.chins.edu.service.service;

import com.baomidou.mybatisplus.extension.service.IService;
import java.util.List;
import org.chins.edu.service.entity.EduSubject;
import org.chins.edu.service.entity.subject.ParentSubjectVo;
import org.springframework.web.multipart.MultipartFile;

/**
 * <p>
 * 课程科目 服务类
 * </p>
 *
 * @author chins
 * @since 2021-04-04
 */
public interface IEduSubjectService extends IService<EduSubject> {

  void saveSubject(MultipartFile file);

  List<ParentSubjectVo> getAllSubjectsTree();
}
