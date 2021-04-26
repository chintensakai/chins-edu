package org.chins.edu.service.video.controller;

import org.chins.edu.common.utils.Result;
import org.chins.edu.service.video.service.IVideoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

@RestController
@RequestMapping("/service.video")
@CrossOrigin
public class VideoController {

  @Autowired
  private IVideoService videoService;

  @PostMapping("/upload-video")
  public Result uploadVideo(MultipartFile file) {
    String videoId = videoService.uploadVideoToOss(file);
    return Result.success().data("videoId", videoId);
  }
}
