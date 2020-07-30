package com.daffodil.framework.shiro.redis;

import org.springframework.data.redis.connection.DefaultStringRedisConnection;
import org.springframework.data.redis.connection.RedisConnection;
import org.springframework.data.redis.connection.RedisConnectionFactory;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.serializer.JdkSerializationRedisSerializer;

/**
 * 针对Shiro权限控制管理的Redis缓存模板
 * 默认使用JdkSerializationRedisSerializer序列
 * @author yweijian
 * @date 2020年5月29日
 * @version 1.0
 */
public class ShiroRedisTemplate extends RedisTemplate<Object, Object>{

	/**
	 * 默认构造器
	 * 默认使用JdkSerializationRedisSerializer序列
	 */
	public ShiroRedisTemplate() {
		JdkSerializationRedisSerializer fastJsonRedisSerializer = new JdkSerializationRedisSerializer();
		super.setKeySerializer(fastJsonRedisSerializer);
		super.setValueSerializer(fastJsonRedisSerializer);
		super.setHashKeySerializer(fastJsonRedisSerializer);
		super.setHashValueSerializer(fastJsonRedisSerializer);
	}

	/**
	 * 
	 * @param connectionFactory
	 */
	public ShiroRedisTemplate(RedisConnectionFactory connectionFactory) {
		this();
		super.setConnectionFactory(connectionFactory);
		super.afterPropertiesSet();
	}

	/**
	 * 
	 */
	protected RedisConnection preProcessConnection(RedisConnection connection, boolean existingConnection) {
		return new DefaultStringRedisConnection(connection);
	}
}
