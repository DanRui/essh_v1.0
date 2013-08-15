package com.eryansky.utils;

/**
 * 缓存静态变量.
 * @author 尔演&Eryan eryanwcp@gmail.com
 * @date 2013-3-19 下午6:45:50 
 *
 */
public class CacheConstants {
	
	//hibernate cach
	/**
	 * basecom.eryansky.entity.sys
	 */
	public static final String HIBERNATE_CACHE_BASE = "com.eryansky.entity.base";
	
	/**
	 * sys
	 */
	public static final String HIBERNATE_CACHE_SYS = "com.eryansky.entity.sys";
	
	//Spring Ehcache Annoction
	/**
	 * 导航菜单(根据用户权限缓存).
	 */
	public static final String MENU_NAVTREE = "menu_navTree_cache";
	/**
	 * 导航tree树(无).
	 */
	public static final String MENU_TREE = "menu_tree_cache";
    /**
     * 需要拦截的所有url规则.
     */
    public static final String MENU_ALLINTERCEPTORURLS = "menu_allInterceptorUrls_cache";
	
	/**
	 * 角色(无).
	 */
	public static final String ROLE_ALL = "role_all_cache";
	
	
	/**
	 * 数据字典类型下的数据(根据数据字典类型缓存).
	 */
	public static final String DICTIONARYS_BY_TYPE = "dictionarys_byType_cache";
	/**
	 * 数据字典类型(无).
	 */
	public static final String DICTIONARYTYPE_ALL = "dictionaryType_all_cache";

	
}
