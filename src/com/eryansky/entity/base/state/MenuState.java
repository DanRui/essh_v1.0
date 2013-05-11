package com.eryansky.entity.base.state;

/**
 * 
 * 菜单类型标识 枚举类型.
 * <br>菜单(0) 按钮(1)
 * @author 尔演&Eryan eryanwcp@gmail.com
 * @date 2013-01-28 上午10:48:23
 * 
 */
public enum MenuState {
	/** 菜单(0) */
	menu(0, "菜单"),
	/** 按钮(1) */
	button(1, "按钮");

	/**
	 * 值 Integer型
	 */
	private final Integer value;
	/**
	 * 描述 String型
	 */
	private final String description;

	MenuState(Integer value, String description) {
		this.value = value;
		this.description = description;
	}

	/**
	 * 获取值
	 * @return value
	 */
	public Integer getValue() {
		return value;
	}

	/**
     * 获取描述信息
     * @return description
     */
	public String getDescription() {
		return description;
	}

	public static MenuState getMenuState(Integer value) {
		if (null == value)
			return null;
		for (MenuState _enum : MenuState.values()) {
			if (value.equals(_enum.getValue()))
				return _enum;
		}
		return null;
	}
	
	public static MenuState getMenuState(String description) {
		if (null == description)
			return null;
		for (MenuState _enum : MenuState.values()) {
			if (description.equals(_enum.getDescription()))
				return _enum;
		}
		return null;
	}

}