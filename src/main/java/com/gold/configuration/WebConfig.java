package com.gold.configuration;

import com.gold.interceptor.AdminInterceptor;
import com.gold.interceptor.LoginInterceptor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebConfig implements WebMvcConfigurer {

    @Autowired
    AdminInterceptor adminInterceptor;

    @Autowired
    LoginInterceptor loginInterceptor;

    @Override
    public void addInterceptors(InterceptorRegistry registry){
        registry.addInterceptor(adminInterceptor)
                .addPathPatterns("/admin/**");
        registry.addInterceptor(loginInterceptor)
                .addPathPatterns("/user/loginAction.do");
    }
}
