package com.eryansky.entity.sys;

import java.io.Serializable;
import java.sql.Clob;

import javax.persistence.Entity;
import javax.persistence.Lob;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.apache.commons.lang3.builder.ToStringBuilder;
import com.eryansky.common.model.BaseEntity;
import com.eryansky.common.utils.io.ClobUtil;
import com.eryansky.common.utils.jackson.ClobSerializer;
import com.eryansky.common.utils.mapper.JsonMapper;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;

@Entity
@Table(name = "T_SYS_BUG")
// jackson标记不生成json对象的属性
@JsonIgnoreProperties(value = { "hibernateLazyInitializer","tcontent"})
@SuppressWarnings("serial")
public class Bug extends BaseEntity implements Serializable{

	/**
	 * bug标题.
	 */
	private String title;
	/**
	 * bug描述.
	 */
	private Clob content;

	public Bug() {
		super();
	}

	public Bug(String title, Clob content) {
		super();
		this.title = title;
		this.content = content;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	/**
	 * bug内容.
	 */
	@Lob
	//自定义Clob
	@JsonSerialize(using = ClobSerializer.class)
	public Clob getContent() {
		return content;
	}

	public void setContent(Clob content) {
		this.content = content;
	}
	
	@Transient
	public String getTContent() {
		return ClobUtil.getString(content);
	}
	
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this);
	}

}
