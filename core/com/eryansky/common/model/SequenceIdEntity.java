package com.eryansky.common.model;


import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.MappedSuperclass;
import javax.persistence.SequenceGenerator;

/**
 * 统一定义id的entity基类,Oracle 序列. <br/>
 * 基类统一定义id的属性名称、数据类型、列名映射及生成策略. <br/>
 * 子类可重载getId()函数重定义id的列名映射和生成策略.
 * 
 * @author 尔演&Eryan eryanwcp@gmail.com
 * @date 2013-3-25 下午9:53:22
 * 
 */
// JPA 基类的标识
@MappedSuperclass
public abstract class SequenceIdEntity {

	/**
	 * 主键
	 */
	protected Long id;

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "sequenceGenerator")
	@SequenceGenerator(name = "sequenceGenerator", sequenceName = "ESSH_COMMON_SEQUENCE")
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

}