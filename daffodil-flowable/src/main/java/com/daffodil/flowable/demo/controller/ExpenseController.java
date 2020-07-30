package com.daffodil.flowable.demo.controller;

import java.util.List;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.daffodil.core.annotation.FormToken;
import com.daffodil.core.annotation.FormToken.TokenType;
import com.daffodil.core.annotation.Log;
import com.daffodil.core.annotation.Log.BusinessType;
import com.daffodil.core.controller.BaseController;
import com.daffodil.core.entity.JsonResult;
import com.daffodil.core.entity.Page;
import com.daffodil.core.entity.TableInfo;
import com.daffodil.flowable.demo.entity.Expense;
import com.daffodil.flowable.demo.service.IExpenseService;
import com.daffodil.util.text.Convert;

/**
 * 费用报销 信息控制层
 * 
 * @author yweijian
 * @date 2019年8月18日
 * @version 1.0
 */
@Controller
@RequestMapping("/demo/expense")
public class ExpenseController extends BaseController {

	private String prefix = "demo/expense";

	@Autowired
	private IExpenseService expenseService;

	@RequiresPermissions("demo:expense:view")
	@GetMapping()
	public String expense() {
		return prefix + "/expense";
	}

	/**
	 * 查询费用报销列表
	 */
	@SuppressWarnings("unchecked")
	@RequiresPermissions("demo:expense:list")
	@GetMapping("/list")
	@ResponseBody
	public TableInfo list(Expense expense) {
		initQuery(expense, new Page());
		List<Expense> list = expenseService.selectExpenseList(query);
		return initTableInfo(list, query);
	}

	/**
	 * 新增费用报销
	 */
	@FormToken
	@GetMapping("/add")
	public String add() {
		return prefix + "/add";
	}

	/**
	 * 新增保存费用报销
	 */
	@FormToken(TokenType.DESTROY)
	@RequiresPermissions("demo:expense:add")
	@Log(title = "费用报销", businessType = BusinessType.INSERT)
	@PostMapping("/add")
	@ResponseBody
	public JsonResult addSave(Expense expense) {
		expenseService.insertExpense(expense);
		return JsonResult.success(expense);
	}

	/**
	 * 修改费用报销
	 */
	@GetMapping("/edit/{expenseId}")
	public String edit(@PathVariable("expenseId") String expenseId, ModelMap modelMap) {
		modelMap.put("expense", expenseService.selectExpenseById(expenseId));
		return prefix + "/edit";
	}

	/**
	 * 修改保存费用报销
	 */
	@RequiresPermissions("demo:expense:edit")
	@Log(title = "费用报销", businessType = BusinessType.UPDATE)
	@PostMapping("/edit")
	@ResponseBody
	public JsonResult editSave(Expense expense) {
		expenseService.updateExpense(expense);
		return JsonResult.success();
	}

	/**
	 * 删除费用报销
	 */
	@RequiresPermissions("demo:expense:remove")
	@Log(title = "费用报销", businessType = BusinessType.DELETE)
	@PostMapping("/remove")
	@ResponseBody
	public JsonResult remove(String ids) {
		expenseService.deleteExpenseByIds(Convert.toStrArray(ids));
		return JsonResult.success();
	}
}
