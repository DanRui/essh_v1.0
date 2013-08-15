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
	public static final String RESOURCE_NAV_TREE_CACHE = "resource_navTree_cache";
	/**
	 * 导航tree树(无).
	 */
	public static final String RESOURCE_TREE_CACHE = "resource_tree_cache";
    /**
     * 需要拦截的所有url规则.
     */
    public static final String RESOURCE_ALL_INTERCEPTOR_URLS_CACHE = "resource_allInterceptorUrls_cache";
	
	/**
	 * 角色(无).
	 */
	public static final String ROLE_ALL_CACHE = "role_all_cache";
	
	
	/**
	 * 数据字典类型下的数据(根据数据字典类型缓存).
	 */
	public static final String DICTIONARYS_BY_TYPE_CACHE = "dictionarys_byType_cache";
	/**
	 * 数据字典类型(无).
	 */
	public static final String DICTIONARY_TYPE_ALL_CACHE = "dictionaryType_all_cache";

	
}
