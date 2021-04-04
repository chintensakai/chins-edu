package org.chins.edu.service.service.impl;

import com.alibaba.excel.EasyExcel;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import java.io.IOException;
import java.io.InputStream;
import org.chins.edu.service.entity.EduSubject;
import org.chins.edu.service.entity.excel.SubjectData;
import org.chins.edu.service.mapper.EduSubjectMapper;
import org.chins.edu.service.service.IEduSubjectService;
import org.chins.edu.service.service.excel.SubjectExcelDataReadListener;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

/**
 * <p>
 * 课程科目 服务实现类
 * </p>
 *
 * @author chins
 * @since 2021-04-04
 */
@Service
public class EduSubjectServiceImpl extends ServiceImpl<EduSubjectMapper, EduSubject> implements
    IEduSubjectService {

  @Autowired
  private EduSubjectMapper subjectMapper;

  @Override
  public void saveSubject(MultipartFile file) {
    try {
      InputStream inputStream = file.getInputStream();
      EasyExcel
          .read(inputStream, SubjectData.class, new SubjectExcelDataReadListener(subjectMapper))
          .sheet()
          .doRead();
    } catch (IOException e) {
      e.printStackTrace();
    }
  }
}
