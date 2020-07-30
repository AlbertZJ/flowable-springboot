package com.daffodil.framework.aspectj;

import java.lang.reflect.Method;
import java.util.Date;
import java.util.Map;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.Signature;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.aspectj.lang.reflect.MethodSignature;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import com.alibaba.fastjson.JSONObject;
import com.daffodil.core.annotation.Log;
import com.daffodil.core.annotation.Log.BusinessType;
import com.daffodil.core.exception.BaseException;
import com.daffodil.framework.shiro.service.SysShiroService;
import com.daffodil.framework.shiro.util.ShiroUtils;
import com.daffodil.system.entity.SysOperLog;
import com.daffodil.system.entity.SysUser;
import com.daffodil.util.AddressUtils;
import com.daffodil.util.ServletUtils;
import com.daffodil.util.StringUtils;

/**
 * 操作日志记录
 * 
 * @author yweijian
 * @date 2019年8月25日
 * @version 1.0
 */
@Aspect
@Component
public class LogAspect {
	
	private static final Logger log = LoggerFactory.getLogger(LogAspect.class);

	private static String SUCCESS = "0";
	private static String ERROR = "1";
	
	/**
	 * 是否演示模式，演示模式下无法删除数据
	 */
	@Value("${shiro.demo.mode: false}")
	private boolean demoMode;
	
	@Autowired
	private SysShiroService shiroService;

	/**
	 * 配置织入点
	 */
	@Pointcut("@annotation(com.daffodil.core.annotation.Log)")
	public void logPointCut() {
		
	}
	
	/**
	 * 请求之前
	 * @param point
	 * @throws Throwable
	 */
	@Before("logPointCut()")
	public void doBefore(JoinPoint point) throws Throwable {
		if(demoMode){
			Log log = this.getAnnotationLog(point);
			if (log == null) {
				return;
			}
			
			BusinessType type = log.businessType();
			if(BusinessType.DELETE.equals(type) || BusinessType.CLEAN.equals(type)){
				throw new BaseException("演示模式下不允许操作");
			}
		}
	}

	/**
	 * 处理完请求后执行
	 * @param joinPoint
	 */
	@AfterReturning(pointcut = "logPointCut()")
	public void doAfterReturning(JoinPoint joinPoint) {
		this.handleLog(joinPoint, null);
	}

	/**
	 * 拦截异常操作
	 * @param joinPoint
	 * @param e
	 */
	@AfterThrowing(value = "logPointCut()", throwing = "exception")
	public void doAfterThrowing(JoinPoint joinPoint, Exception exception) {
		this.handleLog(joinPoint, exception);
	}

	protected void handleLog(final JoinPoint joinPoint, final Exception exception) {
		try {
			Log log = this.getAnnotationLog(joinPoint);
			if (log == null) {
				return;
			}

			SysOperLog operLog = new SysOperLog();
			operLog.setOperIp(ShiroUtils.getIp());
			operLog.setOperUrl(ServletUtils.getRequest().getRequestURI());
			// 获取当前的用户
			SysUser user = ShiroUtils.getSysUser();
			if (user != null) {
				operLog.setOperName(user.getLoginName());
			}
			// 设置方法名称
			String className = joinPoint.getTarget().getClass().getName();
			String methodName = joinPoint.getSignature().getName();
			operLog.setMethod(className + "." + methodName + "()");
			// 设置业务动作
			operLog.setBusinessType(String.valueOf(log.businessType().ordinal()));
			// 设置标题
			operLog.setTitle(log.title());
			// 设置操作人类别
			operLog.setOperatorType(String.valueOf(log.operatorType().ordinal()));
			// 是否需要保存request，参数和值
			if (log.isSaveRequestData()) {
				// 获取参数的信息，传入到数据库中。
				Map<String, String[]> map = ServletUtils.getRequest().getParameterMap();
				String params = JSONObject.toJSONString(map);
				operLog.setOperParam(StringUtils.substring(params, 0, 2048));
			}
			// 获取真实地址
			operLog.setOperLocation(AddressUtils.getRealAddressByIP(operLog.getOperIp()));
			if (exception != null) {
				operLog.setStatus(ERROR);
				operLog.setErrorMsg(StringUtils.substring(exception.getMessage(), 0, 1024));
			}else{
				operLog.setStatus(SUCCESS);
			}
			// 设置操作时间
			operLog.setCreateTime(new Date());
			// 保存数据库
			shiroService.recordOperLog(operLog);
		} catch (Exception e) {
			// 记录本地异常日志
			log.error("异常信息:{}", e.getMessage());
		}
	}

	/**
	 * 是否存在注解，如果存在就获取日志
	 * @param joinPoint
	 * @return
	 * @throws Exception
	 */
	private Log getAnnotationLog(JoinPoint joinPoint) throws Exception {
		Signature signature = joinPoint.getSignature();
		MethodSignature methodSignature = (MethodSignature) signature;
		Method method = methodSignature.getMethod();

		if (method != null) {
			return method.getAnnotation(Log.class);
		}
		return null;
	}
}
