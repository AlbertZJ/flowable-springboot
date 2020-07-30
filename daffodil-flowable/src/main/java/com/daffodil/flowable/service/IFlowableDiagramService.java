package com.daffodil.flowable.service;

import java.io.InputStream;

/**
 * 流程图
 * @author yweijian
 * @date 2020年1月20日
 * @version 1.0
 */
public interface IFlowableDiagramService {

	/**
	 * 根据业务Id,获取实时流程图片
	 * @param businessKey
	 * @return
	 */
	public InputStream getFlowableDiagramByBusinessKey(String businessKey);
}
