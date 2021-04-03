package org.chins.edu.service.oss.service;

import org.springframework.web.multipart.MultipartFile;

public interface OssService {

  String uploadFileToBucket(MultipartFile file);
}
