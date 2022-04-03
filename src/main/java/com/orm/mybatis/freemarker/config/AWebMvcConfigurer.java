package com.orm.mybatis.freemarker.config;


import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

//配置拦截事件
@Configuration
public class AWebMvcConfigurer implements WebMvcConfigurer {


    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/res/**")
                .addResourceLocations("classpath:/res/");
        registry.addResourceHandler("/templates/**")
                .addResourceLocations("classpath:/templates/");
    }
}
