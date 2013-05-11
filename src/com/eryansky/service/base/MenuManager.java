package com.eryansky.service.base;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;

import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.googlecode.ehcache.annotations.Cacheable;
import com.googlecode.ehcache.annotations.TriggersRemove;
import com.googlecode.ehcache.annotations.When;
import com.eryansky.common.exception.DaoException;
import com.eryansky.common.exception.ServiceException;
import com.eryansky.common.exception.SystemException;
import com.eryansky.common.model.TreeNode;
import com.eryansky.common.orm.hibernate.EntityManager;
import com.eryansky.common.orm.hibernate.HibernateDao;
import com.eryansky.common.utils.collections.Collections3;
import com.eryansky.entity.base.Menu;
import com.eryansky.entity.base.Role;
import com.eryansky.entity.base.User;
import com.eryansky.entity.base.state.StatusState;
import com.eryansky.utils.CacheConstants;

/**
 * 菜单Menu管理 Service层实现类.
 * <br>树形菜单使用缓存 当保存、删除操作时清楚缓存
 * @author 尔演&Eryan eryanwcp@gmail.com
 * @date 2012-10-11 下午4:26:46
 */
@Service
public class MenuManager extends EntityManager<Menu, Long> {


	@Autowired
	private UserManager userManager;
	
	private HibernateDao<Menu, Long> menuDao;// 默认的泛型DAO成员变量.
	
	/**
	 * 通过注入的sessionFactory初始化默认的泛型DAO成员变量.
	 */
	@Autowired
	public void setSessionFactory(final SessionFactory sessionFactory) {
		menuDao = new HibernateDao<Menu, Long>(sessionFactory, Menu.class);
	}

	@Override
	protected HibernateDao<Menu, Long> getEntityDao() {
		return menuDao;
	}

	/**
	 * 保存或修改.
	 */
	//清除缓存
	@TriggersRemove(cacheName = { CacheConstants.MENU_NAVTREE,
			CacheConstants.MENU_TREE }, when = When.AFTER_METHOD_INVOCATION, removeAll = true)
	public void saveOrUpdate(Menu entity) throws DaoException, SystemException,
			ServiceException {
		Assert.notNull(entity, "参数[entity]为空!");
		menuDao.saveOrUpdate(entity);
	}

	/**
	 * 自定义删除方法.
	 */
	//清除缓存
	@TriggersRemove(cacheName = { CacheConstants.MENU_NAVTREE,
			CacheConstants.MENU_TREE }, when = When.AFTER_METHOD_INVOCATION, removeAll = true)
	public void deleteByIds(List<Long> ids) throws DaoException, SystemException,
			ServiceException {
		if(!Collections3.isEmpty(ids)){
			for (Long id:ids) {
				List<Menu> subMenus = getByParentId(id,
						StatusState.normal.getValue());
				if (subMenus.isEmpty() == false) {// 如果存在子菜单 则将所有子菜单一起删除
					for (Menu m : subMenus) {
						menuDao.delete(m);
					}
				}
				// deleteMenuById(id);
				// 不直接通过id删除对象 (因为有可能在删除子菜单的时候就被删除了)
				Menu menu = loadById(id);
				if (menu != null) {
					menuDao.delete(menu);
				}
			}
		}else{
			logger.warn("参数[ids]为空.");
		}
		
	}

	/**
	 * 
	 * 根据name得到Menu.
	 * 
	 * @param name
	 *            菜单名称
	 * @return
	 * @throws DaoException
	 * @throws SystemException
	 * @throws ServiceException
	 */
	public Menu getByName(String name) throws DaoException, SystemException,
			ServiceException {
		if (StringUtils.isBlank(name)) {
			return null;
		}
		name = StringUtils.strip(name);// 去除两边空格
		return menuDao.findUniqueBy("name", name);
	}

	/**
	 * 
	 * 根据父ID得到 Menu. <br>
	 * 默认按 orderNo asc,id asc排序.
	 * 
	 * @param parentId
	 *            父节点ID(当该参数为null的时候查询顶级菜单列表)
	 * @param status 
	 *            数据状态 @see com.eryansky.entity.base.state.StatusState
	 *            <br>status传null则使用默认值 默认值:StatusState.normal.getValue()
	 * @return
	 * @throws DaoException
	 * @throws SystemException
	 * @throws ServiceException
	 */
	@SuppressWarnings("unchecked")
	public List<Menu> getByParentId(Long parentId, Integer status)
			throws DaoException, SystemException, ServiceException {
		//默认值 正常
		if(status == null){
			status = StatusState.normal.getValue();
		}
		StringBuilder sb = new StringBuilder();
		Object[] objs;
		sb.append("from Menu m where m.status = ? and m.parentMenu.id ");
		if (parentId == null) {
			sb.append(" is null ");
			objs = new Object[] { status };
		} else {
			sb.append(" = ? ");
			objs = new Object[] { status, parentId };
		}
		sb.append(" order by m.orderNo asc,m.id asc");

		List<Menu> list = menuDao.createQuery(sb.toString(), objs).list();
		return list;
	}

	/**
	 * 获取所有导航菜单（无权限限制）.
	 * @return
	 * @throws DaoException
	 * @throws SystemException
	 * @throws ServiceException
	 */
	public List<TreeNode> getNavTree() throws DaoException, SystemException,
			ServiceException {
		List<TreeNode> treeNodes = Lists.newArrayList();
		// 顶级菜单
		List<Menu> parentList = getByParentId(null,
				StatusState.normal.getValue());
		for (int i = 0; i < parentList.size(); i++) {
			Menu parenMenu = parentList.get(i);
			TreeNode treeNode1 = new TreeNode(parenMenu.getId() + "",
					parenMenu.getName(), parenMenu.getIco());
			treeNodes.add(treeNode1);

			// 第二级
			List<Menu> subList = getByParentId(parenMenu.getId(),
					StatusState.normal.getValue());
			for (int j = 0; j < subList.size(); j++) {
				Menu subMenu = subList.get(j);
				TreeNode treeNode2 = new TreeNode(subMenu.getId() + "",
						subMenu.getName(), subMenu.getIco());
				// 自定义属性 url
				Map<String, Object> attributes = Maps.newHashMap();
				attributes.put("url", subMenu.getUrl());
				treeNode2.setAttributes(attributes);
				// 将节点赋值到顶级节点 作为父级的子节点
				treeNode1.addChild(treeNode2);
			}
		}
		return treeNodes;

	}

	/**
	 * 根据用户ID得到导航栏菜单（权限控制）.
	 * @param userId 用户ID
	 * @return
	 * @throws DaoException
	 * @throws SystemException
	 * @throws ServiceException
	 */
	//使用缓存
	@Cacheable(cacheName = CacheConstants.MENU_NAVTREE)
	public List<TreeNode> getNavTree(Long userId) throws DaoException,
			SystemException, ServiceException {
		// Assert.notNull(userId, "参数[userId]为空!");
		logger.debug("缓存:{}", CacheConstants.MENU_NAVTREE);
		List<TreeNode> treeNodes = Lists.newArrayList();
		List<Menu> parentList = new ArrayList<Menu>();// 顶级菜单
		List<Menu> subList = new ArrayList<Menu>();// 子级菜单集合
		User user = userManager.loadById(userId);
		User superUser = userManager.getSuperUser();
		if (user != null && superUser != null
				&& user.getId() == superUser.getId()) {// 超级用户
			return this.getNavTree();
		} else if (user != null) {
			List<Role> roles = user.getRoles();
			for (Role r : roles) {
				List<Menu> menus = r.getMenus();
				for (Menu m : menus) {
					if (m.getParentMenu() == null) {
						// 去除顶级重复菜单
						if (!parentList.contains(m)) {
							//过滤禁用的菜单
							if(m.getStatus() == StatusState.normal.getValue()){
								parentList.add(m);
							}
						}
					} else {
						//过滤禁用的菜单
						if(m.getStatus() == StatusState.normal.getValue()){
							subList.add(m);
						}
					}
				}
			}

			for (int i = 0; i < parentList.size(); i++) {
				Menu parenMenu = parentList.get(i);
				TreeNode treeNode1 = new TreeNode(parenMenu.getId() + "",
						parenMenu.getName(), parenMenu.getIco());
				treeNodes.add(treeNode1);

				List<Menu> subList2 = new ArrayList<Menu>();
				for (Menu mm : subList) {
					if (mm.getParentMenu().getId() == parenMenu.getId()) {
						// 去除二级重复菜单
						if (!subList2.contains(mm)) {
							subList2.add(mm);
						}
					}
				}
				for (int j = 0; j < subList2.size(); j++) {
					Menu subMenu = subList2.get(j);
					TreeNode treeNode2 = new TreeNode(subMenu.getId() + "",
							subMenu.getName(), subMenu.getIco());
					// 自定义属性 url
					Map<String, Object> attributes = Maps.newHashMap();
					attributes.put("url", subMenu.getUrl());
					treeNode2.setAttributes(attributes);
					// 将节点赋值到顶级节点 作为父级的子节点
					treeNode1.addChild(treeNode2);
				}
			}
		} else {
			throw new SystemException("非法用户.");
		}
		return treeNodes;
	}

	/**
	 * 返回所有Menu树列表(仅限两级).
	 * @return
	 * @throws DaoException
	 * @throws SystemException
	 * @throws ServiceException
	 */
	//缓存数据
	@Cacheable(cacheName = CacheConstants.MENU_TREE)
	public List<TreeNode> getTree() throws DaoException, SystemException,
			ServiceException {
		logger.debug("缓存:{}", CacheConstants.MENU_TREE);
		List<TreeNode> treeNodes = Lists.newArrayList();
		// 顶级菜单
		List<Menu> parentList = getByParentId(null,
				StatusState.normal.getValue());
		for (int i = 0; i < parentList.size(); i++) {
			Menu parenMenu = parentList.get(i);
			TreeNode treeNode1 = new TreeNode(parenMenu.getId() + "",
					parenMenu.getName(), parenMenu.getIco());
			treeNodes.add(treeNode1);

			// 第二级
			List<Menu> subList = getByParentId(parenMenu.getId(),
					StatusState.normal.getValue());
			for (int j = 0; j < subList.size(); j++) {
				Menu subMenu = subList.get(j);
				TreeNode treeNode2 = new TreeNode(subMenu.getId() + "",
						subMenu.getName(), subMenu.getIco());
				// 自定义属性 url
				Map<String, Object> attributes = Maps.newHashMap();
				attributes.put("url", subMenu.getUrl());
				treeNode2.setAttributes(attributes);
				// 将节点赋值到顶级节点 作为父级的子节点
				treeNode1.addChild(treeNode2);
			}
		}
		return treeNodes;
	}

	/**
	 * 得到排序字段的最大值.
	 * 
	 * @return 返回排序字段的最大值
	 */
	public Integer getMaxSort() throws DaoException, SystemException,
			ServiceException {
		Iterator<?> iterator = menuDao.createQuery(
				"select max(m.orderNo)from Menu m ").iterate();
		Integer max = 0;
		while (iterator.hasNext()) {
			// Object[] row = (Object[]) iterator.next();
			max = (Integer) iterator.next();
			if (max == null) {
				max = 0;
			}
		}
		return max;
	}
}
