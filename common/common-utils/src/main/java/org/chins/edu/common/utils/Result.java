package org.chins.edu.common.utils;

import java.util.HashMap;
import java.util.Map;
import lombok.Data;

@Data
public class Result {

  private Boolean success;
  private Integer code;
  private String msg;
  private Map<String, Object> data = new HashMap<>();

  private Result() {
//    默认构造方法私有化，只让用户使用规定的构造方法
  }

  public static Result success() {
    Result result = new Result();
    result.setSuccess(Boolean.TRUE);
    result.setCode(RetCode.SUCCESS);
    result.setMsg("Success");
    return result;
  }

  public static Result error() {
    Result result = new Result();
    result.setSuccess(Boolean.FALSE);
    result.setCode(RetCode.FAILED);
    result.setMsg("Failed");
    return result;
  }

//  方便链式编程
  public Result success(Boolean success) {
    this.setSuccess(success);
    return this;
  }

  public Result message(String message) {
    this.setMsg(message);
    return this;
  }

  public Result data(Map<String, Object> map) {
    this.setData(map);
    return this;
  }

  public Result data(String key, Object value) {
    this.data.put(key, value);
    return this;
  }
}
