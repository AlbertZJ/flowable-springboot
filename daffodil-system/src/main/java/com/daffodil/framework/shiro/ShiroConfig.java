package com.daffodil.framework.shiro;

import java.util.LinkedHashMap;

import javax.servlet.Filter;

import org.apache.shiro.mgt.SecurityManager;
import org.apache.shiro.spring.security.interceptor.AuthorizationAttributeSourceAdvisor;
import org.apache.shiro.spring.web.ShiroFilterFactoryBean;
import org.apache.shiro.web.mgt.CookieRememberMeManager;
import org.apache.shiro.web.mgt.DefaultWebSecurityManager;
import org.apache.shiro.web.servlet.SimpleCookie;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.EnableCaching;
//import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.daffodil.framework.shiro.filter.KaptchaValidateFilter;
import com.daffodil.framework.shiro.filter.KickoutSessionFilter;
import com.daffodil.framework.shiro.filter.OnlineSessionFilter;
import com.daffodil.framework.shiro.filter.SysLogoutFilter;
import com.daffodil.framework.shiro.realm.UserRealm;
import com.daffodil.framework.shiro.redis.ShiroRedisCacheManager;
import com.daffodil.framework.shiro.redis.ShiroRedisTemplate;
import com.daffodil.framework.shiro.service.ConfigService;
import com.daffodil.framework.shiro.service.SysShiroService;
import com.daffodil.framework.shiro.session.OnlineSessionDao;
import com.daffodil.framework.shiro.session.OnlineSessionFactory;
import com.daffodil.framework.shiro.session.OnlineSessionManager;
import com.daffodil.util.StringUtils;
import com.daffodil.util.spring.SpringUtils;

import at.pollux.thymeleaf.shiro.dialect.ShiroDialect;

/**
 * shiro权限配置加载<br>
 * 参数化配置使用数据库表配置方式，在系统显示更直观，修改更方便.
 * @author yweijian
 * @date 2019年8月22日
 * @version 1.0
 */
@Configuration
@EnableCaching
public class ShiroConfig {

	private static final Logger log = LoggerFactory.getLogger(ShiroConfig.class);

	// Session超时时间，单位为毫秒（默认30分钟）
	//@Value("${shiro.session.expireTime}")
	private int expireTime;

	// 同一个用户最大会话数
	//@Value("${shiro.session.maxSession}")
	private int maxSession;

	// 踢出之前登录的/之后登录的用户，默认踢出之前登录的用户
	//@Value("${shiro.session.kickoutAfter}")
	private boolean kickoutAfter;

	// 踢出之后重定向地址
	//@Value("${shiro.session.kickoutUrl}")
	private String kickoutUrl;

	// 验证码开关
	//@Value("${shiro.kaptcha.enabled}")
	private boolean kaptchaEnabled;

	// 设置Cookie的名称
	//@Value("${shiro.cookie.name}")
	private String cookieName;

	// 设置Cookie的域名
	//@Value("${shiro.cookie.domain}")
	private String domain;

	// 设置cookie的有效访问路径
	//@Value("${shiro.cookie.path}")
	private String cookiePath;

	// 设置HttpOnly属性
	//@Value("${shiro.cookie.httpOnly}")
	private boolean httpOnly;

	// 设置Cookie的过期时间，秒为单位
	//@Value("${shiro.cookie.maxAge}")
	private int maxAge;

	// 登录地址
	//@Value("${shiro.user.loginUrl}")
	private String loginUrl;

	// 权限认证失败地址
	//@Value("${shiro.user.unauthorizedUrl}")
	private String unauthorizedUrl;

	//过滤约束
	private LinkedHashMap<String, String> filterMap;
	
	@Autowired
	private ShiroRedisTemplate shiroRedisTemplate;

	/**
	 * redis 缓存管理
	 * @return
	 */
	@Bean
	public ShiroRedisCacheManager getCacheManager(){
		return new ShiroRedisCacheManager(shiroRedisTemplate);
	}
	
	/**
	 * 自定义Realm
	 */
	 @Bean
	 public UserRealm userRealm() {
		 UserRealm userRealm = new UserRealm();
		 userRealm.setCacheManager(this.getCacheManager());
		 return userRealm;
	 }

	 /**
	  * 自定义sessionDao会话
	  */
	 @Bean
	 public OnlineSessionDao sessionDao() {
		 return new OnlineSessionDao();
	 }

	 /**
	  * 自定义sessionFactory会话
	  */
	 @Bean
	 public OnlineSessionFactory sessionFactory() {
		 return new OnlineSessionFactory();
	 }

	 /**
	  * 会话管理器
	  */
	 @Bean
	 public OnlineSessionManager sessionManager() {
		 OnlineSessionManager manager = new OnlineSessionManager();
		 // 加入缓存管理器
		 manager.setCacheManager(this.getCacheManager());
		 // 删除过期的session
		 manager.setDeleteInvalidSessions(true);
		 // 设置全局session超时时间
		 manager.setGlobalSessionTimeout(expireTime * 60 * 1000);
		 // 去掉 JSESSIONID
		 manager.setSessionIdUrlRewritingEnabled(false);
		 // 是否定时检查session
		 manager.setSessionValidationSchedulerEnabled(true);
		 // 自定义sessionFactory
		 manager.setSessionFactory(this.sessionFactory());
		 // 自定义SessionDao
		 manager.setSessionDAO(this.sessionDao());
		 return manager;
	 }

	 /**
	  * shiro安全管理器
	  */
	 @Bean
	 public SecurityManager securityManager(UserRealm userRealm) {
		 DefaultWebSecurityManager securityManager = new DefaultWebSecurityManager();
		 // 设置realm.
		 securityManager.setRealm(userRealm);
		 // 记住我
		 securityManager.setRememberMeManager(this.rememberMeManager());
		 // 注入缓存管理器;
		 securityManager.setCacheManager(this.getCacheManager());
		 // session管理器
		 securityManager.setSessionManager(this.sessionManager());
		 return securityManager;
	 }

	 /**
	  * Shiro配置，默认配置
	  * @anon---------------org.apache.shiro.web.filter.authc.AnonymousFilter 没有参数，表示可以匿名使用。<br>
	  * @authc--------------org.apache.shiro.web.filter.authc.FormAuthenticationFilter 表示需要认证(登录)才能使用，没有参数<br>
	  * @authcBasic---------org.apache.shiro.web.filter.authc.BasicHttpAuthenticationFilter 没有参数表示httpBasic认证<br>
	  * @logout-------------org.apache.shiro.web.filter.authc.LogoutFilter 退出登录<br>
	  * @perms--------------org.apache.shiro.web.filter.authz.PermissionAuthorizationFilter 参数可以写多个，多个时必须加上引号，并且参数之间用逗号分割，例如/admins/user/**=perms["user:add:*,user:modify:*"]，当有多个参数时必须每个参数都通过才通过，想当于isPermitedAll()方法。<br>
	  * @port---------------org.apache.shiro.web.filter.authz.PortFilter port[8081],当请求的url的端口不是8081是跳转到schemal://serverName:8081?queryString,其中schmal是协议http或https等，serverName是你访问的host,8081是url配置里port的端口，queryString是你访问的url里的‘?’后面的参数。<br>
	  * @rest---------------org.apache.shiro.web.filter.authz.HttpMethodPermissionFilter 根据请求的方法，相当于/admins/user/**=perms[user:method] ,其中method为post，get，delete等。
	  * @roles--------------org.apache.shiro.web.filter.authz.RolesAuthorizationFilter 参数可以写多个，多个时必须加上引号，并且参数之间用逗号分割，当有多个参数时，例如admins/user/**=roles["admin,guest"],每个参数通过才算通过，相当于hasAllRoles()方法。<br>
	  * @ssl----------------org.apache.shiro.web.filter.authz.SslFilter 没有参数，表示安全的url请求，协议为https<br>
	  * @user---------------org.apache.shiro.web.filter.authz.UserFilter 没有参数表示必须存在用户，当登入操作时不做检查<br>
	  * @param securityManager
	  * @return
	  */
	 @Bean
	 public ShiroFilterFactoryBean shiroFilterFactoryBean(SecurityManager securityManager) {
		 ShiroFilterFactoryBean factory = new ShiroFilterFactoryBean();
		 // Shiro的核心安全接口,这个属性是必须的
		 factory.setSecurityManager(securityManager);
		 // 身份认证失败，则跳转到登录页面的配置
		 factory.setLoginUrl(loginUrl);
		 // 权限认证失败，则跳转到指定页面
		 factory.setUnauthorizedUrl(unauthorizedUrl);
		 
		 // Shiro连接约束配置，即过滤约束的定义配置
		 LinkedHashMap<String, Filter> filters = new LinkedHashMap<String, Filter>();
		 filters.put("onlineSession", onlineSessionFilter());
		 filters.put("kaptchaValidate", kaptchaValidateFilter());
		 filters.put("kickout", kickoutSessionFilter());
		 filters.put("logout", sysLogoutFilter());
		 factory.setFilters(filters);
		 factory.setFilterChainDefinitionMap(filterMap);

		 return factory;
	 }

	 /**
	  * 开启Shiro注解支持
	  */
	 @Bean
	 public AuthorizationAttributeSourceAdvisor authorizationAttributeSourceAdvisor(SecurityManager securityManager) {
		 AuthorizationAttributeSourceAdvisor authorizationAttributeSourceAdvisor = new AuthorizationAttributeSourceAdvisor();
		 authorizationAttributeSourceAdvisor.setSecurityManager(securityManager);
		 return authorizationAttributeSourceAdvisor;
	 }

	 /**
	  * 开启shiro标签方言
	  * @return
	  */
	 @Bean
	 public ShiroDialect shiroDialect(){
		 return new ShiroDialect();
	 }

	 /**
	  * 退出过滤器
	  */
	 private SysLogoutFilter sysLogoutFilter() {
		 SysLogoutFilter logoutFilter = new SysLogoutFilter();
		 logoutFilter.setCacheManager(this.getCacheManager());
		 logoutFilter.setLoginUrl(loginUrl);
		 return logoutFilter;
	 }

	 /**
	  * 自定义在线用户处理过滤器
	  */
	 private OnlineSessionFilter onlineSessionFilter() {
		 OnlineSessionFilter onlineSessionFilter = new OnlineSessionFilter();
		 onlineSessionFilter.setSessionManager(this.sessionManager());
		 onlineSessionFilter.setLoginUrl(loginUrl);
		 return onlineSessionFilter;
	 }

	 /**
	  * 自定义验证码过滤器
	  */
	 private KaptchaValidateFilter kaptchaValidateFilter() {
		 KaptchaValidateFilter kaptchaValidateFilter = new KaptchaValidateFilter();
		 kaptchaValidateFilter.setKaptchaEnabled(kaptchaEnabled);
		 return kaptchaValidateFilter;
	 }

	 /**
	  * 同一个用户多设备登录限制
	  */
	 private KickoutSessionFilter kickoutSessionFilter() {
		 KickoutSessionFilter kickoutSessionFilter = new KickoutSessionFilter();
		 kickoutSessionFilter.setCacheManager(this.getCacheManager());
		 kickoutSessionFilter.setSessionManager(this.sessionManager());
		 // 同一个用户最大的会话数，默认-1无限制；比如2的意思是同一个用户允许最多同时两个人登录
		 kickoutSessionFilter.setMaxSession(maxSession);
		 // 是否踢出后来登录的，默认是false；即后者登录的用户踢出前者登录的用户；踢出顺序
		 kickoutSessionFilter.setKickoutAfter(kickoutAfter);
		 // 被踢出后重定向到的地址；
		 kickoutSessionFilter.setKickoutUrl(kickoutUrl);
		 return kickoutSessionFilter;
	 }

	 /**
	  * 记住我
	  */
	 private CookieRememberMeManager rememberMeManager() {
		 CookieRememberMeManager cookieRememberMeManager = new CookieRememberMeManager();
		 cookieRememberMeManager.setCookie(rememberMeCookie());
		 cookieRememberMeManager.setCipherKey(cookieName.getBytes());
		 return cookieRememberMeManager;
	 }

	 /**
	  * cookie 属性设置
	  */
	 private SimpleCookie rememberMeCookie() {
		 SimpleCookie cookie = new SimpleCookie(cookieName);
		 cookie.setDomain(domain);
		 cookie.setPath(cookiePath);
		 cookie.setHttpOnly(httpOnly);
		 cookie.setMaxAge(maxAge * 24 * 60 * 60);
		 return cookie;
	 }

	 public ShiroConfig() {
		 super();
		 ConfigService configService = SpringUtils.getBean(ConfigService.class);

		 try{
			 // Session超时时间，单位为毫秒（默认30分钟）
			 expireTime = Integer.parseInt(configService.getKey("shiro.session.expireTime"));
		 }catch (Exception e) {
			 log.warn(StringUtils.format("参数配置错误，使用默认配置shiro.session.expireTime=30"));
			 expireTime = 30;
		 }

		 try{
			 // 同一个用户最大会话数
			 maxSession = Integer.parseInt(configService.getKey("shiro.session.maxSession"));
		 }catch (Exception e) {
			 log.warn(StringUtils.format("参数配置错误，使用默认配置shiro.session.maxSession=-1"));
			 maxSession = -1;
		 }
		 try{
			 // 踢出之前登录的/之后登录的用户，默认踢出之前登录的用户
			 kickoutAfter = Boolean.parseBoolean(configService.getKey("shiro.session.kickoutAfter"));
		 }catch (Exception e) {
			 log.warn(StringUtils.format("参数配置错误，使用默认配置shiro.session.kickoutAfter=false"));
			 kickoutAfter = false;
		 }
		 // 踢出之后重定向地址
		 kickoutUrl = configService.getKey("shiro.session.kickoutUrl");
		 // 验证码开关
		 try{
			 kaptchaEnabled = Boolean.parseBoolean(configService.getKey("shiro.kaptcha.enabled"));
		 }catch (Exception e) {
			 log.warn(StringUtils.format("参数配置错误，使用默认配置shiro.kaptcha.enabled=false"));
			 kaptchaEnabled = false;
		 }
		 // 设置Cookie的名称
		 cookieName = configService.getKey("shiro.cookie.name");
		 // 设置Cookie的域名
		 domain = configService.getKey("shiro.cookie.domain");
		 // 设置cookie的有效访问路径
		 cookiePath = configService.getKey("shiro.cookie.path");
		 try{
			 // 设置HttpOnly属性
			 httpOnly = Boolean.parseBoolean(configService.getKey("shiro.cookie.httpOnly"));
		 }catch (Exception e) {
			 log.warn(StringUtils.format("参数配置错误，使用默认配置shiro.cookie.httpOnly=true"));
			 httpOnly = true;
		 }
		 try{
			 // 设置Cookie的过期时间，秒为单位
			 maxAge = Integer.parseInt(configService.getKey("shiro.cookie.maxAge"));
		 }catch (Exception e) {
			 log.warn(StringUtils.format("参数配置错误，使用默认配置shiro.cookie.maxAge=30"));
			 maxAge = 30;
		 }
		 // 登录地址
		 loginUrl = configService.getKey("shiro.user.loginUrl");
		 // 权限认证失败地址
		 unauthorizedUrl = configService.getKey("shiro.user.unauthorizedUrl");
		 //过滤约束
		 SysShiroService shiroService = SpringUtils.getBean(SysShiroService.class);
		 filterMap = shiroService.getShiroFilterMap();
	 }


}
