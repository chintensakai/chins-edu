package org.chins.edu.common.utils;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

@ControllerAdvice
public class GlobalExceptionHandler {

  @ExceptionHandler(Exception.class)
  @ResponseBody
  public Result error(Exception e) {
    System.out.println("========================== " + e);
    return Result.error().message("exception: " + e);
  }
}
