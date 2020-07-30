package com.daffodil.core.annotation;

import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * 防止表单重复提交
 * 
 * @author yweijian
 * @date 2019年8月29日
 * @version 1.0
 */
@Target(ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface FormToken {
	/** 名称 **/
	String TOKEN = "token";

	/** 值 **/
	TokenType value() default TokenType.CREATE;
	
	public enum TokenType {

		/** 创建 **/
		CREATE,

		/** 销毁 **/
		DESTROY
	}
}
