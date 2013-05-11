package com.eryansky.webservice.server.result;

import javax.xml.bind.annotation.XmlType;

import com.eryansky.entity.base.User;
import com.eryansky.webservice.server.WsConstants;


/**
 * GetUser方法的返回结果.
 * @author 尔演&Eryan eryanwcp@gmail.com
 * @date 2013-3-11 下午9:28:05 
 *
 */
@XmlType(name = "GetUserResult", namespace = WsConstants.NS)
public class GetUserResult extends WSResult {

	private User user;

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
}
