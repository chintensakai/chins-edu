package org.chins.edu.service.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import java.util.List;
import java.util.stream.Collectors;
import org.chins.edu.service.entity.EduChapter;
import org.chins.edu.service.entity.EduVideo;
import org.chins.edu.service.entity.course.ChapterVo;
import org.chins.edu.service.entity.course.VideoVo;
import org.chins.edu.service.mapper.EduChapterMapper;
import org.chins.edu.service.mapper.EduVideoMapper;
import org.chins.edu.service.service.IEduChapterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 课程 服务实现类
 * </p>
 *
 * @author chins
 * @since 2021-04-04
 */
@Service
public class EduChapterServiceImpl extends ServiceImpl<EduChapterMapper, EduChapter> implements
    IEduChapterService {

  @Autowired
  private EduChapterMapper chapterMapper;

  @Autowired
  private EduVideoMapper videoMapper;

  @Override
  public List<ChapterVo> getCourseChapters(String courseId) {
    QueryWrapper<EduChapter> wrapper = new QueryWrapper();
    wrapper.eq("course_id", courseId);
    List<EduChapter> chapters = chapterMapper.selectList(wrapper);

    return chapters.stream().map(c ->
        ChapterVo.builder().id(c.getId()).courseId(c.getCourseId())
            .title(c.getTitle())
            .videos(getChapterVideos(c.getId(), c.getCourseId())).build()
    ).collect(Collectors.toList());
  }

  private List<VideoVo> getChapterVideos(String chapterId, String courseId) {
    QueryWrapper<EduVideo> videoWrapper = new QueryWrapper<>();
    videoWrapper.eq("course_id", courseId);
    List<EduVideo> eduVideos = videoMapper.selectList(videoWrapper);
    return eduVideos.stream().filter(e -> e.getChapterId().equals(chapterId))
        .map(v -> VideoVo.builder().id(v.getId()).title(v.getTitle()).build())
        .collect(Collectors.toList());
  }
}
