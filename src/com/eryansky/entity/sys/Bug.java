package com.eryansky.entity.sys;

import java.io.Serializable;
import java.sql.Clob;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Lob;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.apache.commons.lang3.builder.ToStringBuilder;

import com.eryansky.common.orm.entity.BaseEntity;
import com.eryansky.common.utils.io.ClobUtil;
import com.eryansky.common.utils.jackson.ClobSerializer;
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
	 * bug类型 使用数据字典
	 */
    private String type;
    /**
     * bug类型名称 @Transient
     */
    private String typeName;
    
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

	@Column(length = 36)
	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	@Transient
	public String getTypeName() {
		return typeName;
	}

	public void setTypeName(String typeName) {
		this.typeName = typeName;
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
	
	/**
	 * 用于view显示
	 * @return
	 */
	@Transient
	public String getTContent() {
		return ClobUtil.getString(content);
	}
	
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this);
	}

}
