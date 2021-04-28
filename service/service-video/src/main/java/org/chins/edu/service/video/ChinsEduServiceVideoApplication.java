package org.chins.edu.service.video;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;

@SpringBootApplication(exclude = DataSourceAutoConfiguration.class)
@EnableDiscoveryClient
public class ChinsEduServiceVideoApplication {

  public static void main(String[] args) {
    SpringApplication.run(ChinsEduServiceVideoApplication.class, args);
  }
}
