package com.daffodil.system.service;

import java.util.List;

import com.daffodil.core.entity.Query;
import com.daffodil.system.entity.SysConfig;

/**
 * 参数配置服务
 * 
 * @author yweijian
 * @date 2019年8月15日
 * @version 1.0
 */
public interface ISysConfigService {
	/**
	 * 根据ID查询参数配置信息
	 * @param configId
	 * @return
	 */
	public SysConfig selectConfigById(String configId);

	/**
	 * 根据键名查询参数配置信息
	 * @param configKey
	 * @return
	 */
	public String selectConfigByKey(String configKey);

	/**
	 * 根据查询条件分页查询参数配置列表
	 * @param query
	 * @return
	 */
	public List<SysConfig> selectConfigList(Query<SysConfig> query);
	
	/**
	 * 新增参数配置
	 * @param config
	 * @return
	 */
	public void insertConfig(SysConfig config);

	/**
	 * 修改参数配置
	 * @param config
	 * @return
	 */
	public void updateConfig(SysConfig config);

	/**
	 * 批量删除参数配置信息
	 * @param ids
	 * @return
	 */
	public void deleteConfigByIds(String[] ids);

	/**
	 * 校验参数键名是否唯一
	 * @param config
	 * @return
	 */
	public boolean checkConfigKeyUnique(SysConfig config);
	
}
