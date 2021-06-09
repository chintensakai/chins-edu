package org.chins.edu.service.service;

import com.baomidou.mybatisplus.extension.service.IService;
import org.chins.edu.common.utils.EduException;
import org.chins.edu.service.entity.EduUcenter;
import org.chins.edu.service.entity.LoginEntity;

/**
 * <p>
 * 会员表 服务类
 * </p>
 *
 * @author chins
 * @since 2021-06-07
 */
public interface IEduUcenterService extends IService<EduUcenter> {

  String login(LoginEntity entity) throws EduException;
}
