package com.eryansky.entity.sys;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

import com.eryansky.common.model.BaseEntity;
import com.eryansky.utils.CacheConstants;

/**
 * 系统字典类型Entity.
 * 
 * @author : 尔演&Eryan eryanwcp@gmail.com
 * @date : 2013-1-23 下午9:08:36
 */

@Entity
@Table(name = "T_SYS_DICTIONARYTYPE")
@Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE,region = CacheConstants.HIBERNATE_CACHE_SYS)
@SuppressWarnings("serial")
public class DictionaryType extends BaseEntity implements Serializable {

	/**
	 * 类型名称
	 */
	private String name;
	/**
	 * 类型编码
	 */
	private String code;

	/**
	 * 排序
	 */
	private Integer orderNo;

	public DictionaryType() {
		super();
	}

	/**
	 * 系统数据字典类型构造函数.
	 * 
	 * @param name
	 *            类型名称
	 * @param code
	 *            类型编码
	 * @param sort
	 *            排序
	 */
	public DictionaryType(String name, String code, Integer orderNo) {
		super();
		this.name = name;
		this.code = code;
		this.orderNo = orderNo;
	}

	@Column(length = 100, unique = true)
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(length = 12, unique = true)
	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	@Column(name = "ORDER_NO")
	public Integer getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(Integer orderNo) {
		this.orderNo = orderNo;
	}

	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this);
	}
}