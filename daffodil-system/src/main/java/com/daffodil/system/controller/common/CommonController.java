package com.daffodil.system.controller.common;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.daffodil.core.entity.JsonResult;
import com.daffodil.util.ServletUtils;
import com.daffodil.util.StringUtils;
import com.daffodil.util.file.FileUploadUtils;
import com.daffodil.util.file.FileUtils;

/**
 * 公共通用请求 控制器
 * 
 * @author yweijian
 * @date 2019年8月18日
 * @version 1.0
 */
@Controller
public class CommonController {
	
	private static final Logger log = LoggerFactory.getLogger(CommonController.class);

	@Value("${spring.servlet.upload.file-path}")
	private String uploadFilePath;

	/**
	 * 通用下载请求
	 * 
	 * @param fileName
	 *            文件名称
	 * @param delete
	 *            是否删除
	 */
	@GetMapping("common/download")
	public void fileDownload(String fileName, Boolean delete, HttpServletResponse response, HttpServletRequest request) {
		try {
			if (!FileUtils.isValidFilename(fileName)) {
				throw new Exception(StringUtils.format("文件名称({})非法，不允许下载。 ", fileName));
			}
			String realFileName = System.currentTimeMillis() + fileName.substring(fileName.indexOf("_") + 1);
			String filePath = System.getProperty("java.io.tmpdir") + fileName;

			response.setCharacterEncoding("utf-8");
			response.setContentType("multipart/form-data");
			response.setHeader("Content-Disposition", "attachment;fileName=" + FileUtils.setFileDownloadHeader(request, realFileName));
			FileUtils.writeBytes(filePath, response.getOutputStream());
			if (delete) {
				FileUtils.deleteFile(filePath);
			}
		} catch (Exception e) {
			log.error("下载文件失败", e);
		}
	}

	/**
	 * 通用上传请求
	 */
	@PostMapping("/common/upload")
	@ResponseBody
	public JsonResult uploadFile(MultipartFile file) throws Exception {
		try {
			// 上传并返回新文件名称
			String fileName = FileUploadUtils.upload(uploadFilePath, file);
			String url = ServletUtils.getServletUrl() + fileName;
			JsonResult result = JsonResult.success();
			result.put("fileName", fileName);
			result.put("url", url);
			return result;
		} catch (Exception e) {
			return JsonResult.error(e.getMessage());
		}
	}
	
	/**
	 * 通用预览(图片使用)
	 * @param filename
	 * @param response
	 */
	@GetMapping("common/preview")
	public void preview(String filename,HttpServletResponse response){
		if(StringUtils.isEmpty(filename)){
			return;
		}
		try {
			String filePath = uploadFilePath + File.separator + filename;
			FileUtils.writeBytes(filePath, response.getOutputStream());
		} catch (IOException e) {
			log.error("预览文件失败", e);
		}
	}
}
