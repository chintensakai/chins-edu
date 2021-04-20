package org.chins.edu.service.video.utils;

import com.aliyuncs.DefaultAcsClient;
import com.aliyuncs.profile.DefaultProfile;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Component;

@Component
public class VodConstantUtils implements InitializingBean {

  public static String END_POINT;
  public static String KEY_ID;
  public static String KEY_SECRET;

  @Value("${aliyun.video.endpoint}")
  private String endpoint;
  @Value("${aliyun.video.keyid}")
  private String keyid;
  @Value("${aliyun.video.keysecret}")
  private String keysecret;

  @Override
  public void afterPropertiesSet() throws Exception {
    END_POINT = endpoint;
    KEY_ID = keyid;
    KEY_SECRET = keysecret;
  }

  @Bean
  public DefaultAcsClient vodClient() {
    String regionId = "cn-shanghai";  // 点播服务接入区域
    DefaultProfile profile = DefaultProfile
        .getProfile(regionId, VodConstantUtils.KEY_ID, VodConstantUtils.KEY_SECRET,
            "securityToken");
    DefaultAcsClient client = new DefaultAcsClient(profile);
    return client;
  }
}
