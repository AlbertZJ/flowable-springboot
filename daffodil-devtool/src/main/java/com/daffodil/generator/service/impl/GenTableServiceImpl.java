package com.daffodil.generator.service.impl;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.StringWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

import org.apache.commons.io.IOUtils;
import org.apache.velocity.Template;
import org.apache.velocity.VelocityContext;
import org.apache.velocity.app.Velocity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.daffodil.core.constant.Constants;
import com.daffodil.core.dao.JpaDao;
import com.daffodil.core.entity.Query;
import com.daffodil.core.exception.BaseException;
import com.daffodil.generator.entity.GenTable;
import com.daffodil.generator.entity.GenTableColumn;
import com.daffodil.generator.gen.VelocityInitializer;
import com.daffodil.generator.gen.VelocityUtils;
import com.daffodil.generator.service.IGenTableService;
import com.daffodil.util.HqlUtils;
import com.daffodil.util.StringUtils;

/**
 * 数据库表 服务层实现
 * @author yweijian
 * @date 2020年5月15日
 * @version 1.0
 */
@Service
public class GenTableServiceImpl implements IGenTableService {
	
	@Autowired
	private JpaDao jpaDao;
	
	@Override
	public List<GenTable> selectGenTableList(Query<GenTable> query) {
		StringBuffer hql = new StringBuffer("from GenTable where 1=1 ");
		List<Object> paras = new ArrayList<Object>();
		HqlUtils.createHql(hql, paras, query);
		return jpaDao.search(hql.toString(), paras, GenTable.class, query.getPage());
	}
	
	@Override
	public GenTable selectGenTableById(String tableId) {
		GenTable genTable = jpaDao.find(GenTable.class, tableId);
		List<GenTableColumn> columns = jpaDao.search("from GenTableColumn where tableId = ?", tableId, GenTableColumn.class);
		genTable.setColumns(columns);
		return genTable;
	}

	@Override
	@Transactional
	public void insertGenTable(GenTable table) {
		table.setCreateTime(new Date());
		jpaDao.save(table);
	}

	@Override
	@Transactional
	public void updateGenTable(GenTable table) {
		List<GenTableColumn> columns = table.getColumns();
		if(StringUtils.isNotEmpty(columns)){
			for(int i = 0; i < columns.size(); i++){
				GenTableColumn column = columns.get(i);
				GenTableColumn tableColumn = jpaDao.find(GenTableColumn.class, column.getId());
				if(StringUtils.isNotNull(tableColumn)){
					tableColumn.setColumnComment(column.getColumnComment());
					tableColumn.setColumnType(column.getColumnType());
					tableColumn.setJavaField(column.getJavaField());
					tableColumn.setIsPk(StringUtils.isEmpty(column.getIsPk()) ? Constants.NO : Constants.YES);
					tableColumn.setIsRequired(StringUtils.isEmpty(column.getIsRequired()) ? Constants.NO : Constants.YES);
					tableColumn.setIsInsert(StringUtils.isEmpty(column.getIsInsert()) ? Constants.NO : Constants.YES);
					tableColumn.setIsEdit(StringUtils.isEmpty(column.getIsEdit()) ? Constants.NO : Constants.YES);
					tableColumn.setIsList(StringUtils.isEmpty(column.getIsList()) ? Constants.NO : Constants.YES);
					tableColumn.setIsQuery(StringUtils.isEmpty(column.getIsQuery()) ? Constants.NO : Constants.YES);
					tableColumn.setQueryType(column.getQueryType());
					tableColumn.setHtmlType(column.getHtmlType());
					tableColumn.setDictType(column.getDictType());
					tableColumn.setUpdateTime(new Date());
					jpaDao.updateAll(tableColumn);
				}
			}
		}
		table.setUpdateTime(new Date());
		jpaDao.update(table);
	}

	@Override
	@Transactional
	public void deleteGenTableByIds(String[] ids) {
		jpaDao.delete(GenTable.class, ids);
	}

	@Override
	public Map<String, String> previewGenTableCode(String tableId) {
		Map<String, String> data = new LinkedHashMap<>();
		// 查询表信息
		GenTable table = jpaDao.find(GenTable.class, tableId);
		List<GenTableColumn> columns = jpaDao.search("from GenTableColumn where tableId = ?", tableId, GenTableColumn.class);
		table.setColumns(columns);
		this.setPkColumn(table, columns);
		VelocityInitializer.initVelocity();

		VelocityContext context = VelocityUtils.prepareContext(table);

		// 获取模板列表
		List<String> templates = VelocityUtils.getTemplateList(table.getTplCategory());
		for (String template : templates) {
			// 渲染模板
			StringWriter sw = new StringWriter();
			Template tpl = Velocity.getTemplate(template, "UTF-8");
			tpl.merge(context, sw);
			String code = sw.toString();
			code = code.replaceAll("/</g", "&lt;");
			code = code.replaceAll("/>/g", "&gt;");
			template = template.substring(template.lastIndexOf("/") + 1);
			data.put(template, code);
		}
		return data;
	}
	
	@Override
	public byte[] generateGenTableCode(String tableId) {
		ByteArrayOutputStream out = new ByteArrayOutputStream();
		ZipOutputStream zip = new ZipOutputStream(out);
		GenTable table = jpaDao.find(GenTable.class, tableId);
		List<GenTableColumn> columns = jpaDao.search("from GenTableColumn where tableId = ?", tableId, GenTableColumn.class);
		table.setColumns(columns);
		this.setPkColumn(table, columns);
		VelocityInitializer.initVelocity();

		VelocityContext context = VelocityUtils.prepareContext(table);

		// 获取模板列表
		List<String> templates = VelocityUtils.getTemplateList(table.getTplCategory());
		for (String template : templates) {
			// 渲染模板
			StringWriter sw = new StringWriter();
			Template tpl = Velocity.getTemplate(template, "UTF-8");
			tpl.merge(context, sw);
			try {
				// 添加到zip
				zip.putNextEntry(new ZipEntry(VelocityUtils.getFileName(template, table)));
				IOUtils.write(sw.toString(), zip, "UTF-8");
				IOUtils.closeQuietly(sw);
				zip.closeEntry();
			} catch (IOException e) {
				throw new BaseException("表名：" + table.getTableName() + "，渲染模板失败");
			}
		}
		IOUtils.closeQuietly(zip);
		return out.toByteArray();
	}
	
	/**
	 * 设置主键列信息
	 * @param genTable 业务表信息
	 * @param columns 业务字段列表
	 */
	private void setPkColumn(GenTable table, List<GenTableColumn> columns) {
		for (GenTableColumn column : columns) {
			if (column.isPk()) {
				table.setPkColumn(column);
				break;
			}
		}
	}
}
