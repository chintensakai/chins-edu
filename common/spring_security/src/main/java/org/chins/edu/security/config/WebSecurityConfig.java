package org.chins.edu.security.config;

import org.chins.edu.security.filter.TokenAuthenticationFilter;
import org.chins.edu.security.filter.TokenLoginFilter;
import org.chins.edu.security.tools.DefaultPasswordEncoder;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;

@Configuration
@EnableWebSecurity
@EnableGlobalMethodSecurity(prePostEnabled = true)
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {

  private UserDetailsService userDetailsService;
  private DefaultPasswordEncoder defaultPasswordEncoder;
  private RedisTemplate redisTemplate;

  public WebSecurityConfig(
      UserDetailsService userDetailsService,
      DefaultPasswordEncoder defaultPasswordEncoder) {
    this.userDetailsService = userDetailsService;
    this.defaultPasswordEncoder = defaultPasswordEncoder;
  }

  @Override
  protected void configure(AuthenticationManagerBuilder auth) throws Exception {
    auth.userDetailsService(userDetailsService).passwordEncoder(defaultPasswordEncoder);
  }

  @Override
  public void configure(WebSecurity web) throws Exception {
    super.configure(web);
  }

  @Override
  protected void configure(HttpSecurity http) throws Exception {
    http.csrf().disable()
        .authorizeRequests()
        .anyRequest().authenticated()
        .and().logout().logoutUrl("/admin/acl/logout")
        .and()
        .addFilter(new TokenLoginFilter(authenticationManager()))
        .addFilter(new TokenAuthenticationFilter(authenticationManager()))
        .httpBasic();
  }
}
