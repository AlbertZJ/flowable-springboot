package com.daffodil.framework.shiro.redis;

import java.time.Duration;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Set;

import org.apache.shiro.cache.Cache;
import org.apache.shiro.cache.CacheException;

/**
 * 
 * @author yweijian
 * @date 2020年5月28日
 * @version 1.0
 */
public class ShiroRedisCache implements Cache<Object, Object> {

	private ShiroRedisTemplate shiroRedisTemplate;
	
	private String prefix = "";
	
	private Object getKey(Object key){
		return prefix + key;
	}
	
	/**
	 * 构造器
	 * @param shiroRedisTemplate
	 * @param prefix 缓存前缀
	 */
	ShiroRedisCache(ShiroRedisTemplate shiroRedisTemplate, String name) {
		this.shiroRedisTemplate = shiroRedisTemplate;
		this.prefix = name;
	}

	@Override
	public Object get(Object key) throws CacheException {
		if (key == null) {
			return null;
		}
		return shiroRedisTemplate.opsForValue().get(this.getKey(key));
	}

	@Override
	public Object put(Object key, Object value) throws CacheException {
		if (key == null || value == null) {
			return null;
		}
		shiroRedisTemplate.opsForValue().set(this.getKey(key), value);
		return value;
	}
	
	public Object put(Object key, Object value, Duration timeout) throws CacheException {
		if (key == null || value == null) {
			return null;
		}
		shiroRedisTemplate.opsForValue().set(this.getKey(key), value, timeout);
		return value;
	}

	@Override
	public Object remove(Object key) throws CacheException {
		if (key == null) {
			return null;
		}
		Object value = shiroRedisTemplate.opsForValue().get(this.getKey(key));
		shiroRedisTemplate.delete(this.getKey(key));
		return value;
	}

	@Override
	public void clear() throws CacheException {
		shiroRedisTemplate.delete(this.keys());
	}

	@Override
	public int size() {
		return this.keys().size();
	}

	@Override
	public Set<Object> keys() {
		return shiroRedisTemplate.keys(prefix + "*");
	}

	@Override
	public Collection<Object> values() {
		Set<Object> keys = keys();
		List<Object> values = new ArrayList<>(keys.size());
		for (Object key : keys) {
			values.add(shiroRedisTemplate.opsForValue().get(this.getKey(key)));
		}
		return values;
	}
	
	/**
	 * 是否含有key
	 * @param key
	 * @return
	 */
	public Boolean hasKey(String key){
		return shiroRedisTemplate.hasKey(this.getKey(key));
	}
}
