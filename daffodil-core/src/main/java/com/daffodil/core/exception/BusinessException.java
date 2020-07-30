package com.daffodil.core.exception;

/**
 * 业务运行异常
 * @author yweijian
 * @date 2019年12月12日
 * @version 1.0
 */
public class BusinessException extends RuntimeException {
	
	private static final long serialVersionUID = 1L;

	protected final String message;
	
	@Override
	public String getMessage() {
		return message;
	}

	public BusinessException(String message) {
		this.message = message;
	}

	public BusinessException(String message, Exception e){
		super("[" + message + "]", e);
		this.message = ("[" + message + "]" + BusinessException.printException(e));
	}
	
	/**
	 * 打印异常栈
	 * @param e
	 * @return
	 */
	private static String printException(Exception e){
		String detail = e.toString() + "\n";
		StackTraceElement[] trace = e.getStackTrace();
		for (int i = 0; i < trace.length; i++) {
			detail = detail + "\tat " + trace[i].toString() + "\n";
		}
		return detail;
	}
}
