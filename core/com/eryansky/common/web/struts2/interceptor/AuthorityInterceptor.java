package com.eryansky.common.web.struts2.interceptor;

import com.eryansky.common.utils.StringUtils;
import com.eryansky.common.web.struts2.utils.Struts2Utils;
import com.eryansky.entity.base.User;
import com.eryansky.service.base.ResourceManager;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.MethodFilterInterceptor;
import com.eryansky.common.utils.SysConstants;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * 登录验证拦截器.
 * @author 尔演&Eryan eryanwcp@gmail.com
 */
@SuppressWarnings("serial")
public class AuthorityInterceptor extends MethodFilterInterceptor{

    protected Logger logger = LoggerFactory.getLogger(getClass());

    @Autowired
    private ResourceManager resourceManager;

	@Override
	protected String doIntercept(ActionInvocation actioninvocation) throws Exception {
	    //登录用户
		User sessionUser = (User) Struts2Utils.getSessionAttribute(SysConstants.SESSION_USER);
        String requestUrl = Struts2Utils.getRequest().getRequestURI();

		if(sessionUser != null){
            //清空session中清空未被授权的访问地址
            Object unAuthorityUrl = Struts2Utils.getSession().getAttribute(SysConstants.SESSION_UNAUTHORITY_URL);
            if(unAuthorityUrl != null){
                Struts2Utils.getSession().setAttribute(SysConstants.SESSION_UNAUTHORITY_URL,null);
            }

            String url = StringUtils.replaceOnce(requestUrl,  Struts2Utils.getRequest().getContextPath(), "");
            //检查用户是否授权该URL
            boolean isAuthority = resourceManager.isAuthority(url,sessionUser.getId());
            if(!isAuthority){
                logger.warn("用户{}未被授权URL:{}", sessionUser.getLoginName(), requestUrl);
                return "noauthority"; //返回403页面 返回"noauthority"由struts.xml配置
            }

			return actioninvocation.invoke(); //递归调用拦截器
		}else{
            Struts2Utils.getSession().setAttribute(SysConstants.SESSION_UNAUTHORITY_URL,requestUrl);
			return Action.LOGIN; //返回到登录页面
		}
		
	}

}
