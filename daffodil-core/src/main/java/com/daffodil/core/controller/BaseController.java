package com.daffodil.core.controller;

import java.beans.PropertyEditorSupport;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;

import com.daffodil.core.constant.Constants;
import com.daffodil.core.entity.BaseEntity;
import com.daffodil.core.entity.Page;
import com.daffodil.core.entity.Query;
import com.daffodil.core.entity.TableInfo;
import com.daffodil.util.DateUtils;
import com.daffodil.util.ServletUtils;
import com.daffodil.util.StringUtils;

/**
 * web层通用数据处理
 * @author yweijian
 * @date 2019年8月23日
 * @version 1.0
 * @param <T>
 */
public class BaseController {
	protected final Logger logger = LoggerFactory.getLogger(BaseController.class);
	
	private static int DEFAULT_PAGE_NUM  = 1;
	
	private static int DEFAULT_PAGE_SIZE  = 15;
	
	@SuppressWarnings("rawtypes")
	protected Query query;

	/**
	 * 获取request
	 */
	public HttpServletRequest getRequest() {
		return ServletUtils.getRequest();
	}

	/**
	 * 获取response
	 */
	public HttpServletResponse getResponse() {
		return ServletUtils.getResponse();
	}

	/**
	 * 获取session
	 */
	public HttpSession getSession() {
		return getRequest().getSession();
	}
	
	/**
	 * 初始化Query
	 */
	protected void initQuery(){
		this.initQuery(null, null, null);
	}
	
	/**
	 * 初始化Query
	 * @param entity
	 */
	protected void initQuery(BaseEntity entity){
		this.initQuery(entity, null, null);
	}
	
	/**
	 * 初始化Query
	 * @param params
	 */
	protected void initQuery(Map<String, Object> params){
		this.initQuery(null, params, null);
	}
	
	/**
	 * 初始化Query
	 * @param page
	 */
	protected void initQuery(Page page){
		this.initQuery(null, null, page);
	}
	
	/**
	 * 初始化Query
	 * @param entity
	 * @param params
	 */
	protected void initQuery(BaseEntity entity, Map<String, Object> params){
		this.initQuery(entity, params, null);
	}
	
	/**
	 * 初始化Query
	 * @param entity
	 * @param page
	 */
	protected void initQuery(BaseEntity entity, Page page){
		this.initQuery(entity, null, page);
	}
	
	/**
	 * 初始化Query
	 * @param params
	 * @param page
	 */
	protected void initQuery(Map<String, Object> params, Page page){
		this.initQuery(null, params, page);
	}
	
	/**
	 * 初始化Query
	 * @param entity 实体参数
	 * @param params Map参数
	 * @param page 分页，每页显示默认15条记录
	 */
	protected void initQuery(BaseEntity entity, Map<String, Object> params, Page page){
		Query<BaseEntity> query = new Query<BaseEntity>();
		if(StringUtils.isNotNull(page)){
			page.setPageNumber(ServletUtils.getParameterToInt(Constants.PAGE_NUM, DEFAULT_PAGE_NUM));
			page.setPageSize(ServletUtils.getParameterToInt(Constants.PAGE_SIZE, DEFAULT_PAGE_SIZE));
			query.setPage(page);
		}
		if(StringUtils.isNotEmpty(ServletUtils.getParameter(Constants.ORDER_BY_COLUMN))){
			query.setOrderBy(ServletUtils.getParameter(Constants.ORDER_BY_COLUMN) + " " + ServletUtils.getParameter(Constants.IS_ASC));
		}
		if(StringUtils.isNotEmpty(ServletUtils.getParameter(Constants.START_TIME_BRACKET))){
			query.setStartTime(DateUtils.parseDate(ServletUtils.getParameter(Constants.START_TIME_BRACKET)));
		}
		if(StringUtils.isNotEmpty(ServletUtils.getParameter(Constants.END_TIME_BRACKET))){
			query.setEndTime(DateUtils.parseDate(ServletUtils.getParameter(Constants.END_TIME_BRACKET)));
		}
		query.setEntity(entity);
		query.setParams(params);
		this.setQuery(query);
	}

	/**
	 * 不分页数据表格
	 * @param list 数据
	 * @return
	 */
	protected TableInfo initTableInfo(List<?> list) {
		TableInfo tableInfo = new TableInfo();
		tableInfo.setCode(0);
		tableInfo.setRows(list);
		tableInfo.setData(list);
		tableInfo.setTotal(list != null ? list.size() : 0);
		return tableInfo;
	}
	
	/**
	 * 分页数据表格
	 * @param list 数据
	 * @param query
	 * @return
	 */
	protected TableInfo initTableInfo(List<?> list, Query<?> query) {
		TableInfo tableInfo = new TableInfo();
		tableInfo.setCode(0);
		tableInfo.setRows(list);
		tableInfo.setData(list);
		if(query.getPage() == null){
			tableInfo.setTotal(list.size());
		}else{
			tableInfo.setTotal(query.getPage().getTotalRow());
		}
		return tableInfo;
	}

	/**
	 * 页面跳转
	 */
	public String redirect(String url) {
		return StringUtils.format("redirect:{}", url);
	}
	
	/**
	 * 将前台传递过来的日期格式的字符串，自动转化为Date类型
	 */
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		// Date 类型转换
		binder.registerCustomEditor(Date.class, new PropertyEditorSupport() {
			@Override
			public void setAsText(String text) {
				setValue(DateUtils.parseDate(text));
			}
		});
	}

	@SuppressWarnings("rawtypes")
	public Query getQuery() {
		return query;
	}

	@SuppressWarnings("rawtypes")
	public void setQuery(Query query) {
		this.query = query;
	}
	
}
