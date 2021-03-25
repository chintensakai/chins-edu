package org.chins.edu.service.teacher.config;

import com.baomidou.mybatisplus.core.handlers.MetaObjectHandler;
import java.time.LocalDateTime;
import org.apache.ibatis.reflection.MetaObject;
import org.springframework.stereotype.Component;

@Component
public class MyMetaObjectHandler implements MetaObjectHandler {

  @Override
  public void insertFill(MetaObject metaObject) {
    this.strictInsertFill(metaObject, "gmtCreate", LocalDateTime.class, LocalDateTime.now());
    this.strictUpdateFill(metaObject, "gmtModified", LocalDateTime.class, LocalDateTime.now());
  }

  @Override
  public void updateFill(MetaObject metaObject) {
    this.strictUpdateFill(metaObject, "gmtModified", LocalDateTime.class, LocalDateTime.now());
  }
}
