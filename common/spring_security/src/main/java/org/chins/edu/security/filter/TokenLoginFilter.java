package org.chins.edu.security.filter;

import com.fasterxml.jackson.databind.ObjectMapper;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.chins.edu.common.utils.JwtUtils;
import org.chins.edu.security.entity.SecurityUser;
import org.chins.edu.security.entity.User;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

public class TokenLoginFilter extends UsernamePasswordAuthenticationFilter {

  private AuthenticationManager authenticationManager;
  private RedisTemplate redisTemplate;

  public TokenLoginFilter(
      AuthenticationManager authenticationManager) {
    this.authenticationManager = authenticationManager;
    this.setPostOnly(false);
    this.setRequiresAuthenticationRequestMatcher(
        new AntPathRequestMatcher("/admin/acl/login", "POST"));
  }

  @Override
  public Authentication attemptAuthentication(HttpServletRequest request,
      HttpServletResponse response) throws AuthenticationException {
    try {
      User user = new ObjectMapper().readValue(request.getInputStream(), User.class);
      return authenticationManager.authenticate(
          new UsernamePasswordAuthenticationToken(user.getClass(), user.getPassword(),
              new ArrayList<>()));
    } catch (IOException e) {
      throw new RuntimeException(e);
    }
  }

  @Override
  protected void successfulAuthentication(HttpServletRequest request, HttpServletResponse response,
      FilterChain chain, Authentication authResult) throws IOException, ServletException {

    SecurityUser user = (SecurityUser) authResult.getPrincipal();
    String token = JwtUtils.genJwtToken(user.getUsername());
    redisTemplate.opsForValue().set(user.getUsername(), user.getPermissionList());
  }
}
