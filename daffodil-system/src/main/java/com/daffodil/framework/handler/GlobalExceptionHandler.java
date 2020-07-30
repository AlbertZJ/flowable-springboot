package com.daffodil.framework.handler;

import javax.servlet.http.HttpServletRequest;

import org.apache.catalina.connector.ClientAbortException;
import org.apache.shiro.authz.AuthorizationException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.validation.BindException;
import org.springframework.web.HttpRequestMethodNotSupportedException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;
import org.springframework.web.servlet.ModelAndView;

import com.daffodil.core.entity.JsonResult;
import com.daffodil.core.exception.BaseException;
import com.daffodil.core.exception.BusinessException;
import com.daffodil.framework.shiro.util.PermissionUtils;
import com.daffodil.util.ServletUtils;

/**
 * 系统全局异常处理器
 * @author yweijian
 * @date 2019年12月19日
 * @version 1.0
 */
@RestControllerAdvice
public class GlobalExceptionHandler {
	private static final Logger log = LoggerFactory.getLogger(GlobalExceptionHandler.class);

	/**
	 * 权限校验失败 如果请求为ajax返回json，普通请求跳转页面
	 */
	@ExceptionHandler(AuthorizationException.class)
	public Object handleAuthorizationException(HttpServletRequest request, AuthorizationException e) {
		log.error("权限校验失败[{}]", e.getMessage());
		if (ServletUtils.isAjaxRequest(request)) {
			return JsonResult.error(PermissionUtils.getMsg(e.getMessage()));
		} else {
			ModelAndView modelAndView = new ModelAndView();
			modelAndView.setViewName("error/unauth");
			return modelAndView;
		}
	}

	/**
	 * 请求方式不支持
	 */
	@ExceptionHandler({ HttpRequestMethodNotSupportedException.class })
	public JsonResult handleMethodNotSupportedException(HttpRequestMethodNotSupportedException e) {
		log.error("请求方式异常[{}]", e.getMessage());
		return JsonResult.error("请求方式异常，不支持【" + e.getMethod() + "】请求");
	}

	/**
	 * 拦截运行时异常
	 */
	@ExceptionHandler(RuntimeException.class)
	public JsonResult handleRuntimeException(RuntimeException e) {
		log.error("运行时异常[{}]", e);
		return JsonResult.error("系统运行错误，请联系管理员");
	}

	/**
	 * 拦截系统异常
	 */
	@ExceptionHandler(Exception.class)
	public JsonResult handleException(Exception e) {
		log.error(e.getMessage(), e);
		return JsonResult.error("服务器内部错误，请联系管理员");
	}

	/**
	 * 拦截业务异常
	 */
	@ExceptionHandler(BusinessException.class)
	public Object handleBusinessException(HttpServletRequest request, BusinessException e) {
		log.error(e.getMessage(), e);
		if (ServletUtils.isAjaxRequest(request)) {
			return JsonResult.error(e.getMessage());
		} else {
			ModelAndView modelAndView = new ModelAndView();
			modelAndView.addObject("errorMessage", e.getMessage());
			modelAndView.setViewName("error/business");
			return modelAndView;
		}
	}

	/**
	 * 拦截校验验证异常
	 */
	@ExceptionHandler(BindException.class)
	public JsonResult handleValidatedBindException(BindException e) {
		log.error("参数校验失败[{}]", e.getMessage());
		String message = e.getAllErrors().get(0).getDefaultMessage();
		return JsonResult.error(message);
	}
	
	/**
	 * 拦截自定义基础异常
	 */
	@ExceptionHandler(BaseException.class)
	public JsonResult handleBaseException(BaseException e) {
		log.error("系统基础异常[{}]", e.getMessage());
		return JsonResult.error(e.getDefaultMessage());
	}
	
	/**
	 * 客户端中止异常
	 */
	@ExceptionHandler(ClientAbortException.class)
	public void handleClientAbortException(ClientAbortException e){
		log.error("客户端中止异常[{}]", e.getMessage());
	}

}
