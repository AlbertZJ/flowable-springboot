package com.daffodil.framework.shiro.filter;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import org.apache.shiro.web.filter.AccessControlFilter;
import com.google.code.kaptcha.Constants;
import com.daffodil.core.constant.ShiroConstants;
import com.daffodil.framework.shiro.util.ShiroUtils;
import com.daffodil.util.StringUtils;

/**
 * 验证码过滤器
 * 
 * @author yweijian
 * @date 2019年8月21日
 * @version 1.0
 */
public class KaptchaValidateFilter extends AccessControlFilter {
	/**
	 * 是否开启验证码
	 */
	private boolean kaptchaEnabled = true;

	public void setKaptchaEnabled(boolean kaptchaEnabled) {
		this.kaptchaEnabled = kaptchaEnabled;
	}

	@Override
	public boolean onPreHandle(ServletRequest request, ServletResponse response, Object mappedValue) throws Exception {
		request.setAttribute(ShiroConstants.CURRENT_ENABLED, kaptchaEnabled);
		return super.onPreHandle(request, response, mappedValue);
	}

	@Override
	protected boolean isAccessAllowed(ServletRequest request, ServletResponse response, Object mappedValue) throws Exception {
		HttpServletRequest httpServletRequest = (HttpServletRequest) request;
		// 验证码禁用 或不是表单提交 允许访问
		if (kaptchaEnabled == false || !"post".equals(httpServletRequest.getMethod().toLowerCase())) {
			return true;
		}
		return validateResponse(httpServletRequest,httpServletRequest.getParameter(ShiroConstants.CURRENT_VALIDATECODE));
	}

	public boolean validateResponse(HttpServletRequest request, String validateCode) {
		Object obj = ShiroUtils.getSession().getAttribute(Constants.KAPTCHA_SESSION_KEY);
		String code = String.valueOf(obj != null ? obj : "");
		if (StringUtils.isEmpty(validateCode) || !validateCode.equalsIgnoreCase(code)) {
			return false;
		}
		return true;
	}

	@Override
	protected boolean onAccessDenied(ServletRequest request, ServletResponse response) throws Exception {
		request.setAttribute(ShiroConstants.CURRENT_CAPTCHA, ShiroConstants.CAPTCHA_ERROR);
		return true;
	}
}
