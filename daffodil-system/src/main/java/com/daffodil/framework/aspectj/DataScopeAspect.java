package com.daffodil.framework.aspectj;

import java.lang.reflect.Method;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.Signature;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.aspectj.lang.reflect.MethodSignature;
import org.springframework.stereotype.Component;

import com.daffodil.core.annotation.DataScope;
import com.daffodil.core.constant.Constants;
import com.daffodil.core.entity.Query;
import com.daffodil.framework.shiro.util.ShiroUtils;
import com.daffodil.system.entity.SysRole;
import com.daffodil.system.entity.SysUser;
import com.daffodil.util.StringUtils;

/**
 * 数据过滤
 * 
 * @author yweijian
 * @date 2019年8月25日
 * @version 1.0
 */
@Aspect
@Component
public class DataScopeAspect {

	// 配置织入点
	@Pointcut("@annotation(com.daffodil.core.annotation.DataScope)")
	public void dataScopePointCut() {
		
	}

	@Before("dataScopePointCut()")
	public void doBefore(JoinPoint point) throws Throwable {
		this.handleDataScope(point);
	}

	protected void handleDataScope(final JoinPoint joinPoint) {
		// 获得注解
		DataScope dataScope = this.getAnnotationLog(joinPoint);
		if (dataScope == null) {
			return;
		}
		// 获取当前的用户
		SysUser currentUser = ShiroUtils.getSysUser();
		if (currentUser != null) {
			// 如果是超级管理员，则不过滤数据
			if (!ShiroUtils.isAdmin()) {
				this.dataScopeFilter(joinPoint, currentUser, dataScope.deptAlias(), dataScope.userAlias());
			}
		}
	}

	/**
	 * 数据范围过滤
	 * @param joinPoint
	 * @param user
	 * @param deptAlias 部门别名
	 * @param userAlias 用户别名
	 */
	public void dataScopeFilter(JoinPoint joinPoint, SysUser user, String deptAlias, String userAlias) {
		StringBuilder sqlString = new StringBuilder();

		for (SysRole role : user.getRoles()) {
			String dataScope = role.getDataScope();
			if (Constants.DATA_SCOPE_ALL.equals(dataScope)) {
				sqlString = new StringBuilder();
				break;
			} else if (Constants.DATA_SCOPE_CUSTOM.equals(dataScope)) {
				sqlString.append(StringUtils.format(" or {}.id in ( select deptId from SysRoleDept where roleId = '{}' ) ", deptAlias, role.getId()));
			} else if (Constants.DATA_SCOPE_DEPT.equals(dataScope)) {
				sqlString.append(StringUtils.format(" or {}.id = '{}' ", deptAlias, user.getDeptId()));
			} else if (Constants.DATA_SCOPE_DEPT_AND_CHILD.equals(dataScope)) {
				sqlString.append(StringUtils.format(" or {}.id in ( select id from SysDept where id = '{}' or ancestors like '%{}%' )", deptAlias, user.getDeptId(), user.getDeptId()));
			} else if (Constants.DATA_SCOPE_SELF.equals(dataScope)) {
				if (StringUtils.isNotEmpty(userAlias)) {
					sqlString.append(StringUtils.format(" or {}.id = '{}' ", userAlias, user.getId()));
				} else {
					// 数据权限为仅本人且没有userAlias别名不查询任何数据
					sqlString.append(" or 1=0 ");
				}
			}
		}

		if (StringUtils.isNotEmpty(sqlString.toString())) {
			if(joinPoint.getArgs()[0] instanceof Query){
				Query<?> query = (Query<?>) joinPoint.getArgs()[0];
				query.setDataScope(" and (" + sqlString.substring(4) + ") ");
			}
		}
	}

	/**
	 * 是否存在注解，如果存在就获取
	 */
	private DataScope getAnnotationLog(JoinPoint joinPoint) {
		Signature signature = joinPoint.getSignature();
		MethodSignature methodSignature = (MethodSignature) signature;
		Method method = methodSignature.getMethod();

		if (method != null) {
			return method.getAnnotation(DataScope.class);
		}
		return null;
	}
}
