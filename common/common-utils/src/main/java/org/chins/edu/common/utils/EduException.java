package org.chins.edu.common.utils;

public class EduException extends Exception {

  //用详细信息指定一个异常
  public EduException(int code, String message) {
    super(message);
  }
}
