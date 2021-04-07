package org.chins.edu.service.controller;


import java.util.List;
import org.chins.edu.common.utils.Result;
import org.chins.edu.service.entity.course.ChapterVo;
import org.chins.edu.service.service.IEduChapterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * <p>
 * 课程 前端控制器
 * </p>
 *
 * @author chins
 * @since 2021-04-04
 */
@RestController
@RequestMapping("/service.chapter/edu-chapter")
@CrossOrigin
public class EduChapterController {

  @Autowired
  private IEduChapterService chapterService;

  @GetMapping("/get-course-chapters/{courseId}")
  public Result getCourseChapters(@PathVariable String courseId) {
    List<ChapterVo> chapters = chapterService.getCourseChapters(courseId);
    return Result.success().data("chapters", chapters);
  }
}
