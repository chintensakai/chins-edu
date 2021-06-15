package org.chins.edu.service.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.apache.commons.lang3.StringUtils;
import org.chins.edu.common.utils.EduException;
import org.chins.edu.common.utils.JwtUtils;
import org.chins.edu.service.entity.EduUcenter;
import org.chins.edu.service.entity.LoginEntity;
import org.chins.edu.service.mapper.EduUcenterMapper;
import org.chins.edu.service.service.IEduUcenterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 会员表 服务实现类
 * </p>
 *
 * @author chins
 * @since 2021-06-07
 */
@Service
public class EduUcenterServiceImpl extends ServiceImpl<EduUcenterMapper, EduUcenter> implements
    IEduUcenterService {

  @Autowired
  private EduUcenterMapper ucenterMapper;

  @Override
  public String login(LoginEntity entity) throws EduException {
    String token = "";
    String mobile = entity.getMobile();
    String password = entity.getPassword();
    if (StringUtils.isAnyEmpty(mobile, password)) {
      return "";
    }

//   判断手机号
    QueryWrapper<EduUcenter> wrapper = new QueryWrapper<>();
    wrapper.eq("mobile", mobile);
    EduUcenter eduUcenter = ucenterMapper.selectOne(wrapper);

//    todo -md5 password
    if (null == eduUcenter || !password.equals(eduUcenter.getPassword())) {
      throw new EduException(40001, "Login Failed.");
    }
    return JwtUtils.genJwtToken(eduUcenter.getId(), eduUcenter.getNickname());
  }
}
