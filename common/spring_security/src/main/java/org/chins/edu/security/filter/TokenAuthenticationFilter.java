package org.chins.edu.security.filter;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.chins.edu.common.utils.JwtUtils;
import org.chins.edu.common.utils.ResponseUtils;
import org.chins.edu.common.utils.Result;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.www.BasicAuthenticationFilter;

/***
 * 授权过滤器
 */
public class TokenAuthenticationFilter extends BasicAuthenticationFilter {

  private RedisTemplate redisTemplate;

  public TokenAuthenticationFilter(
      AuthenticationManager authenticationManager) {
    super(authenticationManager);
  }

  @Override
  protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response,
      FilterChain chain) throws IOException, ServletException {

    if (request.getRequestURI().indexOf("admin") == -1) {
      chain.doFilter(request, response);
      return;
    }

    UsernamePasswordAuthenticationToken authenticationToken = null;
    try {
      authenticationToken = getAuthentication(request);
    } catch (Exception e) {
      ResponseUtils.out(response, Result.error());
    }

    if (authenticationToken != null) {
      SecurityContextHolder.getContext().setAuthentication(authenticationToken);
    } else {
      ResponseUtils.out(response, Result.error());
    }
    chain.doFilter(request, response);
  }

  private UsernamePasswordAuthenticationToken getAuthentication(HttpServletRequest request) {
    String token = request.getHeader("Authorization");
    String username = JwtUtils.getUserFromToken(token);
    List<String> accessList = (List<String>) redisTemplate.opsForValue().get(username);
    Collection<GrantedAuthority> authorities = new ArrayList<>();
    for (String s : accessList) {
      SimpleGrantedAuthority authority = new SimpleGrantedAuthority(s);
      authorities.add(authority);
    }

    return new UsernamePasswordAuthenticationToken(username, token, authorities);
  }
}
