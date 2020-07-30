package com.daffodil.core.annotation;

import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * 系统字典配置
 * @author yweijian
 * @date 2020年3月14日
 * @project com.jdy.core.annotation.Dict.java
 * @version 2.0
 */
@Retention(RetentionPolicy.RUNTIME)
@Target(ElementType.METHOD)
@Documented
public @interface Dict {
	
	public String value() default "";
}
