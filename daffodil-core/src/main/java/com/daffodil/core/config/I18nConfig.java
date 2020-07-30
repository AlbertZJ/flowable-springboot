package com.daffodil.core.config;

import java.util.Locale;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.LocaleResolver;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.i18n.LocaleChangeInterceptor;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;

/**
 * i18n国际化标准配置资源文件
 * 
 * @author yweijian
 * @date 2019年8月19日
 * @version 1.0
 */
@Configuration
public class I18nConfig implements WebMvcConfigurer {
	
	@Bean(name = "I18nLocaleResolver")
	public LocaleResolver localeResolver() {
		SessionLocaleResolver sessionLocaleResolver = new SessionLocaleResolver();
		// 默认语言
		sessionLocaleResolver.setDefaultLocale(Locale.SIMPLIFIED_CHINESE);
		return sessionLocaleResolver;
	}

	@Bean(name = "I18nLocaleChangeInterceptor")
	public LocaleChangeInterceptor localeChangeInterceptor() {
		LocaleChangeInterceptor localeChangeInterceptor = new LocaleChangeInterceptor();
		// 参数名
		localeChangeInterceptor.setParamName("lang");
		return localeChangeInterceptor;
	}

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(localeChangeInterceptor());
	}
}