package com.daffodil.util;

import java.lang.reflect.Method;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.daffodil.core.annotation.Hql;
import com.daffodil.core.annotation.Hql.Logical;
import com.daffodil.core.entity.Query;
import com.daffodil.util.text.Convert;

/**
 * hql操作辅助工具类
 * 
 * @author yweijian
 * @date 2019年8月18日
 * @version 1.0
 */
public class HqlUtils {
	
	private static final Logger log = LoggerFactory.getLogger(HqlUtils.class);
	
	/**
	 * 仅支持字母、数字、下划线、空格、逗号（支持多个字段排序）
	 */
	public static String HQL_PATTERN = "[a-zA-Z0-9_\\ \\,]+";

	/**
	 * 检查字符，防止注入绕过
	 */
	public static String escapeOrderByHql(String value) {
		if (StringUtils.isNotEmpty(value) && !isValidOrderByHql(value)) {
			return "";
		}
		return value;
	}

	/**
	 * 验证 order by 语法是否符合规范
	 */
	public static boolean isValidOrderByHql(String value) {
		return value.matches(HQL_PATTERN);
	}
	
	/**
	 * 生成辅助的hql条件语句
	 * @param hql 
	 * @param paras 
	 * @param query 
	 */
	public static void createHql(StringBuffer hql, List<Object> paras, Query<?> query){
		createHql(hql, paras, query, "");
	}
	/**
	 * 生成辅助的hql条件语句
	 * @param hql 
	 * @param paras
	 * @param query
	 * @param alias 别名
	 */
	public static void createHql(StringBuffer hql, List<Object> paras, Query<?> query, String alias){
		Object entity = query.getEntity();
		if(StringUtils.isNotNull(entity)){
			createHql(hql, paras, entity, alias);
		}
		
		if(StringUtils.isNotEmpty(alias)){
			alias = alias.trim() + ".";
		}else{
			alias = "";
		}
		
		if(StringUtils.isNotNull(query.getStartTime())){
			hql.append(StringUtils.format(" and {}createTime >= ? ", alias));
			paras.add(query.getStartTime());
		}
		if(StringUtils.isNotNull(query.getEndTime())){
			hql.append(StringUtils.format(" and {}createTime <= ? ", alias));
			paras.add(query.getEndTime());
		}
		if(StringUtils.isNotEmpty(query.getDataScope())){
			hql.append(query.getDataScope());
		}
		if(StringUtils.isNotEmpty(query.getOrderBy())){
			hql.append(StringUtils.format(" order by {}{}", alias, query.getOrderBy()));
		}
	}
	
	/**
	 * 生成辅助的hql条件语句
	 * @param hql
	 * @param paras
	 * @param entity
	 * @param alias
	 */
	public static void createHql(StringBuffer hql, List<Object> paras, Object entity, String alias){
		if(StringUtils.isNull(entity)){
			return;
		}
		if(StringUtils.isNotEmpty(alias)){
			alias = alias.trim() + ".";
		}else{
			alias = "";
		}
		Method[] methods = entity.getClass().getMethods();
		if(StringUtils.isNotEmpty(methods)){
			for(Method method : methods){
				Hql annotation = method.getAnnotation(Hql.class);
				if(StringUtils.isNotNull(annotation)){
					Logical logical = annotation.type();
					String field = method.getName().substring(3, 4).toLowerCase() + method.getName().substring(4);
					try {
						Object value = method.invoke(entity);
						if(value instanceof String){
							if(StringUtils.isNotNull(value) && StringUtils.isNotEmpty(value.toString())){
								if(Logical.LIKE.name().equals(logical.name())){
									hql.append(StringUtils.format(" and {}{} {} ? ", alias, field, logical.value()));
									paras.add("%" + value.toString().trim() + "%");
								}else if(Logical.IN.name().equals(logical.name())){
									String in = HqlUtils.createHql(paras, Convert.toStrArray((String)value));
									hql.append(StringUtils.format(" and {}{} {}{} ", alias, field, logical.value(), in));
								}else{
									hql.append(StringUtils.format(" and {}{} {} ? ", alias, field, logical.value()));
									paras.add(value.toString().trim());
								}
							}
						}else{
							if(StringUtils.isNotNull(value)){
								hql.append(StringUtils.format(" and {}{} {} ? ", alias, field, logical.value()));
								paras.add(value);
							}
						}
					} catch (Exception e) {
						e.printStackTrace();
						log.warn(e.getMessage());
					}
				}
			}
		}
	}
	
	/**
	 * 生成辅助的hql条件语句
	 * @param hql 
	 * @param paras
	 * @param ids
	 * return ( id1, id2, id3 )
	 */
	public static String createHql(List<Object> paras, String[] ids){
		StringBuffer hql = new StringBuffer();
		if(StringUtils.isEmpty(ids)){
			return hql.toString();
		}
		hql.append("(");
		for(int i = 0; i < ids.length; i++){
			hql.append("?");
			if(i == (ids.length - 1)){
				hql.append(") ");
			}else{
				hql.append(", ");
			}
			paras.add(ids[i]);
		}
		return hql.toString();
	}
}
