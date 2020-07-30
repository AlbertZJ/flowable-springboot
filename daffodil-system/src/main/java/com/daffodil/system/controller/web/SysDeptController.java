package com.daffodil.system.controller.web;

import java.util.List;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.daffodil.core.annotation.FormToken;
import com.daffodil.core.annotation.FormToken.TokenType;
import com.daffodil.core.annotation.Log;
import com.daffodil.core.annotation.Log.BusinessType;
import com.daffodil.core.entity.JsonResult;
import com.daffodil.core.entity.TableInfo;
import com.daffodil.core.entity.Ztree;
import com.daffodil.system.controller.SystemController;
import com.daffodil.system.entity.SysDept;
import com.daffodil.system.service.ISysDeptService;

/**
 * 部门信息控制层
 * @author yweijian
 * @date 2019年8月18日
 * @version 1.0
 */
@Controller
@RequestMapping("/system/dept")
public class SysDeptController extends SystemController {
	private String prefix = "system/dept";

	@Autowired
	private ISysDeptService deptService;

	@RequiresPermissions("system:dept:view")
	@GetMapping()
	public String dept() {
		return prefix + "/dept";
	}

	@SuppressWarnings("unchecked")
	@RequiresPermissions("system:dept:list")
	@GetMapping("/list")
	@ResponseBody
	public TableInfo list(SysDept dept) {
		initQuery(dept);
		List<SysDept> deptList = deptService.selectDeptList(query);
		return initTableInfo(deptList);
	}

	/**
	 * 新增部门
	 */
	@FormToken
	@GetMapping("/add/{parentId}")
	public String add(@PathVariable("parentId") String parentId, ModelMap modelMap) {
		modelMap.put("dept", deptService.selectDeptById(parentId));
		return prefix + "/add";
	}

	/**
	 * 新增保存部门
	 */
	@FormToken(TokenType.DESTROY)
	@Log(title = "部门管理", businessType = BusinessType.INSERT)
	@RequiresPermissions("system:dept:add")
	@PostMapping("/add")
	@ResponseBody
	public JsonResult addSave(@Validated SysDept dept) {
		deptService.insertDept(dept);
		return JsonResult.success();
	}

	/**
	 * 修改
	 */
	@GetMapping("/edit/{deptId}")
	public String edit(@PathVariable("deptId") String deptId, ModelMap modelMap) {
		SysDept dept = deptService.selectDeptById(deptId);
		modelMap.put("dept", dept);
		SysDept parent = deptService.selectDeptById(dept.getParentId());
		modelMap.put("parent", parent);
		return prefix + "/edit";
	}

	/**
	 * 保存
	 */
	@Log(title = "部门管理", businessType = BusinessType.UPDATE)
	@RequiresPermissions("system:dept:edit")
	@PostMapping("/edit")
	@ResponseBody
	public JsonResult editSave(@Validated SysDept dept) {
		deptService.updateDept(dept);
		return JsonResult.success();
	}

	/**
	 * 删除
	 */
	@Log(title = "部门管理", businessType = BusinessType.DELETE)
	@RequiresPermissions("system:dept:remove")
	@PostMapping("/remove/{deptId}")
	@ResponseBody
	public JsonResult remove(@PathVariable("deptId") String deptId) {
		deptService.deleteDeptById(deptId);
		return JsonResult.success();
	}

	/**
	 * 校验部门名称
	 */
	@GetMapping("/checkDeptNameUnique")
	@ResponseBody
	public String checkDeptNameUnique(SysDept dept) {
		return deptService.checkDeptNameUnique(dept) ? "1" : "0";
	}

	/**
	 * 选择部门树
	 */
	@GetMapping("/selectDeptTree/{deptId}")
	public String selectDeptTree(@PathVariable("deptId") String deptId, ModelMap mmap) {
		mmap.put("dept", deptService.selectDeptById(deptId));
		return prefix + "/tree";
	}

	/**
	 * 加载部门列表树
	 */
	@SuppressWarnings("unchecked")
	@GetMapping("/treeData")
	@ResponseBody
	public List<Ztree> treeData(SysDept dept) {
		initQuery(dept);
		List<Ztree> ztrees = deptService.deptTreeData(query);
		return ztrees;
	}

	/**
	 * 加载角色部门（数据权限）列表树
	 */
	@GetMapping("/roleDeptTreeData")
	@ResponseBody
	public List<Ztree> roleDeptTreeData(String roleId) {
		List<Ztree> ztrees = deptService.roleDeptTreeData(roleId);
		return ztrees;
	}
}
