package com.daffodil.util;

import java.util.Locale;

import org.springframework.context.MessageSource;
import org.springframework.context.i18n.LocaleContextHolder;

import com.daffodil.util.spring.SpringUtils;

/**
 * 获取i18n资源文件
 * 
 * @author yweijian
 * @date 2019年8月18日
 * @version 1.0
 */
public class MessageUtils {
	/**
	 * 根据消息键和参数 获取消息 委托给spring messageSource
	 *
	 * @param code
	 *            消息键
	 * @param args
	 *            参数
	 * @return 获取国际化翻译值
	 */
	public static String message(String code, Object... args) {
		MessageSource messageSource = SpringUtils.getBean(MessageSource.class);
		Locale locale = LocaleContextHolder.getLocale();
		Locale.setDefault(Locale.SIMPLIFIED_CHINESE);
		return messageSource.getMessage(code, args, locale);
	}
}
