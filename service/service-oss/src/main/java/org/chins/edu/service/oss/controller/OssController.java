package org.chins.edu.service.oss.controller;

import org.chins.edu.common.utils.Result;
import org.chins.edu.service.oss.service.OssService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

@RestController
@RequestMapping("/service.oss")
@CrossOrigin
public class OssController {

  @Autowired
  private OssService ossService;

  @PostMapping("/upload-file")
  public Result uploadFile(MultipartFile file) {
    String url = ossService.uploadFileToBucket(file);
    return Result.success().data("url", url);
  }
}
