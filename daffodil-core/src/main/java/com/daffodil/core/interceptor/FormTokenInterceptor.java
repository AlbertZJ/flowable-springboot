package com.daffodil.core.interceptor;

import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.alibaba.fastjson.JSONObject;
import com.daffodil.core.annotation.FormToken;
import com.daffodil.core.annotation.FormToken.TokenType;
import com.daffodil.util.ServletUtils;

/**
 * 防止表单重复提交拦截器实现
 * @author yweijian
 * @date 2019年8月29日
 * @version 1.0
 */
public class FormTokenInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		if (handler instanceof HandlerMethod) {
			HandlerMethod handlerMethod = (HandlerMethod) handler;
			Method method = handlerMethod.getMethod();
			FormToken formToken = method.getAnnotation(FormToken.class);
			if (formToken != null) {
				TokenType value = formToken.value();
				if (TokenType.CREATE.equals(value)) {
					request.getSession().setAttribute(FormToken.TOKEN, UUID.randomUUID().toString());
				}
				if (TokenType.DESTROY.equals(value)) {
					if (isRepeatSubmit(request)) {
						Map<String, Object> result = new HashMap<String, Object>();
						result.put("code", 500);
						result.put("msg", "不允许重复提交，请稍后再试");
						ServletUtils.renderString(response, JSONObject.toJSONString(result));
						return false;
					}
					request.getSession().removeAttribute(FormToken.TOKEN);
				}
			}
			return true;
		} else {
			return super.preHandle(request, response, handler);
		}
	}

	private boolean isRepeatSubmit(HttpServletRequest request) {
		String serverToken = (String) request.getSession().getAttribute(FormToken.TOKEN);
		if (serverToken == null) {
			return true;
		}
		String clinetToken = request.getParameter(FormToken.TOKEN);
		if (clinetToken == null) {
			return true;
		}
		if (!serverToken.equals(clinetToken)) {
			return true;
		}
		return false;
	}

}
