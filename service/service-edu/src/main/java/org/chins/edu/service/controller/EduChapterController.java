package org.chins.edu.service.controller;


import java.util.List;
import org.chins.edu.common.utils.EduException;
import org.chins.edu.common.utils.Result;
import org.chins.edu.service.entity.EduChapter;
import org.chins.edu.service.entity.course.ChapterVo;
import org.chins.edu.service.service.IEduChapterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
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

  @PostMapping("/chapter")
  public Result addChapter(@RequestBody EduChapter chapter) {
    chapterService.save(chapter);
    return Result.success().data("chapterId", chapter.getId());
  }

  @PutMapping("/chapter")
  public Result updateChapter(@RequestBody EduChapter chapter) {
    chapterService.updateById(chapter);
    return Result.success();
  }

  @DeleteMapping("/chapter/{chapterId}")
  public Result deleteChapter(@PathVariable String chapterId) throws EduException {
    chapterService.removeChapterAndVideoById(chapterId);
    return Result.success();
  }

  @GetMapping("/chapter/{chapterId}")
  public Result getChapterById(@PathVariable String chapterId) throws EduException {
    EduChapter chapter = chapterService.getById(chapterId);
    return Result.success().data("chapter", chapter);
  }
}
