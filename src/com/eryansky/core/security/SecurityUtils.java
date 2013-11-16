package com.eryansky.core.security;

import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.Set;

import com.eryansky.common.spring.SpringContextHolder;
import com.eryansky.service.base.ResourceManager;
import com.eryansky.service.base.UserManager;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.eryansky.common.model.Datagrid;
import com.eryansky.common.utils.StringUtils;
import com.eryansky.common.web.struts2.utils.Struts2Utils;
import com.eryansky.entity.base.User;
import com.google.common.collect.Lists;

/**
 * 系统使用的特殊工具类 简化代码编写.
 * 
 * @author 尔演&Eryan eryanwcp@gmail.com
 * @date 2012-10-18 上午8:25:36
 */
public class SecurityUtils {
	private static final Logger logger = LoggerFactory
			.getLogger(SecurityUtils.class);

    /**
     * 是否授权某个资源
     * @param resourceCode 资源编码
     * @return
     */
    public static boolean isPermitted(String resourceCode) {
        boolean flag = false;
        try {
            ResourceManager resourceManager = SpringContextHolder.getBean("resourceManager");
            UserManager userManager = SpringContextHolder.getBean("userManager");
            User superUser = userManager.getSuperUser();
            SessionInfo sessionInfo = getCurrentSessionInfo();
            if (sessionInfo != null && superUser != null
                    && sessionInfo.getUserId() == superUser.getId()) {// 超级用户
                flag = true;
            } else {
                flag = resourceManager.isUserPermittedResourceCode(sessionInfo.getUserId(), resourceCode);
            }
        } catch (Exception e) {
            logger.error(e.getMessage());
            e.printStackTrace();
        }
        return flag;
    }

    /**
	 * User转SessionInfo.
	 * @param user
	 * @return
	 */
	public static SessionInfo userToSessionInfo(User user){
		SessionInfo sessionInfo = new SessionInfo();
		sessionInfo.setUserId(user.getId());
		sessionInfo.setLoginName(user.getLoginName());
		sessionInfo.setRoleIds(user.getRoleIds());
        sessionInfo.setRoleNames(user.getRoleNames());
        sessionInfo.setLoginOrganName(user.getDefaultOrganName());
        sessionInfo.setOrganNames(user.getOrganNames());
		sessionInfo.setIp(Struts2Utils.getIp());
		return sessionInfo;
	}
	
	/**
	 * 将用户放入session中.
	 * @param user
	 */
	public static void putUserToSession(User user){
		String sessionId = Struts2Utils.getSession().getId();
		logger.debug("putUserToSession:{}",sessionId);
        SessionInfo sessionInfo =  userToSessionInfo(user);
        sessionInfo.setId(sessionId);
        Struts2Utils.getSession().setAttribute(SecurityConstants.SESSION_SESSIONINFO, sessionInfo);
        SecurityConstants.sessionInfoMap.put(sessionId,sessionInfo);
	}

    /**
     * 获取当前用户session信息.
     */
    public static SessionInfo getCurrentSessionInfo(){
        return (SessionInfo)Struts2Utils.getSessionAttribute(SecurityConstants.SESSION_SESSIONINFO);
    }
	
	public static void removeUserFromSession(String sessionId){
		if(StringUtils.isNotBlank(sessionId)){
			Set<String> keySet = SecurityConstants.sessionInfoMap.keySet();
			for(String key:keySet){
				if(key.equals(sessionId)){
					logger.debug("removeUserFromSession:{}",sessionId);
                    SecurityConstants.sessionInfoMap.remove(key);
				}
			}
		}
	}
	
	public static Datagrid<SessionInfo> getSessionUser(){
		List<SessionInfo> list = Lists.newArrayList();
		Set<String> keySet = SecurityConstants.sessionInfoMap.keySet();
		for(String key:keySet){
			SessionInfo sessionInfo = SecurityConstants.sessionInfoMap.get(key);
			list.add(sessionInfo);
		}
		//排序
	    Collections.sort(list, new Comparator<SessionInfo>() {
			@Override
			public int compare(SessionInfo o1, SessionInfo o2) {
				return o2.getLoginTime().compareTo(o1.getLoginTime());
			}
		}); 
			 
		Datagrid<SessionInfo> dg = new Datagrid<SessionInfo>(SecurityConstants.sessionInfoMap.size(), list);
		return dg;
	}
}

