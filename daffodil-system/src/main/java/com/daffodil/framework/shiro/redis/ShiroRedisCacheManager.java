package com.daffodil.framework.shiro.redis;

import org.apache.shiro.cache.AbstractCacheManager;
import org.apache.shiro.cache.CacheException;

/**
 * redis 缓存管理
 * @author yweijian
 * @date 2020年5月28日
 * @version 1.0
 */
public class ShiroRedisCacheManager extends AbstractCacheManager  {

	private ShiroRedisTemplate shiroRedisTemplate;

	public ShiroRedisCacheManager(ShiroRedisTemplate shiroRedisTemplate){
		this.shiroRedisTemplate = shiroRedisTemplate;
	}

	@Override
	protected ShiroRedisCache createCache(String name) throws CacheException {
		return new ShiroRedisCache(shiroRedisTemplate, name);
	}

	@Override
	public ShiroRedisCache getCache(String name) throws IllegalArgumentException, CacheException {
		return new ShiroRedisCache(shiroRedisTemplate, name);
	}

}
