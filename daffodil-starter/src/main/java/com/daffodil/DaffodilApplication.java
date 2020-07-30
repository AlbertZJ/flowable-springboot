package com.daffodil;

import java.sql.Connection;
import java.sql.DriverManager;
import java.util.Properties;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.jdbc.ScriptRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.security.servlet.SecurityAutoConfiguration;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.context.annotation.ComponentScan;

/**
 *
 * @author yweijian
 * @date 2020年1月9日
 * @version 1.0
 */
@SpringBootApplication(exclude = {SecurityAutoConfiguration.class})
@ComponentScan(basePackages = {"com.daffodil", "org.flowable.ui"})
public class DaffodilApplication extends SpringBootServletInitializer{

	@Override
	protected SpringApplicationBuilder configure(SpringApplicationBuilder builder) {
		return builder.sources(DaffodilApplication.class);
	}

	public static void main(String[] args) {
//		init();
		SpringApplication.run(DaffodilApplication.class, args);
	}

	/**
	 * 系统基础库表数据初始化
	 */
//	public static void init() {
//		try{
//			Properties properties = Resources.getResourceAsProperties("application-datasource.properties");
//			String url = properties.getProperty("spring.datasource.url");
//			String user = properties.getProperty("spring.datasource.username");
//			String password = properties.getProperty("spring.datasource.password");
//			Connection conn = DriverManager.getConnection(url, user, password);
//			ScriptRunner runner = new ScriptRunner(conn);
//			runner.runScript(Resources.getResourceAsReader("import.sql"));
//			conn.close();
//		}catch (Exception e) {
//			e.printStackTrace();
//		}
//	}

}
