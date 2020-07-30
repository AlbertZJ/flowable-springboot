package com.daffodil.generator.service;

import java.util.List;

import com.daffodil.core.entity.Query;
import com.daffodil.generator.entity.GenMetaData;

/**
 * 元数据 服务
 * @author yweijian
 * @date 2020年5月15日
 * @version 1.0
 */
public interface IGenMetaDataService {

	/**
	 * 查询元数据列表
	 * @param query
	 * @return
	 */
	public List<GenMetaData> selectGenMetaDataList(Query<GenMetaData> query);
	
	/**
	 * 查询元数据信息
	 * @param id
	 * @return
	 */
	public GenMetaData selectGenMetaDataById(String id);

	/**
	 * 新增元数据
	 * @param metaData
	 */
	public void insertGenMetaData(GenMetaData metaData);

	/**
	 * 修改元数据
	 * @param metaData
	 */
	public void updateGenMetaData(GenMetaData metaData);

	/**
	 * 删除元数据信息
	 * @param ids
	 */
	public void deleteGenMetaDataByIds(String[] ids);
}
