package com.eryansky.web;

import com.eryansky.common.model.TreeNode;
import com.eryansky.service.base.ResourceManager;
import com.google.common.collect.Lists;
import org.apache.commons.lang3.Validate;
import org.springframework.beans.factory.annotation.Autowired;

import com.eryansky.common.model.Result;
import com.eryansky.common.utils.SysConstants;
import com.eryansky.common.utils.StringUtils;
import com.eryansky.common.utils.encode.Encrypt;
import com.eryansky.common.web.struts2.SimpleActionSupport;
import com.eryansky.common.web.struts2.utils.Struts2Utils;
import com.eryansky.entity.base.User;
import com.eryansky.entity.base.state.StatusState;
import com.eryansky.service.base.UserManager;
import com.eryansky.utils.AppUtils;

import java.util.List;

/**
 * 系统登录.
 * Author 尔演&Eryan eryanwcp@gmail.com
 * Date 2013-3-21 上午12:18:54
 *
 */
@SuppressWarnings("serial")
public class LoginAction
        extends SimpleActionSupport {

    /**
     * 登录用户名
     */
    private String loginName;
    /**
     * 登录密码
     */
    private String password; 
    /**
     * 验证码
     */
    private String validateCode;
    /**
     * 提示信息
     */
    private String msg;

    /**
     * 操作员管理Service
     */
    @Autowired
    private UserManager userManager;
    @Autowired
    private ResourceManager resourceManager;
    
    public String welcome() throws Exception{
        return list();
    }

    public String list() throws Exception{
    	return SUCCESS;
    }

    /**
     * 用户登录验证
     * @throws Exception 
     */
    public String login() throws Exception {
    	Result result = null;
        try {
            //如果校验不通过将会抛出异常 异常会被异常拦截器ExceptionInterceptor拦截并返回客户端 客户端解析返回的数据即可做相应的提示
        	Validate.notBlank(loginName, "用户名不能为空!");
        	Validate.notBlank(password, "密码不能为空!");
            //验证码校验
            if (StringUtils.isEmpty(loginName) || StringUtils.isEmpty(password)) {
                msg = "用户名或密码不能为空!";
                result = new Result(Result.ERROR, msg, null);
                Struts2Utils.renderJson(result);
                return null;
            }
            /*
            if (StringUtils.isEmpty(validateCode)) {
                msg = "验证码不能为空!";
                result = new Result(Result.RESULT_ERROR, msg, null);
                Struts2Utils.renderJson(result);
                return null;
            }else{
            	if(!ValidateCodeServlet.validate(Struts2Utils.getRequest(), validateCode)){
            		 msg = "验证码不正确或验证码已过期!";
                     result = new Result(Result.RESULT_ERROR, msg, null);
                     Struts2Utils.renderJson(result);
                     return null;
            	}
            }
            */
            // 获取用户信息
            User user = userManager.getUserByLP(loginName, Encrypt.e(password));
            if (user == null) {
                msg = "用户名或密码不正确!";
            }else if (user.getStatus().intValue() == StatusState.lock.getValue()) {
                msg = "该用户已被锁定，暂不允许登陆!";
            }
            if(msg != null){
            	result = new Result(Result.ERROR, msg, null);
                Struts2Utils.renderJson(result);
                return null;
            }
        	result = new Result(Result.SUCCESS, "用户验证通过!", Struts2Utils.getRequest().getContextPath()+"/login!index.action");
            Struts2Utils.renderJson(result);
            Struts2Utils.getSession().setAttribute(SysConstants.SESSION_USER, user);
            
            AppUtils.putUserToSession(user);
            logger.info("用户{}登录系统,IP:{}.", user.getLoginName(),Struts2Utils.getIp());
        } catch (Exception e) {
            throw e;
        }
        return null;
    }

    /**
     * 当前在线用户
     * @throws Exception
     */
    public void onlineDatagrid() throws Exception{
    	try {
			Struts2Utils.renderJson(AppUtils.getSessionUser());
		} catch (Exception e) {
			throw e;
		}
    }

    /**
     * 导航菜单.
     */
    public void navTree() throws Exception {
        List<TreeNode> treeNodes = Lists.newArrayList();
        try {
            User user = (User) Struts2Utils
                    .getSessionAttribute(SysConstants.SESSION_USER);
            if (user != null) {
                treeNodes = resourceManager.getNavMenuTreeByUserId(user.getId());
            }
            Struts2Utils.renderJson(treeNodes);
        } catch (Exception e) {
            throw e;
        }
    }
    
    /**
     * 注销登录
     */
    public String logout() {
        try {
            // 退出时清空session中的内容
            User user = (User) Struts2Utils.getSessionAttribute(SysConstants.SESSION_USER);
            Struts2Utils.getSession().setAttribute(SysConstants.SESSION_USER, null);
            String sessionId = Struts2Utils.getSession().getId();
            //由监听器更新在线用户列表
//            AppUtils.removeUserFromSession(sessionId);
            logger.info("用户{}退出系统.", user.getLoginName());
        } catch (Exception e) {
            e.printStackTrace();
        }
        return SUCCESS;
    }

    /**
     * 后台管理主界面
     * @return
     * @throws Exception
     */
    public String index() throws Exception {
        return "index";
    }
    
    /**
     * 防止重复提示错误信息
     */
    public void prepare() {
        clearErrorsAndMessages();
    }

    public void setLoginName(String loginName) {
        this.loginName = loginName;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setValidateCode(String validateCode) {
        this.validateCode = validateCode;
    }

    public String getMsg() {
        return msg;
    }

}
