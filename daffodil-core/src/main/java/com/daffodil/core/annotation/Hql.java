package com.daffodil.core.annotation;

import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * 自定义hql语句创建注解
 * @author yweijian
 * @date 2020年2月14日
 * @version 1.0
 */
@Retention(RetentionPolicy.RUNTIME)
@Target(ElementType.METHOD)
@Documented
public @interface Hql {
	
	/**
	 * 逻辑运算类型
	 * LIKE("like"), EQ("="), NEQ("!="), LEQ("<="), LT("<"), REQ(">="), RT(">"), IN("in"), NONE("");
	 * @return
	 */
	Logical type() default Logical.NONE;
	
	public enum Logical {
		LIKE("like"), EQ("="), NEQ("!="), LEQ("<="), LT("<"), REQ(">="), RT(">"), IN("in"), NONE("");
		private final String value;

		Logical(String value) {
			this.value = value;
		}

		public String value() {
			return this.value;
		}
	}

}