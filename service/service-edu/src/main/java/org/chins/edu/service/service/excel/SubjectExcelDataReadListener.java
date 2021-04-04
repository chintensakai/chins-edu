package org.chins.edu.service.service.excel;

import com.alibaba.excel.context.AnalysisContext;
import com.alibaba.excel.event.AnalysisEventListener;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import lombok.SneakyThrows;
import org.chins.edu.service.entity.EduSubject;
import org.chins.edu.service.entity.excel.SubjectData;
import org.chins.edu.service.mapper.EduSubjectMapper;

/***
 * 监听器不能被Spring管理，使用Spring的bean要用构造方法注入
 */
public class SubjectExcelDataReadListener extends AnalysisEventListener<SubjectData> {

  private EduSubjectMapper subjectMapper;

  public SubjectExcelDataReadListener(EduSubjectMapper subjectMapper) {
    this.subjectMapper = subjectMapper;
  }

  @SneakyThrows
  @Override
  public void invoke(SubjectData data, AnalysisContext analysisContext) {
    if (data == null) {
      throw new Exception("excel has no data.");
    }
    EduSubject parentSubject = existParentName(data.getParentName());
    if (null == parentSubject) {
//            入库
      parentSubject = new EduSubject();
      parentSubject.setTitle(data.getParentName());
      parentSubject.setParentId("0");
      subjectMapper.insert(parentSubject);
    }

    EduSubject subject = existSubName(data.getSubName(), parentSubject.getId());
    if (null == subject) {
//            入库
      subject = new EduSubject();
      subject.setParentId(parentSubject.getId());
      subject.setTitle(data.getSubName());
      subjectMapper.insert(subject);
    }
  }

  @Override
  public void doAfterAllAnalysed(AnalysisContext analysisContext) {
  }

  /***
   * 判断一级分类是否存在
   *
   * @param name
   * @return
   */
  private EduSubject existParentName(String name) {
    QueryWrapper wrapper = new QueryWrapper();
    wrapper.eq("title", name);
    wrapper.eq("parent_id", "0");
    return subjectMapper.selectOne(wrapper);
  }

  /***
   * 判断二级分类是否存在
   *
   * @param name
   * @return
   */
  private EduSubject existSubName(String name, String parentId) {
    QueryWrapper wrapper = new QueryWrapper();
    wrapper.eq("title", name);
    wrapper.eq("parent_id", parentId);
    return subjectMapper.selectOne(wrapper);
  }
}
