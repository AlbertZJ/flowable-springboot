package com.daffodil.generator.service;

import java.util.List;

import com.daffodil.core.entity.Query;
import com.daffodil.generator.entity.GenTableColumn;


/**
 * 业务字段 服务层
 * @author yweijian
 * @date 2020年5月13日
 * @version 1.0
 */
public interface IGenTableColumnService {
	/**
	 * 查询业务字段列表
	 * @param query 业务字段信息
	 * @return 业务字段集合
	 */
	public List<GenTableColumn> selectGenTableColumnList(Query<GenTableColumn> query);
	
	/**
	 * 根据id查询业务字段
	 * @param columnId
	 * @return
	 */
	public GenTableColumn selectGenTableColumnById(String columnId);

	/**
	 * 根据元数据ids批量新增业务字段
	 * @param columnIds 元数据的ID
	 * @param tableId
	 */
	public void insertGenTableColumnByIds(String[] columnIds, String tableId);

	/**
	 * 修改业务字段
	 * @param tableColumn 业务字段信息
	 */
	public void updateGenTableColumn(GenTableColumn tableColumn);

	/**
	 * 删除业务字段信息
	 * @param ids  需要删除的数据ID
	 * @return 结果
	 */
	public void deleteGenTableColumnByIds(String[] ids);

}
