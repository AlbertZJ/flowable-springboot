package com.daffodil.generator.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.daffodil.core.constant.Constants;
import com.daffodil.core.constant.GenConstants;
import com.daffodil.core.dao.JpaDao;
import com.daffodil.core.entity.Query;
import com.daffodil.generator.entity.GenMetaData;
import com.daffodil.generator.entity.GenTableColumn;
import com.daffodil.generator.service.IGenTableColumnService;
import com.daffodil.util.HqlUtils;
import com.daffodil.util.StringUtils;

/**
 * 业务字段 服务层实现
 * @author yweijian
 * @date 2020年5月13日
 * @version 1.0
 */
@Service
public class GenTableColumnServiceImpl implements IGenTableColumnService {
	
	@Autowired
	private JpaDao jpaDao;

	@Override
	public List<GenTableColumn> selectGenTableColumnList(Query<GenTableColumn> query) {
		StringBuffer hql = new StringBuffer("from GenTableColumn where 1=1");
		List<Object> paras = new ArrayList<Object>();
		HqlUtils.createHql(hql, paras, query);
		return jpaDao.search(hql.toString(), paras, GenTableColumn.class, query.getPage());
	}

	@Override
	@Transactional
	public void insertGenTableColumnByIds(String[] columnIds, String tableId) {
		if(StringUtils.isNotEmpty(columnIds) && StringUtils.isNotEmpty(tableId)){
			for(String columnId : columnIds){
				GenMetaData metaData = jpaDao.find(GenMetaData.class, columnId);
				if(StringUtils.isNotNull(metaData)){
					GenTableColumn tableColumn = new GenTableColumn();
					tableColumn.setTableId(tableId);//数据库表编号
					tableColumn.setColumnName(metaData.getColumnName());//全小写或带下划线的字段
					tableColumn.setColumnComment(metaData.getColumnComment());
					tableColumn.setColumnType(metaData.getColumnType());//应该是数据库类型
					tableColumn.setJavaField(StringUtils.toCamelCase(metaData.getColumnName()));//驼峰式字段
					tableColumn.setRemark(metaData.getRemark());//备注
					
					if("id".equalsIgnoreCase(metaData.getColumnName())){
						tableColumn.setIsPk(Constants.YES);//是否主键
						tableColumn.setIsRequired(Constants.YES);//是否必填
					}else{
						tableColumn.setIsPk(Constants.NO);//是否主键
						tableColumn.setIsRequired(Constants.NO);//是否必填
					}
					
					tableColumn.setIsInsert(Constants.YES);//默认都是插入字段
					
					// 编辑字段
					if (!StringUtils.arraysContains(GenConstants.COLUMNNAME_NOT_EDIT, tableColumn.getColumnName()) && !tableColumn.isPk()) {
						tableColumn.setIsEdit(Constants.YES);
					}else{
						tableColumn.setIsEdit(Constants.NO);
					}
					// 列表字段
					if (!StringUtils.arraysContains(GenConstants.COLUMNNAME_NOT_LIST, tableColumn.getColumnName()) && !tableColumn.isPk()) {
						tableColumn.setIsList(Constants.YES);
					}else{
						tableColumn.setIsList(Constants.NO);
					}
					// 查询字段
					if (!StringUtils.arraysContains(GenConstants.COLUMNNAME_NOT_QUERY, tableColumn.getColumnName()) && !tableColumn.isPk()) {
						tableColumn.setIsQuery(Constants.YES);
					}else{
						tableColumn.setIsQuery(Constants.NO);
					}

					// 查询字段类型
					if (StringUtils.endsWithIgnoreCase(tableColumn.getColumnName(), "name")) {
						tableColumn.setQueryType(GenConstants.QueryType.LIKE.name());
					}else{
						tableColumn.setQueryType(GenConstants.QueryType.NONE.name());
					}
					// 状态字段设置单选框
					if (StringUtils.endsWithIgnoreCase(tableColumn.getColumnName(), "status")) {
						tableColumn.setHtmlType(GenConstants.HtmlType.RADIO.value());
					}else if (StringUtils.endsWithIgnoreCase(tableColumn.getColumnName(), "type") || StringUtils.endsWithIgnoreCase(tableColumn.getColumnName(), "sex")) {
						// 类型&性别字段设置下拉框
						tableColumn.setHtmlType(GenConstants.HtmlType.SELECT.value());
					}else{
						tableColumn.setHtmlType(GenConstants.HtmlType.INPUT.value());
					}
					
					tableColumn.setSort(1);
					tableColumn.setCreateTime(new Date());
					jpaDao.save(tableColumn);
				}
			}
		}
	}

	@Override
	@Transactional
	public void updateGenTableColumn(GenTableColumn tableColumn) {
		tableColumn.setUpdateTime(new Date());
		jpaDao.update(tableColumn);
	}
	
	@Override
	@Transactional
	public void deleteGenTableColumnByIds(String[] ids) {
		List<Object> paras = new ArrayList<Object>();
		String sql = "delete from GenTableColumn where id in " + HqlUtils.createHql(paras, ids);
		jpaDao.delete(sql, paras);
	}

	@Override
	public GenTableColumn selectGenTableColumnById(String columnId) {
		return jpaDao.find(GenTableColumn.class, columnId);
	}
}