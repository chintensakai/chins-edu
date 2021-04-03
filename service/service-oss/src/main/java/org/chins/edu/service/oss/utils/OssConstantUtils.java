package org.chins.edu.service.oss.utils;

import com.aliyun.oss.OSS;
import com.aliyun.oss.OSSClientBuilder;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Component;

@Component
public class OssConstantUtils implements InitializingBean {

  public static String BUCKET_NAME;
  public static String END_POINT;
  public static String KEY_ID;
  public static String KEY_SECRET;
  @Value("${aliyun.oss.file.bucketname}")
  private String bucketname;
  @Value("${aliyun.oss.file.endpoint}")
  private String endpoint;
  @Value("${aliyun.oss.file.keyid}")
  private String keyid;
  @Value("${aliyun.oss.file.keysecret}")
  private String keysecret;

  @Override
  public void afterPropertiesSet() throws Exception {
    BUCKET_NAME = bucketname;
    END_POINT = endpoint;
    KEY_ID = keyid;
    KEY_SECRET = keysecret;
  }

  @Bean
  public OSS ossClient() {
    return new OSSClientBuilder()
        .build(OssConstantUtils.END_POINT, OssConstantUtils.KEY_ID, OssConstantUtils.KEY_SECRET);
  }
}
