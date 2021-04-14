package org.chins.edu.service.service;

import com.baomidou.mybatisplus.extension.service.IService;
import java.util.List;
import org.chins.edu.common.utils.EduException;
import org.chins.edu.service.entity.EduChapter;
import org.chins.edu.service.entity.course.ChapterVo;

/**
 * <p>
 * 课程 服务类
 * </p>
 *
 * @author chins
 * @since 2021-04-04
 */
public interface IEduChapterService extends IService<EduChapter> {

  List<ChapterVo> getCourseChapters(String courseId);

  void removeChapterAndVideoById(String chapterId) throws EduException;
}
