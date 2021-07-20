package org.chins.edu.security.tools;

import org.chins.edu.common.utils.MD5Utils;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;

@Component
public class DefaultPasswordEncoder implements PasswordEncoder {

  @Override
  public String encode(CharSequence charSequence) {
    return MD5Utils.encrypt(charSequence.toString());
  }

  @Override
  public boolean matches(CharSequence charSequence, String s) {
    return s.equals(MD5Utils.encrypt(charSequence.toString()));
  }
}
