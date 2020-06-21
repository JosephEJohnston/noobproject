package com.noob.interceptor;

import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class CheckInterceptor implements HandlerInterceptor {


    //检查是否登录
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws ServletException, IOException {
        if (request.getSession().getAttribute("employee") == null) {
            request.getRequestDispatcher("/WEB-INF/jsp/error.jsp").forward(request, response);
        }

        return true;
    }
}
