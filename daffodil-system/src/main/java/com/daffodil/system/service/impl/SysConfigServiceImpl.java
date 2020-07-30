package com.daffodil.system.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.daffodil.core.constant.Constants;
import com.daffodil.core.dao.JpaDao;
import com.daffodil.core.entity.Query;
import com.daffodil.core.exception.BaseException;
import com.daffodil.framework.shiro.util.ShiroUtils;
import com.daffodil.system.entity.SysConfig;
import com.daffodil.system.service.ISysConfigService;
import com.daffodil.util.HqlUtils;
import com.daffodil.util.StringUtils;

/**
 * 参数配置实现
 * @author yweijian
 * @date 2019年12月16日
 * @version 1.0
 */
@Service
public class SysConfigServiceImpl implements ISysConfigService {
	
	@Autowired
	private JpaDao jpaDao;

	@Override
	public SysConfig selectConfigById(String configId) {
		return jpaDao.find(SysConfig.class, configId);
	}
	
	@Override
	@Cacheable(value = "system:config:cache", key = "#configKey")
	public String selectConfigByKey(String configKey) {
		SysConfig sysConfig = jpaDao.find("from SysConfig where configKey = ?", configKey, SysConfig.class);
		return StringUtils.isNotNull(sysConfig) ? sysConfig.getConfigValue() : "";
	}
	
	@Override
	public List<SysConfig> selectConfigList(Query<SysConfig> query) {
		StringBuffer hql = new StringBuffer("from SysConfig where 1=1 ");
		List<Object> paras = new ArrayList<Object>();
		HqlUtils.createHql(hql, paras, query);
		return jpaDao.search(hql.toString(), paras, SysConfig.class, query.getPage());
	}

	@Override
	@Transactional
	public void insertConfig(SysConfig config) {
		if (this.checkConfigKeyUnique(config)) {
			throw new BaseException("修改参数【" + config.getConfigName() + "】失败，参数键名已存在");
		}
		config.setCreateBy(ShiroUtils.getLoginName());
		config.setCreateTime(new Date());
		jpaDao.save(config);
	}

	@Override
	@Transactional
	@CacheEvict(value = "system:config:cache", key = "#config.configKey")
	public void updateConfig(SysConfig config) {
		if (this.checkConfigKeyUnique(config)) {
			throw new BaseException("修改参数【" + config.getConfigName() + "】失败，参数键名已存在");
		}
		config.setUpdateBy(ShiroUtils.getLoginName());
		config.setUpdateTime(new Date());
		jpaDao.update(config);
	}

	@Override
	@Transactional
	public void deleteConfigByIds(String[] ids) {
		jpaDao.delete(SysConfig.class, ids);
	}

	@Override
	public boolean checkConfigKeyUnique(SysConfig config) {
		List<Object> paras = new ArrayList<Object>();
		String hql = "from SysConfig where configKey = ? ";
		paras.add(config.getConfigKey());
		if(StringUtils.isNotEmpty(config.getId())){
			hql += "and id != ? ";
			paras.add(config.getId());
		}
		SysConfig sysConfig = jpaDao.find(hql, paras, SysConfig.class);
		if (StringUtils.isNotNull(sysConfig)) {
			return Constants.NOT_UNIQUE;
		}
		return Constants.IS_UNIQUE;
	}
}
