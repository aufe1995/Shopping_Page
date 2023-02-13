package com.gold.interceptor;

import com.gold.user.UserVo;
import lombok.SneakyThrows;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class AdminInterceptor implements HandlerInterceptor {

    @SneakyThrows
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception{

        HttpSession session = request.getSession();

        UserVo user = (UserVo)session.getAttribute("level");

        if(user == null || user.getLevel() != 0){

            response.sendRedirect("redirect:/");

            return false;
        }
        return true;
    }


}
