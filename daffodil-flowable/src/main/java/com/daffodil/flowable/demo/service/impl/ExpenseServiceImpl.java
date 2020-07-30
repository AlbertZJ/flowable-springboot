package com.daffodil.flowable.demo.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.daffodil.core.dao.JpaDao;
import com.daffodil.core.entity.Query;
import com.daffodil.flowable.demo.entity.Expense;
import com.daffodil.flowable.demo.service.IExpenseService;
import com.daffodil.framework.shiro.util.ShiroUtils;
import com.daffodil.system.entity.SysUser;
import com.daffodil.util.StringUtils;

@Service
public class ExpenseServiceImpl implements IExpenseService{

	@Autowired
	private JpaDao jpaDao;
	
	@Override
	public List<Expense> selectExpenseList(Query<Expense> query) {
		String hql = "from Expense where 1=1 ";
		SysUser user = ShiroUtils.getSysUser();
		List<Object> paras = new ArrayList<Object>();
		Expense expense = query.getEntity();
		if(StringUtils.isNotEmpty(expense.getTitle())){
			hql += "and title like ? ";
			paras.add("%" + expense.getTitle() + "%");
		}
		if(StringUtils.isNotNull(user)){
			hql += "and createBy = ? ";
			paras.add(user.getLoginName());
		}
		if(StringUtils.isNotEmpty(query.getOrderBy())){
			hql += "order by " + query.getOrderBy();
		}
		if(null != query.getPage()){
			return jpaDao.search(hql, paras, Expense.class, query.getPage());
		}else{
			return jpaDao.search(hql, paras, Expense.class);
		}
	}

	@Override
	public Expense selectExpenseById(String expenseId) {
		return jpaDao.find(Expense.class, expenseId);
	}

	@Override
	@Transactional
	public void insertExpense(Expense expense) {
		expense.setCreateBy(ShiroUtils.getLoginName());
		expense.setCreateTime(new Date());
		jpaDao.save(expense);
	}

	@Override
	@Transactional
	public void updateExpense(Expense expense) {
		expense.setUpdateBy(ShiroUtils.getLoginName());
		expense.setUpdateTime(new Date());
		jpaDao.update(expense);
	}

	@Override
	@Transactional
	public void deleteExpenseByIds(String[] ids) {
		if(StringUtils.isNotEmpty(ids)){
			jpaDao.delete(Expense.class, ids);
		}
	}

}
