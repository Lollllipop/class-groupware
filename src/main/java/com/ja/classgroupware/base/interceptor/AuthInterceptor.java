package com.ja.classgroupware.base.interceptor;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.util.WebUtils;
import com.ja.classgroupware.base.vo.UsersVO;
import com.ja.classgroupware.auth.service.UserService;

public class AuthInterceptor extends HandlerInterceptorAdapter {

   private static final Logger logger = LoggerFactory.getLogger(AuthInterceptor.class);

   @Inject
   private UserService service;

   @Override
   public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
         throws Exception {

      HttpSession session = request.getSession();

      if (session.getAttribute("login") != null) {

         logger.info("current user is not logined");

         saveDest(request);

         Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");

         if (loginCookie != null) {

            UsersVO usersVO = service.checkLoginBefore(loginCookie.getValue());

            logger.info("USERSVO: " + usersVO);

            if (usersVO != null) {
               session.setAttribute("login", usersVO);
               return true;
            }
         }

         response.sendRedirect("/entity/auth/login");
         return false;
      }
      return true;
   }

   private void saveDest(HttpServletRequest req) {

      String uri = req.getRequestURI();

      String query = req.getQueryString();

      if (query == null || query.equals("null")) {
         query = "";
      } else {
         query = "?" + query;
      }

      if (req.getMethod().equals("GET")) {
         logger.info("dest: " + (uri + query));
         req.getSession().setAttribute("dest", uri + query);
      }
   }

   // @Override
   // public boolean preHandle(HttpServletRequest request, HttpServletResponse
   // response, Object handler) throws Exception {
   //
   // HttpSession session = request.getSession();
   //
   // if (session.getAttribute("login") == null) {
   //
   // logger.info("current user is not logined");
   //
   // saveDest(request);
   //
   // response.sendRedirect("/user/login");
   // return false;
   // }
   // return true;
   // }
}

// if(session.getAttribute("login") == null){
//
// logger.info("current user is not logined");
// response.sendRedirect("/user/login");
// return false;
// }