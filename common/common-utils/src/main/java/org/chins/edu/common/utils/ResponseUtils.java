package org.chins.edu.common.utils;

import com.fasterxml.jackson.databind.ObjectMapper;
import java.io.IOException;
import javax.servlet.http.HttpServletResponse;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;

public class ResponseUtils {

  public static void out(HttpServletResponse response, Result r) {
    ObjectMapper mapper = new ObjectMapper();
    response.setStatus(HttpStatus.OK.value());
    response.setContentType(MediaType.APPLICATION_JSON_UTF8_VALUE);
    try {
      mapper.writeValue(response.getWriter(), r);
    } catch (IOException e) {
      e.printStackTrace();
    }
  }
}
