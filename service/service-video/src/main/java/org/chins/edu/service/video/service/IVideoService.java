package org.chins.edu.service.video.service;

import org.springframework.web.multipart.MultipartFile;

public interface IVideoService {

  String uploadVideoToOss(MultipartFile file);
}
