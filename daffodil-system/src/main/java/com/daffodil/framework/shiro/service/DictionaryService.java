package com.daffodil.framework.shiro.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.daffodil.system.entity.SysDictionary;
import com.daffodil.system.service.ISysDictionaryService;
import com.daffodil.util.StringUtils;

/**
 * html、js调用 thymeleaf 实现字典读取
 * @author yweijian
 * @date 2020年3月18日
 * @project com.jdy.framework.shiro.service.DictionaryService.java
 * @version 2.0
 */
@Service("dict")
public class DictionaryService {
	
	@Autowired
	private ISysDictionaryService dictionaryService;

	/**
	 * 根据字典目录键值获取字典值
	 * @param dictLabel
	 * @return
	 */
	public List<SysDictionary> getDict(String dictLabel) {
		return dictionaryService.selectDictionaryByLabel(dictLabel);
	}
	
	/**
	 * 根据字典目录键值/字典值 获取字典名称
	 * @param dictLabel
	 * @param dictValue
	 * @return
	 */
	public String getName(String dictLabel, String dictValue) {
		List<SysDictionary> dicts = dictionaryService.selectDictionaryByLabel(dictLabel);
		if(StringUtils.isNotEmpty(dicts)){
			for(SysDictionary dict : dicts){
				if(dict.getDictValue().equals(dictValue)){
					return dict.getDictName();
				}
			}
		}
		return "";
	}
}
