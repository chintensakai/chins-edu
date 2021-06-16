package org.chins.edu.service.controller;


import org.chins.edu.common.utils.Result;
import org.chins.edu.service.entity.EduVideo;
import org.chins.edu.service.service.IEduVideoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * <p>
 * 课程视频 前端控制器
 * </p>
 *
 * @author chins
 * @since 2021-04-04
 */
@RestController
@RequestMapping("/eduservice/edu-video")
public class EduVideoController {

  @Autowired
  private IEduVideoService videoService;

  @PostMapping("/video")
  public Result addVideo(@RequestBody EduVideo video) {
    videoService.save(video);
    return Result.success().data("videoId", video.getId());
  }

  @DeleteMapping("/video/{videoId}")
  public Result deleteVideo(@PathVariable String videoId) {
//    同时要删除oss上的视频
    videoService.removeById(videoId);
    return Result.success();
  }

  @PutMapping("/video")
  public Result updateVideo(@RequestBody EduVideo video) {
    videoService.updateById(video);
    return Result.success();
  }
}
