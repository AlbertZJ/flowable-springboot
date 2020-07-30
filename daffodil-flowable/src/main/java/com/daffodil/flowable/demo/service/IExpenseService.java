package com.daffodil.flowable.demo.service;

import java.util.List;

import com.daffodil.core.entity.Query;
import com.daffodil.flowable.demo.entity.Expense;

/**
 * 费用报销服务
 * @author yweijian
 * @date 2020年1月10日
 * @version 1.0
 */
public interface IExpenseService {

	/**
	 * 查询费用报销列表
	 * @param query
	 * @return
	 */
	public List<Expense> selectExpenseList(Query<Expense> query);
	
	/**
	 * 查询费用报销信息
	 * @param expenseId
	 * @return
	 */
	public Expense selectExpenseById(String expenseId);

	/**
	 * 新增费用报销
	 * @param expense
	 */
	public void insertExpense(Expense expense);

	/**
	 * 修改费用报销
	 * @param expense
	 */
	public void updateExpense(Expense expense);

	/**
	 * 删除费用报销信息
	 * @param ids
	 */
	public void deleteExpenseByIds(String[] ids);
}
