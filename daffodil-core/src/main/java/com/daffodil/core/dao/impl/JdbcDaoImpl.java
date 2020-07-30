package com.daffodil.core.dao.impl;

import java.io.InputStream;
import java.io.Reader;
import java.sql.Blob;
import java.sql.Clob;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import org.hibernate.query.internal.NativeQueryImpl;
import org.hibernate.transform.Transformers;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.daffodil.core.dao.JdbcDao;
import com.daffodil.core.entity.Page;
import com.daffodil.core.exception.BusinessException;

@Repository("JdbcDao")
public class JdbcDaoImpl implements JdbcDao {
	
	@Autowired
	private EntityManager entityManager;

	private static int DEFAULT_PAGE_NUM  = 1;

	private static int DEFAULT_PAGE_SIZE  = 9999;

	public void execute(String sql) throws BusinessException {
		try {
			Query query = entityManager.createNativeQuery(sql);
			query.executeUpdate();
		} catch (Exception e) {
			throw new BusinessException("[JDBC] 执行SQL语句错误 ...", e);
		} 
	}

	public void execute(String sql, List<Object> paras) throws BusinessException {
		try {
			String querySql = getQuerySql(sql);
			Query query = entityManager.createNativeQuery(querySql);
			this.setQueryParas(query, paras);
			query.executeUpdate();
		} catch (Exception e) {
			throw new BusinessException("[JDBC] 执行SQL语句错误 ...", e);
		} 
	}

	@SuppressWarnings({ "unchecked"})
	public List<Map<String, String>> search(String sql) throws BusinessException {
		List<Map<String, String>> returnList = new LinkedList<>();
		try {
			Query query = entityManager.createNativeQuery(sql).unwrap(NativeQueryImpl.class).setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP);
			List<Map<String, Object>> list = query.getResultList();
			for (Map<String, Object> map : list ) {
				Map<String, String> returnMap = new HashMap<String, String>();
				Set<String> key = map.keySet();
				for (Iterator<String> it = key.iterator(); it.hasNext(); ) {
					String s = it.next();
					returnMap.put(s.toLowerCase(), objectDataToString(map.get(s)));
				} 
				returnList.add(returnMap);
			} 
		} catch (Exception e) {
			throw new BusinessException("[JDBC] 查询数据错误 ...", e);
		} 
		return returnList;
	}


	@SuppressWarnings({ "unchecked" })
	public List<Map<String, String>> search(String sql, Page page) throws BusinessException {
		if(null == page){
			page = new Page();
			page.setPageNumber(DEFAULT_PAGE_NUM);
			page.setPageSize(DEFAULT_PAGE_SIZE);
		}
		this.setTotalRow(sql, page, null);
		List<Map<String, String>> returnList = new LinkedList<>();
		try {
			Query query = entityManager.createNativeQuery(sql).setFirstResult(page.getFromIndex()).setMaxResults(page.getPageSize())
					.unwrap(NativeQueryImpl.class).setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP);
			List<Map<String, Object>> list = query.getResultList();
			for (Map<String, Object> map : list) {
				Map<String, String> returnMap = new HashMap<String, String>();
				Set<String> key = map.keySet();
				for (Iterator<String> it = key.iterator(); it.hasNext(); ) {
					String s = it.next();
					returnMap.put(s.toLowerCase(), objectDataToString(map.get(s)));
				} 
				returnList.add(returnMap);
			} 
		} catch (Exception e) {
			throw new BusinessException("[JDBC] 分页查询数据错误 ...", e);
		} 
		return returnList;
	}



	@SuppressWarnings({ "unchecked" })
	public List<Map<String, String>> search(String sql, List<Object> paras) throws BusinessException {
		List<Map<String, String>> returnList = new LinkedList<>();
		try {
			String querySql = getQuerySql(sql);
			Query query = entityManager.createNativeQuery(querySql).unwrap(NativeQueryImpl.class).setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP);
			this.setQueryParas(query, paras);
			List<Map<String, Object>> list = query.getResultList();
			for (Map<String, Object> map : list) {
				Map<String, String> returnMap = new HashMap<String, String>();
				Set<String> key = map.keySet();
				for (Iterator<String> it = key.iterator(); it.hasNext(); ) {
					String s = it.next();
					returnMap.put(s.toLowerCase(), objectDataToString(map.get(s)));
				} 
				returnList.add(returnMap);
			} 
		} catch (Exception e) {
			throw new BusinessException("[JDBC] 查询数据错误 ...", e);
		} 
		return returnList;
	}

	@SuppressWarnings({ "unchecked" })
	public List<Map<String, String>> search(String sql, List<Object> paras, Page page) throws BusinessException {
		if(null == page){
			page = new Page();
			page.setPageNumber(DEFAULT_PAGE_NUM);
			page.setPageSize(DEFAULT_PAGE_SIZE);
		}
		this.setTotalRow(sql, page, paras);
		List<Map<String, String>> returnList = new LinkedList<>();
		try {
			String querySql = getQuerySql(sql);
			Query query = entityManager.createNativeQuery(querySql).setFirstResult(page.getFromIndex()).setMaxResults(page.getPageSize())
					.unwrap(NativeQueryImpl.class).setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP);
			this.setQueryParas(query, paras);
			List<Map<String, Object>> list = query.getResultList();
			for (Map<String, Object> map : list) {
				Map<String, String> returnMap = new HashMap<>();
				Set<String> key = map.keySet();
				for (Iterator<String> it = key.iterator(); it.hasNext(); ) {
					String s = it.next();
					returnMap.put(s.toLowerCase(), objectDataToString(map.get(s)));
				} 
				returnList.add(returnMap);
			} 
		} catch (Exception e) {
			throw new BusinessException("[JDBC] 分页查询数据错误 ...", e);
		} 
		return returnList;
	}

	public Map<String, String> find(String sql) throws BusinessException {
		return find(sql, null);
	}

	@SuppressWarnings({ "unchecked" })
	public Map<String, String> find(String sql, List<Object> paras) throws BusinessException {
		Map<String, String> resultMap = new HashMap<String, String>();
		try {
			String querySql = getQuerySql(sql);
			Query query = entityManager.createNativeQuery(querySql).unwrap(NativeQueryImpl.class).setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP);
			this.setQueryParas(query, paras);
			List<Map<String, Object>> list = query.getResultList();
			for (Map<String, Object> map : list) {
				Set<String> key = map.keySet();
				for (Iterator<String> it = key.iterator(); it.hasNext(); ) {
					String s = it.next();
					resultMap.put(s.toLowerCase(), objectDataToString(map.get(s)));
				} 
			} 
		} catch (Exception e) {
			throw new BusinessException("[JDBC] 查询数据错误 ...", e);
		} 
		return resultMap;
	}

	@SuppressWarnings({ "unchecked" })
	public Map<String, String> find(String sql, Object para) throws BusinessException {
		Map<String, String> resultMap = new HashMap<String, String>();
		try {
			String querySql = getQuerySql(sql);
			Query query = entityManager.createNativeQuery(querySql).unwrap(NativeQueryImpl.class).setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP);
			query.setParameter(0, para);
			List<Map<String, Object>> list = query.getResultList();
			for (Map<String, Object> map : list) {
				Set<String> key = map.keySet();
				for (Iterator<String> it = key.iterator(); it.hasNext(); ) {
					String s = it.next();
					resultMap.put(s.toLowerCase(), objectDataToString(map.get(s)));
				} 
			} 
		} catch (Exception e) {
			throw new BusinessException("[JDBC] 查询数据错误 ...", e);
		} 
		return resultMap;
	}

	public int count(String sql) throws BusinessException {
		return count(sql, null);
	}
	
	@SuppressWarnings({ "unchecked" })
	public int count(String sql, List<Object> paras) throws BusinessException {
		int result = 0;
		try {
			String querySql = getQuerySql(sql);
			Query query = entityManager.createNativeQuery(querySql).unwrap(NativeQueryImpl.class).setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP);
			this.setQueryParas(query, paras);
			List<Map<String, Object>> list = query.getResultList();
			for (Map<String, Object> map : list) {
				Set<String> key = map.keySet();
				for (Iterator<String> it = key.iterator(); it.hasNext(); ) {
					String s = it.next();
					result = Integer.parseInt(objectDataToString(map.get(s)));
				} 
			} 
		} catch (Exception e) {
			throw new BusinessException("[JDBC] 查询数据错误 ...", e);
		} 
		return result;
	}
	
	/**
	 * 将查询语句中的占位符[?]替换成[?i]<br>
	 * 如：from table where id = ? and name = ?<br>
	 * -> from table where id = ?0 and name = ?1
	 * @param sql
	 * @return
	 */
	private String getQuerySql(String sql){
		StringBuffer sb= new StringBuffer();
		Pattern pattern = Pattern.compile("[?]"); 
		Matcher matcher = pattern.matcher(sql); 
		boolean result = matcher.find();
		int count = 0;
		while (result) {
			matcher.appendReplacement(sb, "?" + count);
			count++;
			result = matcher.find();
		}
		matcher.appendTail(sb);
		return sb.toString();
	}

	private void setQueryParas(Query query, List<Object> paras) throws BusinessException {
		if ((paras != null) && (paras.size() > 0)) {
			for (int i = 0; i < paras.size(); i++) {
				query.setParameter(i, paras.get(i));
			}
		}
	}

	private void setTotalRow(String sql, Page page, List<Object> paras) throws BusinessException {
		page.setTotalRow(this.count(getQueryCountSql(sql), paras));
	}
	
	private String getQueryCountSql(String sql) {
		if (sql.indexOf(" order ") > -1)
			return "select count(*) as count  " + 
			sql.substring(sql.indexOf(" from "), sql.indexOf(" order ")); 
		if (sql.indexOf(" group ") > -1)
			return "select count(*) as count  " + 
			sql.substring(sql.indexOf(" from "), sql.indexOf(" group ")); 
		return "select count(*) as count  " + 
		sql.substring(sql.indexOf(" from "));
	}
	
	private String objectDataToString(Object o) throws BusinessException {
		if (o == null)
			return ""; 
		if (o instanceof Clob) {
			return clobToString((Clob) o);
		} 
		if (o instanceof java.sql.Blob) {
			return blobToString((Blob) o);
		}
		return o.toString();	
	}
	
	/**
	 * 把大对象CLOB转换成String
	 * 
	 * @param clob
	 * @return
	 */
	private String clobToString(Clob clob) {
		
		if (clob == null) {
			return "";
		}

		StringBuffer sb = new StringBuffer();
		Reader clobStream = null;
		try {
			clobStream = clob.getCharacterStream();
			char[] c = new char[8112];// 每次获取8K
			int i = 0;
			while ((i = clobStream.read(c)) != -1) {
				sb.append(c, 0, i);
			}
			return sb.toString();
		} catch (Exception e) {
			throw new BusinessException("[JDBC] Clob数据转换错误 ...", e);
		} finally {
			try {
				if (clobStream != null){
					clobStream.close();
				}
			} catch (Exception e) {
				throw new BusinessException("[JDBC] Clob数据转换错误 ...", e);
			}
		}
	}
	
	/**
	 * 把大对象BLOB转换成String
	 * 
	 * @param blob
	 * @return
	 */
	private String blobToString(Blob blob){ 

		StringBuffer str = new StringBuffer();

		InputStream in = null;// 输入字节流
		try {
			in = blob.getBinaryStream();
			byte[] buff = new byte[(int) blob.length()];
			for (; (in.read(buff)) > 0;) {
				str = str.append(new String(buff));
			}
			return str.toString();
		} catch (Exception e) {
			throw new BusinessException("[JDBC] Blob数据转换错误 ...", e);
		} finally {
			try {
				in.close();
			} catch (Exception e) {
				throw new BusinessException("[JDBC] Blob数据转换错误 ...", e);
			}
		}
	}
}
