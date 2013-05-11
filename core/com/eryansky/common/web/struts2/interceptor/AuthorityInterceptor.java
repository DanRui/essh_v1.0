package com.eryansky.common.web.struts2.interceptor;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.MethodFilterInterceptor;
import com.eryansky.common.utils.SysConstants;
import com.eryansky.common.web.struts2.utils.Struts2Utils;

/**
 * 登录验证拦截器.
 * @author 尔演&Eryan eryanwcp@gmail.com
 */
@SuppressWarnings("serial")
public class AuthorityInterceptor extends MethodFilterInterceptor{

	@Override
	protected String doIntercept(ActionInvocation actioninvocation) throws Exception {
	    //登录用户
		Object user = Struts2Utils.getSessionAttribute(SysConstants.SESSION_USER);
		if(user != null){
			return actioninvocation.invoke(); //递归调用拦截器
		}else{
			return Action.LOGIN; //返回到登录页面
		}
		
	}
}
