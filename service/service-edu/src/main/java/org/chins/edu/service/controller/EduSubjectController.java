package org.chins.edu.service.controller;


import java.util.List;
import org.chins.edu.common.utils.Result;
import org.chins.edu.service.entity.subject.ParentSubjectVo;
import org.chins.edu.service.service.IEduSubjectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

/**
 * <p>
 * 课程科目 前端控制器
 * </p>
 *
 * @author chins
 * @since 2021-04-04
 */
@RestController
@RequestMapping("/eduservice/edu-subject")
@CrossOrigin
public class EduSubjectController {

  @Autowired
  private IEduSubjectService subjectService;

  @PostMapping("/add-subject")
  public Result addSubject(MultipartFile file) {
    subjectService.saveSubject(file);
    return Result.success();
  }

  @GetMapping("/all-subjects")
  public Result getAllSubjects() {
    List<ParentSubjectVo> allSubjectsTree = subjectService.getAllSubjectsTree();
    return Result.success().data("subjects", allSubjectsTree);
  }
}
