package com.eryansky.common.model;


import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.MappedSuperclass;

import org.hibernate.annotations.GenericGenerator;

/**
 * 统一定义id的entity基类,Hibernate 36位uuid.
 * @author 尔演&Eryan eryanwcp@gmail.com
 * @date 2013-3-25 下午9:53:22 
 *
 */
// JPA 基类的标识
@MappedSuperclass
public abstract class UUIDEntity {

	/**
	 * 主键
	 */
	protected String id;

	/**
	 * Hibernate3.6以后,UUIDHexGenerator(uuid)已不推荐使用，改用UUIDGenerator(org.hibernate.id.UUIDGenerator)
	 */
	@Id
	@Column(updatable = false, length = 36)
	@GeneratedValue(generator = "system-uuid")
	@GenericGenerator(name = "system-uuid", strategy = "org.hibernate.id.UUIDGenerator")
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

}