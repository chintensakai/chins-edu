package org.chins.edu.service.controller;


import javax.servlet.http.HttpServletRequest;
import org.chins.edu.common.utils.EduException;
import org.chins.edu.common.utils.JwtUtils;
import org.chins.edu.common.utils.Result;
import org.chins.edu.service.entity.EduUcenter;
import org.chins.edu.service.entity.LoginEntity;
import org.chins.edu.service.service.IEduUcenterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * <p>
 * 会员表 前端控制器
 * </p>
 *
 * @author chins
 * @since 2021-06-07
 */
@RestController
@RequestMapping("/service/edu-ucenter")
@CrossOrigin
public class EduUcenterController {

  @Autowired
  private IEduUcenterService ucenterService;

  @PostMapping("/login")
  public Result login(@RequestBody LoginEntity entity) {
    String loginToken = null;
    try {
      loginToken = ucenterService.login(entity);
    } catch (EduException e) {
      return Result.error();
    }
    return Result.success().data("Subject-Token", loginToken);
  }

  @GetMapping("/getUserInfo")
  public Result getUserInfo(HttpServletRequest request) {
    String memberId = JwtUtils.getMemberIdByJwtToken(request);
    EduUcenter byId = ucenterService.getById(memberId);
    return Result.success().data("userInfo", byId);
  }
}
