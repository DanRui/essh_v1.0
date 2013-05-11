package com.eryansky.utils;

import java.util.List;
import java.util.Set;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.eryansky.common.model.Datagrid;
import com.eryansky.common.model.SessionInfo;
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
public class AppUtils {
	private static final Logger logger = LoggerFactory
			.getLogger(AppUtils.class);
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
		AppConstants.sessionUser.put(sessionId,userToSessionInfo(user));
	}
	
	public static void removeUserFromSession(String sessionId){
		if(StringUtils.isNotBlank(sessionId)){
			Set<String> keySet = AppConstants.sessionUser.keySet();
			for(String key:keySet){
				if(key.equals(sessionId)){
					logger.debug("removeUserFromSession:{}",sessionId);
					AppConstants.sessionUser.remove(key);
				}
			}
		}
	}
	
	public static Datagrid<SessionInfo> getSessionUser(){
		List<SessionInfo> list = Lists.newArrayList();
		Set<String> keySet = AppConstants.sessionUser.keySet();
		for(String key:keySet){
			SessionInfo sessionInfo = AppConstants.sessionUser.get(key);
			list.add(sessionInfo);
		}
		Datagrid<SessionInfo> dg = new Datagrid<SessionInfo>(AppConstants.sessionUser.size(), list);
		return dg;
	}
}
