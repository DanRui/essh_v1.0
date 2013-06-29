package com.eryansky.common.model;

import java.io.Serializable;
import javax.persistence.MappedSuperclass;

import com.eryansky.common.orm.entity.BaseEntity;

/**
 * 用户抽象类.
 * @author 尔演&Eryan eryanwcp@gmail.com
 * @date 2013-3-24 下午3:08:54 
 *
 */
@SuppressWarnings("serial")
@MappedSuperclass
public abstract class User extends BaseEntity implements Serializable {

	public abstract String getPassword();

	public abstract String getLoginName();

	public boolean isLocked() {
		return true;
	}

	public boolean isEnabled() {
		return true;
	}
}