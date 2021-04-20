package org.chins.edu.service.video;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;
import org.springframework.web.bind.annotation.CrossOrigin;

@SpringBootApplication(exclude = DataSourceAutoConfiguration.class)
@CrossOrigin
public class ChinsEduServiceVideoApplication {

  public static void main(String[] args) {
    SpringApplication.run(ChinsEduServiceVideoApplication.class, args);
  }
}
