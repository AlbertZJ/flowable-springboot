package com.daffodil.system.controller;

import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import com.daffodil.core.annotation.Dict;
import com.daffodil.core.controller.BaseController;
import com.daffodil.core.entity.Query;
import com.daffodil.core.entity.TableInfo;
import com.daffodil.system.entity.SysDictionary;
import com.daffodil.system.service.ISysDictionaryService;
import com.daffodil.util.StringUtils;

/**
 * 
 * @author weiji
 * @date 2020年3月31日
 * @version 1.0
 */
public class SystemController extends BaseController{

	@Autowired
	protected ISysDictionaryService dictionaryService;
	
	@Override
	protected TableInfo initTableInfo(List<?> list) {
		TableInfo tableInfo = new TableInfo();
		tableInfo.setCode(0);
		tableInfo.setRows(this.getDictRows(list));
		tableInfo.setData(list);
		tableInfo.setTotal(list != null ? list.size() : 0);
		return tableInfo;
	}

	@Override
	protected TableInfo initTableInfo(List<?> list, Query<?> query) {
		TableInfo tableInfo = new TableInfo();
		tableInfo.setCode(0);
		tableInfo.setRows(this.getDictRows(list));
		tableInfo.setData(list);
		tableInfo.setTotal(query.getPage().getTotalRow());
		return tableInfo;
	}

	/**
	 * 处理存在字典注解的字段，并回显中文字典含义<br>
	 * 获取字典回显值的数据列表
	 * @param list 原始数据
	 * @return
	 */
	protected List<?> getDictRows(List<?> list){
		if(StringUtils.isNotEmpty(list)){
			Map<String, List<SysDictionary>> map = this.getDictionaryList(list.get(0));
			this.setDictRows(map, list);
		}
		return list;
	}
	
	/**
	 * 获取字段对应的字典值
	 * @param entity
	 * @return
	 */
	private Map<String, List<SysDictionary>> getDictionaryList(Object entity){
		Map<String, List<SysDictionary>> map = null;
		if(entity != null){
			Method[] methods = entity.getClass().getMethods();
			if(StringUtils.isNotEmpty(methods)){
				map = new HashMap<String, List<SysDictionary>>();
				for(Method method : methods){
					Dict annotation = method.getAnnotation(Dict.class);
					String field = method.getName().substring(3);
					if(StringUtils.isNotNull(annotation)){
						String dictLabel = annotation.value();
						List<SysDictionary> dicts = dictionaryService.selectDictionaryByLabel(dictLabel);
						map.put(field, dicts);
					}
				}
			}
		}
		return map;
	}
	
	/**
	 * 将数据列表转成对应的字典值的回显值
	 * @param map 获取字段对应的字典值
	 * @param list 原始数据
	 */
	private void setDictRows(Map<String, List<SysDictionary>> map, List<?> list){
		if(StringUtils.isNotEmpty(map)){
			for(int i = 0; i < list.size(); i++){
				Object obj = list.get(i);
				for (Map.Entry<String, List<SysDictionary>> entry : map.entrySet()) { 
					try {
						List<SysDictionary> dicts = entry.getValue();
						Method get = obj.getClass().getMethod("get" + entry.getKey());
						Method set = obj.getClass().getMethod("set" + entry.getKey(), String.class);
						Object value = get.invoke(obj);
						if(StringUtils.isNotEmpty(dicts)){
							for(SysDictionary dict : dicts){
								if(value != null && value.equals(dict.getDictValue())){
									set.invoke(obj, dict.getDictName());
									break;
								}
							}
						}
					} catch (Exception e) {
						e.printStackTrace();
						super.logger.warn("数据列表参数回显字典值错误");
					}
				}
			}
		}
	}
}
