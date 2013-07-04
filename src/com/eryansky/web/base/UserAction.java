package com.eryansky.web.base;

import java.util.List;

import javax.transaction.SystemException;

import org.springframework.beans.factory.annotation.Autowired;

import com.eryansky.common.model.Result;
import com.eryansky.common.orm.hibernate.EntityManager;
import com.eryansky.common.utils.StringUtils;
import com.eryansky.common.utils.encode.Encrypt;
import com.eryansky.common.web.struts2.StrutsAction;
import com.eryansky.common.web.struts2.utils.Struts2Utils;
import com.eryansky.entity.base.Role;
import com.eryansky.entity.base.User;
import com.eryansky.service.base.RoleManager;
import com.eryansky.service.base.UserManager;
import com.eryansky.utils.AppConstants;
import com.google.common.collect.Lists;

/**
 * 用户User管理 Action层.
 * @author 尔演&Eryan eryanwcp@gmail.com
 * @date 2013-3-21 上午12:20:13 
 *
 */
@SuppressWarnings("serial")
public class UserAction extends StrutsAction<User> {

	private String upateOperate;// 修改密码操作码 1:顶部 0:列表
	private String newPassword;// 新密码

	@Autowired
	private UserManager userManager;
	@Autowired
	private RoleManager roleManager;
	//用户关连角色ID集合
	private List<Long> roleIds = Lists.newArrayList();

	@Override
	public EntityManager<User, Long> getEntityManager() {
		return userManager;
	}
	/**
	 * 保存.
	 */
	@Override
	public String save() throws Exception {
		Result result = null;
		try {
			 // 名称重复校验
			User user = userManager.getUserByLoginName(model.getLoginName());
            if (user != null && !user.getId().equals(model.getId())) {
            	result = new Result(Result.WARN,"登录名为["+model.getLoginName()+"]已存在,请修正!", "loginName");
                logger.debug(result.toString());
                Struts2Utils.renderText(result);
                return null;
            }
            
            if (model.getId() == null) {// 新增
            	model.setPassword(Encrypt.e(model.getPassword()));
            } else {// 修改
				User superUser = userManager.getSuperUser();
				User sessionUser = userManager.getCurrentUser();
				if (!sessionUser.getId().equals(superUser.getId())) {
					throw new SystemException("超级用户信息仅允许自己修改!");
				}
            }
            userManager.saveEntity(model);
            result = Result.successResult();
            logger.debug(result.toString());
            Struts2Utils.renderText(result);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		return null;
	}

	/**
	 * 修改用户角色页面.
	 */
	public String role() throws Exception {
		return "role";

	}
	
	//调用updateUserRole()方法之前执行
	public void prepareUpdateUserRole() throws Exception {
		super.prepareModel();
	}
	/**
	 * 修改用户角色.
	 */
	public void updateUserRole() throws Exception {
		Result result = null;
		try {
			List<Role> rs = Lists.newArrayList();
			for (Long id : roleIds) {
				Role role = roleManager.loadById(id);
				rs.add(role);
			}
			model.setRoles(rs);
			userManager.saveEntity(model);
			result = Result.successResult();
			Struts2Utils.renderText(result);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}

	}

	/**
	 * 修改用户密码页面.
	 */
	public String password() throws Exception {
		return "password";

	}
	//调用updateUserRole()方法之前执行
	public void prepareUpdateUserPassword() throws Exception {
		super.prepareModel();
	}
		
	/**
	 * 修改用户密码.
	 * <br>参数upateOperate 需要密码"1" 不需要密码"0".
	 */
	public String updateUserPassword() throws Exception {
		Result result;
		try {
			if (!StringUtils.isEmpty(upateOperate)) {
				User user = userManager.loadById(model.getId());
				if (user != null) {
					boolean isCheck = true;
					//需要输入原始密码
					if (AppConstants.USER_UPDATE_PASSWORD_YES.equals(upateOperate)) {
						if (!user.getPassword().equals(
								Encrypt.e(model.getPassword()))) {
							isCheck = false;
						}
					}
					//不需要输入原始密码
					if (AppConstants.USER_UPDATE_PASSWORD_NO.equals(upateOperate)) {
						isCheck = true;
					}
					if (isCheck) {
						user.setPassword(Encrypt.e(newPassword));
						userManager.saveEntity(user);
						result = Result.successResult();
					} else {
						result = new Result(Result.WARN, "原始密码输入错误.","password");
					}
				} else {
					result = new Result(Result.ERROR,"修改的用户不存在或已被删除.", null);
				}
			}else{
				result = Result.errorResult();
				logger.warn("请求参数从错误.");
			}
			logger.debug(result.toString());
			Struts2Utils.renderText(result);
		} catch (Exception e) {
			throw e;
		}
		return null;
	}


	public void setNewPassword(String newPassword) {
		this.newPassword = newPassword;
	}

	public void setUpateOperate(String upateOperate) {
		this.upateOperate = upateOperate;
	}
	
	public void setRoleIds(List<Long> roleIds) {
		this.roleIds = roleIds;
	}

}
