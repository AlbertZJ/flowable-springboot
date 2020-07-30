package com.daffodil.core.annotation;

import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * 操作日志记录注解
 * @author yweijian
 * @date 2019年8月18日
 * @version 1.0
 */
@Target({ ElementType.PARAMETER, ElementType.METHOD })
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface Log
{
    /**
     * 模块 
     */
    public String title() default "";

    /**
     * 功能
     */
    public BusinessType businessType() default BusinessType.OTHER;

    /**
     * 操作人类别
     */
    public OperatorType operatorType() default OperatorType.MANAGE;

    /**
     * 是否保存请求的参数
     */
    public boolean isSaveRequestData() default true;
    
    public enum OperatorType {

    	/**
    	 * 后台端
    	 */
    	MANAGE,

    	/**
    	 * 移动端
    	 */
    	MOBILE,
    	/**
    	 * 微信
    	 */
    	WEIXIN,
    	/**
    	 * QQ
    	 */
    	QQ,
    	/**
    	 * 微博
    	 */
    	WEIBO,
    	/**
    	 * 其它
    	 */
    	OTHER
    }
    
    public enum BusinessType {
    	/**
    	 * 其它
    	 */
    	OTHER,

    	/**
    	 * 新增
    	 */
    	INSERT,

    	/**
    	 * 修改
    	 */
    	UPDATE,

    	/**
    	 * 删除
    	 */
    	DELETE,

    	/**
    	 * 授权
    	 */
    	GRANT,

    	/**
    	 * 导出
    	 */
    	EXPORT,

    	/**
    	 * 导入
    	 */
    	IMPORT,

    	/**
    	 * 强退
    	 */
    	FORCE,

    	/**
    	 * 生成代码
    	 */
    	GENCODE,

    	/**
    	 * 清空
    	 */
    	CLEAN,
    	/**
    	 * 作废
    	 */
    	TRASH
    }
}
