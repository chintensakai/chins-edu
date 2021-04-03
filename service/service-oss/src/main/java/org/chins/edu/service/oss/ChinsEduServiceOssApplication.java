package org.chins.edu.service.oss;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;

@SpringBootApplication(exclude = DataSourceAutoConfiguration.class)
public class ChinsEduServiceOssApplication {

  public static void main(String[] args) {
    SpringApplication.run(ChinsEduServiceOssApplication.class, args);
  }
}
