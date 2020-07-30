package com.daffodil.system.service;

import java.util.List;

import com.daffodil.core.entity.Query;
import com.daffodil.core.entity.Ztree;
import com.daffodil.system.entity.SysDictionary;

/**
 * 字典 业务层服务
 * @author yweijian
 * @date 2019年12月18日
 * @version 1.0
 */
public interface ISysDictionaryService{
	
	/**
	 * 根据查询条件查询字典列表
	 * @param query
	 * @return
	 */
	public List<SysDictionary> selectDictionaryList(Query<SysDictionary> query);
	
	/**
	 * 根据字典ID查询信息
	 * @param dictId 亦或是dictLabel
	 * @return
	 */
	public SysDictionary selectDictionaryById(String dictId);
	
	/**
	 * 新增保存字典信息
	 * @param dictionary
	 */
	public void insertDictionary(SysDictionary dictionary);
	
	/**
	 * 删除字典管理信息
	 * @param dictId
	 */
	public void deleteDictionaryById(String dictId);

	/**
	 * 修改保存字典信息
	 * @param dictionary
	 */
	public void updateDictionary(SysDictionary dictionary);
	
	/**
	 * 查询所有字典树
	 * @param query
	 * @return
	 */
	public List<Ztree> dictionaryTreeData(Query<SysDictionary> query);

	/**
	 * 根据字典类型查询信息
	 * @param dictLabel
	 * @return
	 */
	public List<SysDictionary> selectDictionaryByLabel(String dictLabel);

	/**
	 * 检查字典目录键值是否唯一
	 * @param dictionary
	 * @return
	 */
	public boolean checkDictionaryLabelUnique(SysDictionary dictionary);

}
