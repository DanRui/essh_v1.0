package com.eryansky.entity.sys;

import java.io.Serializable;
import java.sql.Clob;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Lob;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.apache.commons.lang3.builder.ToStringBuilder;

import com.eryansky.common.excel.annotation.Excel;
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
	@Excel(exportName="bug标题", exportFieldWidth = 10)
	private String title;
	/**
	 * bug类型 使用数据字典
	 */
    private String type;
    /**
     * bug类型名称 @Transient
     */
	@Excel(exportName="bug类型", exportFieldWidth = 10)
    private String typeName;
    
	/**
	 * bug描述.
	 */
	private Clob content;
	/**
	 * bug描述. @Transient
	 */
	@Excel(exportName="bug描述", exportFieldWidth = 10)
	private String tContent;

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
		String str = "";
		if(content != null){
			str = ClobUtil.getString(content);
		}else{
			str = tContent;
		}
		return str;
	}
	
	
	public void setTContent(String tContent) {
		this.tContent = tContent;
	}

	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this);
	}

}
