package com.daffodil.generator.service;

import java.util.List;
import java.util.Map;

import com.daffodil.core.entity.Query;
import com.daffodil.generator.entity.GenTable;

/**
 * 数据库表 服务
 * @author yweijian
 * @date 2020年5月15日
 * @version 1.0
 */
public interface IGenTableService {

	/**
	 * 查询数据库表列表
	 * @param query
	 * @return
	 */
	public List<GenTable> selectGenTableList(Query<GenTable> query);
	
	/**
	 * 查询数据库表信息
	 * @param id
	 * @return
	 */
	public GenTable selectGenTableById(String tableId);

	/**
	 * 新增数据库表
	 * @param table
	 */
	public void insertGenTable(GenTable table);

	/**
	 * 修改数据库表
	 * @param table
	 */
	public void updateGenTable(GenTable table);

	/**
	 * 删除数据库表信息
	 * @param ids
	 */
	public void deleteGenTableByIds(String[] ids);

	/**
	 * 代码生成（预览）
	 * @param tableId
	 * @return
	 */
	public Map<String, String> previewGenTableCode(String tableId);

	/**
	 * 代码生成
	 * @param tableId
	 * @return
	 */
	public byte[] generateGenTableCode(String tableId);
}
