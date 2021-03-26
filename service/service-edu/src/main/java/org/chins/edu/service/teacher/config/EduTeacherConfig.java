package org.chins.edu.service.teacher.config;

import com.baomidou.mybatisplus.annotation.DbType;
import com.baomidou.mybatisplus.core.handlers.MetaObjectHandler;
import com.baomidou.mybatisplus.extension.plugins.MybatisPlusInterceptor;
import com.baomidou.mybatisplus.extension.plugins.inner.PaginationInnerInterceptor;
import java.time.LocalDateTime;
import org.apache.ibatis.reflection.MetaObject;
import org.chins.edu.common.utils.GlobalExceptionHandler;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
@MapperScan("org.chins.edu.service.teacher.mapper")
public class EduTeacherConfig {

  // 逻辑删除插件新版本已不需要配置

  // 最新版
  @Bean
  public MybatisPlusInterceptor mybatisPlusInterceptor() {
    MybatisPlusInterceptor interceptor = new MybatisPlusInterceptor();
    interceptor.addInnerInterceptor(new PaginationInnerInterceptor(DbType.MYSQL));
    return interceptor;
  }

  @Bean
  public MetaObjectHandler metaObjectHandler() {
    return new MetaObjectHandler() {
      @Override
      public void insertFill(MetaObject metaObject) {
        this.strictInsertFill(metaObject, "gmtCreate", LocalDateTime.class, LocalDateTime.now());
        this.strictUpdateFill(metaObject, "gmtModified", LocalDateTime.class, LocalDateTime.now());
      }

      @Override
      public void updateFill(MetaObject metaObject) {
        this.strictUpdateFill(metaObject, "gmtModified", LocalDateTime.class, LocalDateTime.now());
      }
    };
  }

  @Bean
  public GlobalExceptionHandler handler() {
    return new GlobalExceptionHandler();
  }
}
