package com.daffodil.system.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.daffodil.core.annotation.DataScope;
import com.daffodil.core.constant.Constants;
import com.daffodil.core.dao.JpaDao;
import com.daffodil.core.entity.Query;
import com.daffodil.core.exception.BaseException;
import com.daffodil.framework.shiro.util.ShiroUtils;
import com.daffodil.system.entity.SysConfig;
import com.daffodil.system.entity.SysDept;
import com.daffodil.system.entity.SysPost;
import com.daffodil.system.entity.SysRole;
import com.daffodil.system.entity.SysUser;
import com.daffodil.system.entity.SysUserPost;
import com.daffodil.system.entity.SysUserRole;
import com.daffodil.system.service.ISysUserService;
import com.daffodil.util.HqlUtils;
import com.daffodil.util.StringUtils;

/**
 * 用户管理逻辑实现
 * @author yweijian
 * @date 2020年1月7日
 * @version 1.0
 */
@Service
public class SysUserServiceImpl implements ISysUserService {
	
	private static final Logger log = LoggerFactory.getLogger(SysUserServiceImpl.class);

	@Autowired
	private JpaDao jpaDao;

	@Override
	@DataScope(deptAlias = "d", userAlias = "u")
	public List<SysUser> selectUserList(Query<SysUser> query) {
		
		StringBuffer hql = new StringBuffer();
		List<Object> paras = new ArrayList<Object>();
		SysUser sysUser = query.getEntity();
		
		hql.append("select u from SysUser u left join SysDept d on u.deptId=d.id where 1=1 ");
		if(StringUtils.isNotEmpty(sysUser.getDeptId())){
			hql.append("and (u.deptId = ? or u.deptId in (select t.id from SysDept t where ancestors like ?)) ");
			paras.add(sysUser.getDeptId());
			paras.add("%" + sysUser.getDeptId() + "%");
		}
		HqlUtils.createHql(hql, paras, query, "u");
		
		return jpaDao.search(hql.toString(), paras, SysUser.class, query.getPage());
	}

	@DataScope(deptAlias = "d", userAlias = "u")
	public List<SysUser> selectAllocatedList(Query<SysUser> query) {
		StringBuffer hql = new StringBuffer();
		List<Object> paras = new ArrayList<Object>();
		SysUser sysUser = query.getEntity();
		Map<String, Object> params = query.getParams();
		
		hql.append("select u from SysUser u left join SysDept d on u.deptId=d.id where u.id ");
		
		hql.append(Constants.YES.equals(params.get("allocated")) ? "in " : " not in ");
		
		hql.append(StringUtils.format("(select distinct userId from SysUserRole where roleId in {})", HqlUtils.createHql(paras, sysUser.getRoleIds())));
		
		HqlUtils.createHql(hql, paras, query, "u");
		
		return jpaDao.search(hql.toString(), paras, SysUser.class, query.getPage());
	}

	@Override
	public SysUser selectUserByLoginName(String loginName) {
		return jpaDao.find("from SysUser where status != '2' and loginName = ?", loginName, SysUser.class);
	}

	@Override
	public SysUser selectUserByPhone(String phone) {
		return jpaDao.find("from SysUser where status != '2' and phone = ?", phone, SysUser.class);
	}

	@Override
	public SysUser selectUserByEmail(String email) {
		return jpaDao.find("from SysUser where status != '2' and email = ?", email, SysUser.class);
	}

	@Override
	public SysUser selectUserById(String userId) {
		SysUser user = jpaDao.find(SysUser.class, userId);
		SysDept dept = jpaDao.find(SysDept.class, user.getDeptId());
		List<SysRole> roles = jpaDao.search("select r from SysRole r,SysUserRole ur where r.id=ur.roleId and ur.userId = ?", userId, SysRole.class);
		List<SysPost> posts = jpaDao.search("select p from SysPost p,SysUserPost up where p.id=up.postId and up.userId = ?", userId, SysPost.class);
		user.setDept(dept);
		user.setRoles(roles);
		user.setPosts(posts);
		return user;
	}

	@Override
	@Transactional
	public void deleteUserByIds(String[] ids) {
		if(StringUtils.isNotEmpty(ids)){
			for(String userId : ids){
				SysUser user = this.selectUserById(userId);
				if (StringUtils.isNotNull(user.getId()) && Constants.YES.equals(user.getIsAdmin())) {
					throw new BaseException("删除用户【" + user.getLoginName() + "】失败，不允许删除超级管理员用户");
				}
				// 删除用户与角色关联
				jpaDao.delete("delete from SysUserRole where userId = ?", userId);
				// 删除用户与岗位关联
				jpaDao.delete("delete from SysUserPost where userId = ?", userId);
				// 删除用户
				jpaDao.delete(SysUser.class, userId);
			}
		}
	}

	@Override
	@Transactional
	public void insertUser(SysUser user) {
		if (this.checkLoginNameUnique(user)) {
			throw new BaseException("新增用户【" + user.getLoginName() + "】失败，登录账号已存在");
		} else if (this.checkPhoneUnique(user)) {
			throw new BaseException("新增用户【" + user.getLoginName() + "】失败，手机号码已存在");
		} else if (this.checkEmailUnique(user)) {
			throw new BaseException("新增用户【" + user.getLoginName() + "】失败，邮箱账号已存在");
		}
		// 新增用户信息
		user.setSalt(ShiroUtils.randomSalt());
		user.setPassword(ShiroUtils.encryptPassword(user.getLoginName(), user.getPassword(), user.getSalt()));
		user.setCreateBy(ShiroUtils.getLoginName());
		user.setCreateTime(new Date());
		jpaDao.save(user);
		// 新增用户岗位关联
		this.insertUserPost(user);
		// 新增用户与角色管理
		this.insertUserRole(user);
	}

	@Override
	@Transactional
	public void updateUser(SysUser user) {
		if (StringUtils.isNotNull(user.getId()) && Constants.YES.equals(user.getIsAdmin())) {
			throw new BaseException("修改用户【" + user.getLoginName() + "】失败，不允许修改超级管理员用户");
		} else if (this.checkPhoneUnique(user)) {
			throw new BaseException("修改用户【" + user.getLoginName() + "】失败，手机号码已存在");
		} else if (this.checkEmailUnique(user)) {
			throw new BaseException("修改用户【" + user.getLoginName() + "】失败，邮箱账号已存在");
		}
		// 删除用户与角色关联
		jpaDao.delete("delete from SysUserRole where userId = ? ", user.getId());
		// 新增用户与角色管理
		this.insertUserRole(user);
		// 删除用户与岗位关联
		jpaDao.delete("delete from SysUserPost where userId = ? ", user.getId());
		// 新增用户与岗位管理
		this.insertUserPost(user);
		// 保存用户
		user.setUpdateBy(ShiroUtils.getLoginName());
		user.setUpdateTime(new Date());
		jpaDao.update(user);
	}

	@Override
	@Transactional
	public void updateUserInfo(SysUser user) {
		jpaDao.update(user);
	}

	@Override
	@Transactional
	public void resetUserPwd(SysUser user) {
		jpaDao.update(user);
	}

	@Transactional
	public void insertUserRole(SysUser user) {
		String[] roles = user.getRoleIds();
		if (StringUtils.isNotNull(roles)) {
			// 新增用户与角色关联
			for (String roleId : roles) {
				SysUserRole userRole = new SysUserRole();
				userRole.setUserId(user.getId());
				userRole.setRoleId(roleId);
				jpaDao.save(userRole);
			}
		}
	}

	@Transactional
	public void insertUserPost(SysUser user) {
		String[] posts = user.getPostIds();
		if (StringUtils.isNotNull(posts)) {
			// 新增用户与岗位关联
			for (String postId : posts) {
				SysUserPost userPost = new SysUserPost();
				userPost.setUserId(user.getId());
				userPost.setPostId(postId);
				jpaDao.save(userPost);
			}
		}
	}

	@Override
	public boolean checkLoginNameUnique(SysUser user) {
		List<Object> paras = new ArrayList<Object>();
		String hql = "from SysUser where status != '2' and loginName = ? ";
		paras.add(user.getLoginName());
		if(StringUtils.isNotEmpty(user.getId())){
			hql += "and id != ? ";
			paras.add(user.getId());
		}
		SysUser sysUser = jpaDao.find(hql, paras, SysUser.class);
		if (sysUser != null) {
			return Constants.NOT_UNIQUE;
		}
		return Constants.IS_UNIQUE;
	}

	@Override
	public boolean checkPhoneUnique(SysUser user) {
		List<Object> paras = new ArrayList<Object>();
		String hql = "from SysUser where status != '2' and phone = ? ";
		paras.add(user.getPhone());
		if(StringUtils.isNotEmpty(user.getId())){
			hql += "and id != ? ";
			paras.add(user.getId());
		}
		SysUser sysUser = jpaDao.find(hql, paras, SysUser.class);
		if (sysUser != null) {
			return Constants.NOT_UNIQUE;
		}
		return Constants.IS_UNIQUE;
	}

	@Override
	public boolean checkEmailUnique(SysUser user) {
		List<Object> paras = new ArrayList<Object>();
		String hql = "from SysUser where status != '2' and email = ? ";
		paras.add(user.getEmail());
		if(StringUtils.isNotEmpty(user.getId())){
			hql += "and id != ? ";
			paras.add(user.getId());
		}
		SysUser sysUser = jpaDao.find(hql, paras, SysUser.class);
		if (sysUser != null) {
			return Constants.NOT_UNIQUE;
		}
		return Constants.IS_UNIQUE;
	}

	@Override
	public String selectUserRoleGroup(String userId) {
		String hql = "select r from SysRole r " +
				"left join SysUserRole ur on ur.roleId = r.id " +
				"left join SysUser u on u.id = ur.userId " +
				"left join SysDept d on u.deptId = d.id	where u.status != '2' and ur.userId = ?";
		List<SysRole> list = jpaDao.search(hql, userId, SysRole.class);
		StringBuffer idsStr = new StringBuffer();
		for (SysRole role : list) {
			idsStr.append(role.getRoleName()).append(",");
		}
		if (StringUtils.isNotEmpty(idsStr.toString())) {
			return idsStr.substring(0, idsStr.length() - 1);
		}
		return idsStr.toString();
	}

	@Override
	public String selectUserPostGroup(String userId) {
		String hql = "select p from SysUser u " +
			 "left join SysUserPost up on u.id = up.userId " +
			 "left join SysPost p on up.postId = p.id where up.userId = ?";
		List<SysPost> list = jpaDao.search(hql, userId, SysPost.class);
		StringBuffer idsStr = new StringBuffer();
		for (SysPost post : list) {
			idsStr.append(post.getPostName()).append(",");
		}
		if (StringUtils.isNotEmpty(idsStr.toString())) {
			return idsStr.substring(0, idsStr.length() - 1);
		}
		return idsStr.toString();
	}

	@Override
	@Transactional
	public String importUser(List<SysUser> userList, Boolean isUpdateSupport, String operName) {
		if (StringUtils.isNull(userList) || userList.size() == 0) {
			throw new BaseException("导入用户数据不能为空！");
		}
		int successNum = 0;
		int failureNum = 0;
		StringBuilder successMsg = new StringBuilder();
		StringBuilder failureMsg = new StringBuilder();
		SysConfig sysConfig = jpaDao.find("from SysConfig where configKey = ?", "sys.user.initPassword", SysConfig.class);
		for (SysUser user : userList) {
			try {
				// 验证是否存在这个用户
				SysUser sysUser = jpaDao.find("from SysUser where loginName = ?", user.getLoginName(), SysUser.class);
				if (StringUtils.isNull(sysUser)) {
					user.setPassword(sysConfig.getConfigValue());
					this.insertUser(user);
					successNum++;
					successMsg.append("<br/>" + successNum + "、账号 " + user.getLoginName() + " 导入成功");
				} else if (isUpdateSupport) {
					user.setId(sysUser.getId());
					this.updateUser(user);
					successNum++;
					successMsg.append("<br/>" + successNum + "、账号 " + user.getLoginName() + " 更新成功");
				} else {
					failureNum++;
					failureMsg.append("<br/>" + failureNum + "、账号 " + user.getLoginName() + " 已存在");
				}
			} catch (Exception e) {
				failureNum++;
				String msg = "<br/>" + failureNum + "、账号 " + user.getLoginName() + " 导入失败：";
				failureMsg.append(msg + e.getMessage());
				log.error(msg, e);
			}
		}
		if (failureNum > 0) {
			failureMsg.insert(0, "很抱歉，导入失败！共 " + failureNum + " 条数据格式不正确，错误如下：");
			throw new BaseException(failureMsg.toString());
		} else {
			successMsg.insert(0, "恭喜您，数据已全部导入成功！共 " + successNum + " 条，数据如下：");
		}
		return successMsg.toString();
	}
}
