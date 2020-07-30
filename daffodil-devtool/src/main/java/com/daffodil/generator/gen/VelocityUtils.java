package com.daffodil.generator.gen;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;

import org.apache.velocity.VelocityContext;
import org.hibernate.id.UUIDHexGenerator;

import com.daffodil.core.constant.GenConstants;
import com.daffodil.generator.entity.GenTable;
import com.daffodil.generator.entity.GenTableColumn;
import com.daffodil.util.DateUtils;
import com.daffodil.util.StringUtils;

/**
 * 代码生成器 工具类
 * @author yweijian
 * @date 2020年5月21日
 * @version 1.0
 */
public class VelocityUtils {
	
	/** 项目java空间路径 */
	private static final String PROJECT_PATH = "main/java";

	/** html空间路径 */
	private static final String TEMPLATES_PATH = "main/resources/templates";

	/**
	 * 设置模板变量信息
	 * 
	 * @return 模板列表
	 */
	public static VelocityContext prepareContext(GenTable genTable) {
		String moduleName = genTable.getModuleName();
		String businessName = genTable.getBusinessName();
		String packageName = genTable.getPackageName();
		String tplCategory = genTable.getTplCategory();
		String functionName = genTable.getFunctionName();

		VelocityContext velocityContext = new VelocityContext();
		velocityContext.put("tplCategory", genTable.getTplCategory());
		velocityContext.put("tableName", genTable.getTableName());
		velocityContext.put("functionName", StringUtils.isNotEmpty(functionName) ? functionName : "【请填写功能名称】");
		velocityContext.put("ClassName", genTable.getClassName());
		velocityContext.put("className", StringUtils.uncapitalize(genTable.getClassName()));
		velocityContext.put("moduleName", genTable.getModuleName());
		velocityContext.put("businessName", genTable.getBusinessName());
		velocityContext.put("basePackage", getPackagePrefix(packageName));
		velocityContext.put("packageName", packageName);
		velocityContext.put("author", genTable.getFunctionAuthor());
		velocityContext.put("datetime", DateUtils.getDate());
		velocityContext.put("pkColumn", genTable.getPkColumn());
		velocityContext.put("importList", getImportList(genTable.getColumns()));
		velocityContext.put("permissionPrefix", getPermissionPrefix(moduleName, businessName));
		velocityContext.put("columns", genTable.getColumns());
		velocityContext.put("table", genTable);
		velocityContext.put("menuIds", getMenuIds(6));
		if (GenConstants.TPL_TREE.equals(tplCategory)) {
			setTreeVelocityContext(velocityContext, genTable);
		}
		velocityContext.put("stringUtils", new StringUtils());//字符串处理工具
		return velocityContext;
	}

	public static void setTreeVelocityContext(VelocityContext context, GenTable genTable) {
		context.put("treeCode", genTable.getTreeCode());
		context.put("treeParentCode", genTable.getTreeParentCode());
		context.put("treeName", genTable.getTreeName());
		context.put("expandColumn", getExpandColumn(genTable));
		context.put("tree_parent_code", genTable.getTreeParentCode());
		context.put("tree_name", genTable.getTreeName());
	}

	/**
	 * 获取模板信息
	 * 
	 * @return 模板列表
	 */
	public static List<String> getTemplateList(String tplCategory) {
		List<String> templates = new ArrayList<String>();
		templates.add("vm/java/entity.java.vm");
		templates.add("vm/java/service.java.vm");
		templates.add("vm/java/serviceImpl.java.vm");
		templates.add("vm/java/controller.java.vm");
		if (GenConstants.TPL_CRUD.equals(tplCategory)) {
			templates.add("vm/html/list.html.vm");
		} else if (GenConstants.TPL_TREE.equals(tplCategory)) {
			templates.add("vm/html/tree.html.vm");
			templates.add("vm/html/list-tree.html.vm");
		}
		templates.add("vm/html/add.html.vm");
		templates.add("vm/html/edit.html.vm");
		templates.add("vm/sql/sql.vm");
		return templates;
	}

	/**
	 * 获取文件名
	 */
	public static String getFileName(String template, GenTable genTable) {
		// 文件名称
		String fileName = "";
		// 包路径
		String packageName = genTable.getPackageName();
		// 模块名
		String moduleName = genTable.getModuleName();
		// 大写类名
		String className = genTable.getClassName();
		// 业务名称
		String businessName = genTable.getBusinessName();

		String javaPath = PROJECT_PATH + "/" + StringUtils.replace(packageName, ".", "/");
		String htmlPath = TEMPLATES_PATH + "/" + moduleName + "/" + businessName;

		if (template.contains("entity.java.vm")) {
			fileName = StringUtils.format("{}/entity/{}.java", javaPath, className);
		} else if (template.contains("service.java.vm")) {
			fileName = StringUtils.format("{}/service/I{}Service.java", javaPath, className);
		} else if (template.contains("serviceImpl.java.vm")) {
			fileName = StringUtils.format("{}/service/impl/{}ServiceImpl.java", javaPath, className);
		} else if (template.contains("controller.java.vm")) {
			fileName = StringUtils.format("{}/controller/{}Controller.java", javaPath, className);
		} else if (template.contains("list.html.vm")) {
			fileName = StringUtils.format("{}/{}.html", htmlPath, businessName);
		} else if (template.contains("list-tree.html.vm")) {
			fileName = StringUtils.format("{}/{}.html", htmlPath, businessName);
		} else if (template.contains("tree.html.vm")) {
			fileName = StringUtils.format("{}/tree.html", htmlPath);
		} else if (template.contains("add.html.vm")) {
			fileName = StringUtils.format("{}/add.html", htmlPath);
		} else if (template.contains("edit.html.vm")) {
			fileName = StringUtils.format("{}/edit.html", htmlPath);
		} else if (template.contains("sql.vm")) {
			fileName = businessName + "Menu.sql";
		}
		return fileName;
	}

	/**
	 * 获取包前缀
	 * 
	 * @param packageName
	 *            包名称
	 * @return 包前缀名称
	 */
	public static String getPackagePrefix(String packageName) {
		int lastIndex = packageName.lastIndexOf(".");
		String basePackage = StringUtils.substring(packageName, 0, lastIndex);
		return basePackage;
	}

	/**
	 * 根据列类型获取导入包
	 * 
	 * @param column 列集合
	 *            
	 * @return 返回需要导入的包列表
	 */
	public static HashSet<String> getImportList(List<GenTableColumn> columns) {
		HashSet<String> importList = new HashSet<String>();
		for (GenTableColumn column : columns) {
			if (GenConstants.TYPE_DATE.equals(column.getColumnType())) {
				importList.add("com.fasterxml.jackson.annotation.JsonFormat");
				importList.add("java.util.Date");
			} else if (GenConstants.TYPE_BIGDECIMAL.equals(column.getColumnType())) {
				importList.add("java.math.BigDecimal");
			}
		}
		return importList;
	}

	/**
	 * 获取权限前缀
	 * 
	 * @param moduleName
	 *            模块名称
	 * @param businessName
	 *            业务名称
	 * @return 返回权限前缀
	 */
	public static String getPermissionPrefix(String moduleName, String businessName) {
		return StringUtils.format("{}:{}", moduleName, businessName);

	}

	/**
	 * 获取需要在哪一列上面显示展开按钮
	 * 
	 * @param genTable 业务表对象
	 * @return 展开按钮列序号
	 */
	public static int getExpandColumn(GenTable genTable) {
		String treeName = genTable.getTreeName();
		int num = 0;
		for (GenTableColumn column : genTable.getColumns()) {
			if (column.isList()) {
				num++;
				String columnName = column.getColumnName();
				if (columnName.equals(treeName)) {
					break;
				}
			}
		}
		return num;
	}
	
	public static List<String> getMenuIds(int count){
		List<String> ids = new ArrayList<String>();
		UUIDHexGenerator uuidHexGenerator = new UUIDHexGenerator();
		for(int i = 0; i < count; i++){
			ids.add(uuidHexGenerator.generate(null, null).toString());
		}
		return ids;
	}
}