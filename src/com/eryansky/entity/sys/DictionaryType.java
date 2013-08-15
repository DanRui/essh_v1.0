package com.eryansky.entity.sys;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

import com.eryansky.common.excel.annotation.Excel;
import com.eryansky.common.orm.entity.BaseEntity;
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
@JsonIgnoreProperties(value = { "hibernateLazyInitializer" , "handler","fieldHandler" })
@SuppressWarnings("serial")
public class DictionaryType extends BaseEntity {

	/**
	 * 类型名称
	 */
	@Excel(exportName="类型名称", exportFieldWidth = 30)
	private String name;
	/**
	 * 类型编码
	 */
	@Excel(exportName="类型编码", exportFieldWidth = 20)
	private String code;

	/**
	 * 排序
	 */
	@Excel(exportName="排序", exportFieldWidth = 10)
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
	 * @param orderNo
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