package com.daffodil.framework.config;

import org.springframework.cache.annotation.EnableCaching;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.redis.connection.lettuce.LettuceConnectionFactory;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.serializer.JdkSerializationRedisSerializer;
import org.springframework.data.redis.serializer.StringRedisSerializer;

import com.daffodil.framework.shiro.redis.ShiroRedisTemplate;

/**
 * Redis缓存模板配置
 * @author yweijian
 * @date 2020年5月28日
 * @version 1.0
 */
@Configuration
@EnableCaching
public class RedisConfig{

	/**
	 * 常用的缓存配置
	 * @param lettuceConnectionFactory
	 * @return
	 */
	@Bean
	public RedisTemplate<String, Object> redisTemplate(LettuceConnectionFactory lettuceConnectionFactory) {
		RedisTemplate<String, Object> redisTemplate = new RedisTemplate<String, Object>();
		JdkSerializationRedisSerializer fastJsonRedisSerializer = new JdkSerializationRedisSerializer();
		StringRedisSerializer stringRedisSerializer = new StringRedisSerializer();
		
		redisTemplate.setKeySerializer(stringRedisSerializer);
		redisTemplate.setValueSerializer(fastJsonRedisSerializer);

		redisTemplate.setHashKeySerializer(stringRedisSerializer);
		redisTemplate.setHashValueSerializer(fastJsonRedisSerializer);

		redisTemplate.setConnectionFactory(lettuceConnectionFactory);
		redisTemplate.afterPropertiesSet();
		return redisTemplate;
	}
	
	/**
	 * 针对Shiro权限控制的缓存模板
	 * @return
	 */
	@Bean
	public ShiroRedisTemplate shiroRedisTemplate(LettuceConnectionFactory lettuceConnectionFactory){
		return new ShiroRedisTemplate(lettuceConnectionFactory);
	}
	
}
