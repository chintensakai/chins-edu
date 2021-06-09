package org.chins.edu.common.utils;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jws;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import java.util.Date;
import javax.servlet.http.HttpServletRequest;
import org.springframework.util.StringUtils;

public class JwtUtils {

  public static final long EXPIRE = 24 * 60 * 60 * 1000;
  public static final String APP_SECRET = "LTAI5t7VeaP4aXY6C6xJPRxQ";

  /***
   * 生成jwt token
   *
   * @param id
   * @param nickname
   * @return
   */
  public static String genJwtToken(String id, String nickname) {
    String JwtToken = Jwts.builder()
        .setHeaderParam("typ", "JWT")
        .setHeaderParam("alg", "HS256")
        .setSubject("chins")
        .setIssuedAt(new Date())
        .setExpiration(new Date(System.currentTimeMillis() + EXPIRE))
        .claim("id", id)
        .claim("nickname", nickname)
        .signWith(SignatureAlgorithm.HS256, APP_SECRET)
        .compact();
    return JwtToken;
  }

  /**
   * 判断token是否存在与有效
   *
   * @param jwtToken
   * @return
   */
  public static boolean checkToken(String jwtToken) {
    if (StringUtils.isEmpty(jwtToken)) {
      return false;
    }
    try {
      Jwts.parser().setSigningKey(APP_SECRET).parseClaimsJws(jwtToken);
    } catch (Exception e) {
      e.printStackTrace();
      return false;
    }
    return true;
  }

  /**
   * 判断token是否存在与有效
   *
   * @param request
   * @return
   */
  public static boolean checkToken(HttpServletRequest request) {
    try {
      String jwtToken = request.getHeader("X-Auth-Token");
      if (StringUtils.isEmpty(jwtToken)) {
        return false;
      }
      Jwts.parser().setSigningKey(APP_SECRET).parseClaimsJws(jwtToken);
    } catch (Exception e) {
      e.printStackTrace();
      return false;
    }
    return true;
  }

  /**
   * 根据token获取会员id
   *
   * @param request
   * @return
   */
  public static String getMemberIdByJwtToken(HttpServletRequest request) {
    String jwtToken = request.getHeader("X-Auth-Token");
    if (StringUtils.isEmpty(jwtToken)) {
      return "";
    }
    Jws<Claims> claimsJws =
        Jwts.parser().setSigningKey(APP_SECRET).parseClaimsJws(jwtToken);
    Claims claims = claimsJws.getBody();
    return (String) claims.get("id");
  }

}
