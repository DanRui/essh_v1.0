package com.eryansky.common.model;

import org.apache.commons.lang3.builder.ToStringBuilder;

/**
 * easyui可装载组合框combobox模型.
 * 
 * @author : 尔演&Eryan eryanwcp@gmail.com
 * @date : 2013-1-11 下午10:13:25
 */
public class Combobox {

	/**
	 * 值域
	 */
	private String value;
	/**
	 * 文本域
	 */
	private String text;
	/**
	 * 是否选中
	 */
	private boolean selected;

	public Combobox() {
		super();
	}

	/**
	 * 
	 * @param value
	 *            值域
	 * @param text
	 *            文本域
	 */
	public Combobox(String value, String text) {
		super();
		this.value = value;
		this.text = text;
	}

	/**
	 * 
	 * @param value
	 *            值域
	 * @param text
	 *            文本域
	 * @param selected
	 *            是否选中
	 */
	public Combobox(String value, String text, boolean selected) {
		super();
		this.value = value;
		this.text = text;
		this.selected = selected;
	}

	/**
	 * 值域
	 */
	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

	/**
	 * 文本域
	 */
	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	/**
	 * 是否选中
	 */
	public boolean isSelected() {
		return selected;
	}

	public void setSelected(boolean selected) {
		this.selected = selected;
	}

	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this);
	}
}
