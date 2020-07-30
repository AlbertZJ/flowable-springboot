package com.daffodil.generator.gen;

import java.util.Properties;
import org.apache.velocity.app.Velocity;

/**
 * 模板引擎工厂
 * @author yweijian
 * @date 2020年5月13日
 * @version 1.0
 */
public class VelocityInitializer {
	/**
	 * 初始化vm方法
	 */
	public static void initVelocity() {
		Properties properties = new Properties();
		try {
			// 加载classpath目录下的vm文件
			properties.setProperty("file.resource.loader.class", "org.apache.velocity.runtime.resource.loader.ClasspathResourceLoader");
			// 定义字符集
			properties.setProperty(Velocity.ENCODING_DEFAULT, "UTF-8");
			properties.setProperty(Velocity.OUTPUT_ENCODING, "UTF-8");
			// 初始化Velocity引擎，指定配置Properties
			Velocity.init(properties);
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
}
