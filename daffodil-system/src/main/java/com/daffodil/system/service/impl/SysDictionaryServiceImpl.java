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
import com.daffodil.core.entity.Ztree;
import com.daffodil.core.exception.BaseException;
import com.daffodil.framework.shiro.util.ShiroUtils;
import com.daffodil.system.entity.SysDictionary;
import com.daffodil.system.service.ISysDictionaryService;
import com.daffodil.util.HqlUtils;
import com.daffodil.util.StringUtils;


@Service
public class SysDictionaryServiceImpl implements ISysDictionaryService{

	@Autowired
	private JpaDao jpaDao;
	
	@Override
	public List<SysDictionary> selectDictionaryList(Query<SysDictionary> query) {
		StringBuffer hql = new StringBuffer();
		List<Object> paras = new ArrayList<Object>();
		hql.append("from SysDictionary d where 1=1 ");
		HqlUtils.createHql(hql, paras, query, "d");
		hql.append("order by d.parentId desc, d.orderNum asc");
		return jpaDao.search(hql.toString(), paras, SysDictionary.class);
	}

	@Override
	public List<Ztree> dictionaryTreeData(Query<SysDictionary> query) {
		List<SysDictionary> dictionarys = this.selectDictionaryList(query);
		List<Ztree> ztrees = this.initZtree(dictionarys);
		return ztrees;
	}

	@Override
	@Transactional
	public void deleteDictionaryById(String dictId) {
		List<SysDictionary> list = jpaDao.search("from SysDictionary where parentId = ?", dictId, SysDictionary.class);
		if (list != null && list.size() > 0) {
			throw new BaseException("删除字典失败，存在下级字典值，不允许删除");
		}
		jpaDao.delete(SysDictionary.class, dictId);
		
	}

	@Override
	public SysDictionary selectDictionaryById(String dictId) {
		if(Constants.ROOT.equals(dictId)){
			SysDictionary dictionary = new SysDictionary();
			dictionary.setId(Constants.ROOT);
			dictionary.setDictName("");
			dictionary.setAncestors("");
			return dictionary;
		}
		
		SysDictionary dictionary = jpaDao.find(SysDictionary.class, dictId);
		if(StringUtils.isNull(dictionary)){
			dictionary = jpaDao.find("from SysDictionary where dictLabel = ?", dictId, SysDictionary.class);
		}
		return dictionary;
	}
	
	@Override
	@Cacheable(value = "system:dictionary:cache", key = "#dictLabel")
	public List<SysDictionary> selectDictionaryByLabel(String dictLabel) {
		String hql = "from SysDictionary where parentId in (select id from SysDictionary where dictLabel = ?) order by orderNum asc";
		return jpaDao.search(hql, dictLabel, SysDictionary.class);
	}

	@Override
	@Transactional
	@CacheEvict(value = "system:dictionary:cache", key = "#dictionary.dictLabel")
	public void insertDictionary(SysDictionary dictionary) {
		if (StringUtils.isNotEmpty(dictionary.getDictLabel()) && this.checkDictionaryLabelUnique(dictionary)) {
			throw new BaseException("新增字典【" + dictionary.getDictName() + "】失败，字典目录键值【" + dictionary.getDictLabel() + "】已存在");
		}
		if(Constants.ROOT.equals(dictionary.getParentId())){
			dictionary.setAncestors("root");
		}else{
			SysDictionary parent = jpaDao.find(SysDictionary.class, dictionary.getParentId());
			if(parent != null){
				dictionary.setAncestors(parent.getAncestors() + "," + parent.getId());
			}
		}
		dictionary.setCreateBy(ShiroUtils.getLoginName());
		dictionary.setCreateTime(new Date());
		jpaDao.save(dictionary);
		
	}

	@Override
	@Transactional
	@CacheEvict(value = "system:dictionary:cache", key = "#dictionary.dictLabel")
	public void updateDictionary(SysDictionary dictionary) {
		if (StringUtils.isNotEmpty(dictionary.getDictLabel()) && this.checkDictionaryLabelUnique(dictionary)) {
			throw new BaseException("新增字典【" + dictionary.getDictName() + "】失败，字典目录键值【" + dictionary.getDictLabel() + "】已存在");
		}
		if(this.checkDictionaryIsSelfOrChildren(dictionary)){
			throw new BaseException("修改字典【" + dictionary.getDictName() + "】失败，上级菜单不能是自己或自己的子菜单");
		}
		SysDictionary sysDictionary = this.selectDictionaryById(dictionary.getId());
		SysDictionary parent = this.selectDictionaryById(dictionary.getParentId());
		if (StringUtils.isNotNull(parent) && StringUtils.isNotNull(sysDictionary)) {
			String newAncestors = parent.getAncestors() + "," + parent.getId();
			String oldAncestors = sysDictionary.getAncestors();
			dictionary.setAncestors(newAncestors);
			this.updateChildrenDictionary(dictionary, newAncestors, oldAncestors);
		}
		dictionary.setUpdateBy(ShiroUtils.getLoginName());
		dictionary.setUpdateTime(new Date());
		jpaDao.update(dictionary);
		
	}

	@Override
	public boolean checkDictionaryLabelUnique(SysDictionary dictionary) {
		List<Object> paras = new ArrayList<Object>();
		String hql = "from SysDictionary where dictLabel = ? and parentId = ? ";
		paras.add(dictionary.getDictLabel());
		paras.add(dictionary.getParentId());
		if(StringUtils.isNotEmpty(dictionary.getId())){
			hql += "and id != ?";
			paras.add(dictionary.getId());
		}
		SysDictionary sysDictionary = jpaDao.find(hql, paras, SysDictionary.class);
		if (StringUtils.isNotNull(sysDictionary)) {
			return Constants.NOT_UNIQUE;
		}
		return Constants.IS_UNIQUE;
	}
	
	/**
	 * 初始化zTree
	 * @param dictionarys
	 * @return
	 */
	private List<Ztree> initZtree(List<SysDictionary> dictionarys) {
		List<Ztree> ztrees = new ArrayList<Ztree>();
		for (SysDictionary dictionary : dictionarys) {
			Ztree ztree = new Ztree();
			ztree.setId(dictionary.getId());
			ztree.setpId(dictionary.getParentId());
			ztree.setName(dictionary.getDictName());
			ztree.setTitle(dictionary.getDictLabel());
			ztrees.add(ztree);
		}
		return ztrees;
	}
	
	private boolean checkDictionaryIsSelfOrChildren(SysDictionary dictionary){
		List<Object> paras = new ArrayList<Object>();
		String hql = "from SysDictionary where id = ? or ancestors like ?";
		paras.add(dictionary.getId());
		paras.add("%" + dictionary.getId() + "%");
		List<SysDictionary> dictionaries = jpaDao.search(hql, paras, SysDictionary.class);
		for(SysDictionary sysDictionary : dictionaries){
			if(dictionary.getParentId().equals(sysDictionary.getId())){
				return true;
			}
		}
		return false;
	}
	
	@Transactional
	@CacheEvict(value = "system:dictionary:cache", key = "#dictionary.dictLabel")
	private void updateChildrenDictionary(SysDictionary dictionary, String newAncestors, String oldAncestors){
		//查询旧的前缀的所有子组织机构
		List<SysDictionary> childrens = jpaDao.search("from SysDictionary where ancestors like ?", "%" + dictionary.getId() + "%", SysDictionary.class);
		for (SysDictionary child : childrens) {
			//替换掉所有子组织机构的前缀
			child.setAncestors(child.getAncestors().replace(oldAncestors, newAncestors));
			//父级不可用，子级也不可用
			child.setStatus(dictionary.getStatus());
			jpaDao.update(child);
		}
	}

}
