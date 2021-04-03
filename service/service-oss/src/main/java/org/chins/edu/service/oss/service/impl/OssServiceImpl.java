package org.chins.edu.service.oss.service.impl;

import com.aliyun.oss.OSS;
import java.io.IOException;
import java.io.InputStream;
import org.chins.edu.service.oss.service.OssService;
import org.chins.edu.service.oss.utils.OssConstantUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class OssServiceImpl implements OssService {

  @Autowired
  private OSS ossClient;

  @Override
  public String uploadFileToBucket(MultipartFile file) {
    String fileUrl = "";
    String bucketName = OssConstantUtils.BUCKET_NAME;
    String originalFilename = file.getOriginalFilename();
//    文件名可以拼接上时间戳，和年月日作为文件目录
    try {
      InputStream inputStream = file.getInputStream();
      ossClient
          .putObject(bucketName, originalFilename, inputStream);
//      手动拼接文件url
      fileUrl = "https://" + bucketName + "." + OssConstantUtils.END_POINT + "/" + originalFilename;
    } catch (IOException e) {
      e.printStackTrace();
    }
    return fileUrl;
  }
}
