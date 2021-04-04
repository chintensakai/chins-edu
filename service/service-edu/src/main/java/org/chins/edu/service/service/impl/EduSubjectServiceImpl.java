package org.chins.edu.service.service.impl;

import com.alibaba.excel.EasyExcel;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.stream.Collectors;
import org.chins.edu.service.entity.EduSubject;
import org.chins.edu.service.entity.excel.SubjectData;
import org.chins.edu.service.entity.subject.ParentSubjectVo;
import org.chins.edu.service.entity.subject.SubSubjectVo;
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

  @Override
  public List<ParentSubjectVo> getAllSubjectsTree() {
//    一次全查出来，就不用多次查询数据库了
    List<EduSubject> allSubjects = subjectMapper.selectList(null);
    return allSubjects.stream().filter(s -> s.getParentId().equals("0"))
        .map(pSubject ->
            ParentSubjectVo.builder().id(pSubject.getId())
                .label(pSubject.getTitle())
                .children(getSubSubjects(pSubject, allSubjects)).build()

        )
        .collect(Collectors.toList());

  }

  private List<SubSubjectVo> getSubSubjects(EduSubject pVo, List<EduSubject> list) {
    return list.stream().filter(s -> s.getParentId().equals(pVo.getId()))
        .map(sub ->
            SubSubjectVo.builder().id(sub.getId())
                .label(sub.getTitle()).build()
        )
        .collect(Collectors.toList());
  }
}
