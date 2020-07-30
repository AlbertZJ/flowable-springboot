package com.daffodil.util.file;

import java.io.File;
import java.io.IOException;
import java.util.Arrays;
import java.util.Properties;

import org.apache.commons.io.FilenameUtils;
import org.apache.ibatis.io.Resources;
import org.apache.tomcat.util.http.fileupload.FileUploadException;
import org.springframework.web.multipart.MultipartFile;

import com.daffodil.util.DateUtils;
import com.daffodil.util.Md5Utils;
import com.daffodil.util.ServletUtils;
import com.daffodil.util.StringUtils;

/**
 * 文件上传工具类
 * 
 * @author yweijian
 * @date 2019年8月18日
 * @version 1.0
 */
public class FileUploadUtils {
	/**
	 * 默认大小 50M
	 */
	public static final long DEFAULT_MAX_SIZE = 50 * 1024 * 1024;

	/**
	 * 默认的文件名最大长度 100
	 */
	public static final int DEFAULT_FILE_NAME_LENGTH = 100;

	/**
	 * 默认存储的地址
	 */
	private static String defaultBaseDir = "";

	private static int counter = 0;

	public static void setDefaultBaseDir(String defaultBaseDir) {
		FileUploadUtils.defaultBaseDir = defaultBaseDir;
	}
	
	/**
	 * 默认相对路径
	 * @return
	 */
	public static String getDefaultBaseDir() {
		try {
			Properties properties = Resources.getResourceAsProperties("application-system.properties");
			defaultBaseDir = properties.getProperty("spring.servlet.upload.file-path");
		} catch (IOException e) {
			e.printStackTrace();
		}
		if(StringUtils.isEmpty(defaultBaseDir)){
			defaultBaseDir = ServletUtils.getRealPath() + File.separator + "upload";
		}
		return defaultBaseDir;
	}

	/**
	 * 以默认配置进行文件上传
	 *
	 * @param file
	 *            上传的文件
	 * @return 文件名称
	 * @throws Exception
	 */
	public static final String upload(MultipartFile file) throws IOException {
		try {
			return upload(getDefaultBaseDir(), file, MimeTypeUtils.DEFAULT_ALLOWED_EXTENSION);
		} catch (Exception e) {
			throw new IOException(e.getMessage(), e);
		}
	}

	/**
	 * 根据文件路径上传
	 *
	 * @param baseDir
	 *            相对应用的基目录
	 * @param file
	 *            上传的文件
	 * @return 文件名称
	 * @throws IOException
	 */
	public static final String upload(String baseDir, MultipartFile file) throws IOException {
		try {
			return upload(baseDir, file, MimeTypeUtils.DEFAULT_ALLOWED_EXTENSION);
		} catch (Exception e) {
			throw new IOException(e.getMessage(), e);
		}
	}

	/**
	 * 文件上传
	 *
	 * @param baseDir
	 *            相对应用的基目录
	 * @param file
	 *            上传的文件
	 * @param extension
	 *            上传文件类型
	 * @return 返回上传成功的文件名
	 */
	public static final String upload(String baseDir, MultipartFile file, String[] allowedExtension)
			throws FileUploadException, IOException {
		int fileNamelength = file.getOriginalFilename().length();
		if (fileNamelength > FileUploadUtils.DEFAULT_FILE_NAME_LENGTH) {
			throw new FileUploadException("默认的文件名最大长度为" + FileUploadUtils.DEFAULT_FILE_NAME_LENGTH + "，实际为" + fileNamelength);
		}

		assertAllowed(file, allowedExtension);

		String fileName = extractFilename(file);

		File desc = getAbsoluteFile(baseDir, fileName);
		file.transferTo(desc);
		return fileName;
	}

	/**
	 * 编码文件名
	 */
	public static final String extractFilename(MultipartFile file) {
		String fileName = file.getOriginalFilename();
		String extension = getExtension(file);
		fileName = DateUtils.datePath() + "/" + encodingFilename(fileName) + "." + extension;
		return fileName;
	}

	private static final File getAbsoluteFile(String uploadDir, String fileName) throws IOException {
		File desc = new File(uploadDir + File.separator + fileName);

		if (!desc.getParentFile().exists()) {
			desc.getParentFile().mkdirs();
		}
		if (!desc.exists()) {
			desc.createNewFile();
		}
		return desc;
	}

	/**
	 * 编码文件名
	 */
	private static final String encodingFilename(String fileName) {
		fileName = fileName.replace("_", " ");
		fileName = Md5Utils.hash(fileName + System.nanoTime() + counter++);
		return fileName;
	}

	/**
	 * 文件大小校验
	 *
	 * @param file
	 *            上传的文件
	 * @return
	 * @throws FileUploadException
	 */
	public static final void assertAllowed(MultipartFile file, String[] allowedExtension) throws FileUploadException {
		long size = file.getSize();
		if (DEFAULT_MAX_SIZE != -1 && size > DEFAULT_MAX_SIZE) {
			throw new FileUploadException("默认大小为" + (DEFAULT_MAX_SIZE / 1024 / 1024) + "M，实际为" + (size / 1024 / 1024) + "M");
		}

		String fileName = file.getOriginalFilename();
		String extension = getExtension(file);
		if (allowedExtension != null && !isAllowedExtension(extension, allowedExtension)) {
			throw new FileUploadException("允许文件格式" + Arrays.toString(allowedExtension) + "，上传文件名为" + fileName);
		}

	}

	/**
	 * 判断MIME类型是否是允许的MIME类型
	 *
	 * @param extension
	 * @param allowedExtension
	 * @return
	 */
	public static final boolean isAllowedExtension(String extension, String[] allowedExtension) {
		for (String str : allowedExtension) {
			if (str.equalsIgnoreCase(extension)) {
				return true;
			}
		}
		return false;
	}

	/**
	 * 获取文件名的后缀
	 * 
	 * @param file
	 *            表单文件
	 * @return 后缀名
	 */
	public static final String getExtension(MultipartFile file) {
		String extension = FilenameUtils.getExtension(file.getOriginalFilename());
		if (StringUtils.isEmpty(extension)) {
			extension = MimeTypeUtils.getExtension(file.getContentType());
		}
		return extension;
	}
}