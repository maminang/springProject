package kr.ca.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AuthInterceptor extends HandlerInterceptorAdapter {

   @Override
   public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
         throws Exception {
      HttpSession session = request.getSession();

      if (session.getAttribute("login") == null) {
         saveDest(request);
         response.sendRedirect("/member/login");
         return false;
      }
      saveDest(request);
      return true; 
   }

   private void saveDest(HttpServletRequest request) {
      String uri = request.getRequestURI();
      String query = request.getQueryString();
      if (query == null || query.equals("null")) {
         query = "";
      } else {
         query = "?" + query;
      }

      String dataMethod = request.getMethod();
      if (dataMethod.equalsIgnoreCase("GET")) {
         request.getSession().setAttribute("dest", uri+query);
      }
   }

   @Override
   public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
         ModelAndView modelAndView) throws Exception {
//	   HttpSession session=request.getSession();
//		if (session!=null) {
//			String dest = (String) session.getAttribute("dest");
//		}
   
   }

}