package com.daffodil.system.controller.web;

import java.awt.image.BufferedImage;
import java.io.IOException;
import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.daffodil.system.controller.SystemController;
import com.google.code.kaptcha.Constants;
import com.google.code.kaptcha.Producer;

/**
 * 图片验证码控制层
 * 
 * @author yweijian
 * @date 2019年8月18日
 * @version 1.0
 */
@Controller
@RequestMapping("/kaptcha")
public class SysKaptchaController extends SystemController {

	@Resource(name = "kaptchaProducer")
	private Producer kaptchaProducer;

	@Value("${shiro.kaptcha.type}")
	private String kaptchaType;

	/**
	 * 验证码生成
	 */
	@GetMapping(value = "/kaptchaImage")
	public ModelAndView getKaptchaImage(HttpServletRequest request, HttpServletResponse response) {
		ServletOutputStream out = null;
		try {
			HttpSession session = request.getSession();
			response.setDateHeader("Expires", 0);
			response.setHeader("Cache-Control", "no-store, no-cache, must-revalidate");
			response.addHeader("Cache-Control", "post-check=0, pre-check=0");
			response.setHeader("Pragma", "no-cache");
			response.setContentType("image/jpeg");

			String code = null;
			BufferedImage img = null;
			if ("math".equalsIgnoreCase(kaptchaType)) {
				String text = kaptchaProducer.createText();
				String kaptcha = text.substring(0, text.lastIndexOf("@"));
				code = text.substring(text.lastIndexOf("@") + 1);
				img = kaptchaProducer.createImage(kaptcha);
			} else {
				String kaptcha = code = kaptchaProducer.createText();
				img = kaptchaProducer.createImage(kaptcha);
			}
			session.setAttribute(Constants.KAPTCHA_SESSION_KEY, code);
			out = response.getOutputStream();
			ImageIO.write(img, "jpg", out);
			out.flush();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (out != null) {
					out.close();
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return null;
	}
}