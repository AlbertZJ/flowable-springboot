package com.daffodil.core.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.daffodil.core.interceptor.FormTokenInterceptor;

/**
 * 应用配置
 * @author yweijian
 * @date 2019年8月29日
 * @version 1.0
 */
@Configuration
public class ApplicationConfig implements WebMvcConfigurer{

	/**
	 * 配置防止表单重复提交拦截器
	 */
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(new FormTokenInterceptor()).addPathPatterns("/**");
	}

}
