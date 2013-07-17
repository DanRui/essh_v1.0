package com.eryansky.service.base;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;

import com.eryansky.common.exception.DaoException;
import com.eryansky.common.exception.ServiceException;
import com.eryansky.common.exception.SystemException;
import com.eryansky.common.orm.hibernate.EntityManager;
import com.eryansky.common.orm.hibernate.HibernateDao;
import com.eryansky.entity.base.Role;
import com.eryansky.utils.CacheConstants;
import com.googlecode.ehcache.annotations.Cacheable;
import com.googlecode.ehcache.annotations.TriggersRemove;
import com.googlecode.ehcache.annotations.When;

/**
 * 角色Role管理 Service层实现类.
 * 
 * @author 尔演&Eryan eryanwcp@gmail.com
 * @date 2012-10-11 下午4:15:26
 */
@Service
public class RoleManager extends EntityManager<Role, Long> {

	private HibernateDao<Role, Long> roleDao;

	@Autowired
	public void setSessionFactory(SessionFactory sessionFactory) {
		roleDao = new HibernateDao<Role, Long>(sessionFactory,
				Role.class);
	}
	
	@Override
	protected HibernateDao<Role, Long> getEntityDao() {
		return roleDao;
	}
	
	/**
	 * 删除角色.
	 * <br>删除角色的时候 会给角色重新授权菜单 更新导航菜单缓存.
	 */
	@TriggersRemove(cacheName = { CacheConstants.ROLE_ALL}, when = When.AFTER_METHOD_INVOCATION, removeAll = true)
	@Override
	public void deleteByIds(List<Long> ids) throws DaoException,
			SystemException, ServiceException {
		super.deleteByIds(ids);
	}
	/**
	 * 新增或修改角色.
	 * <br>修改角色的时候 会给角色重新授权菜单 更新导航菜单缓存.
	 */
	@TriggersRemove(cacheName = { CacheConstants.ROLE_ALL,CacheConstants.MENU_NAVTREE }, when = When.AFTER_METHOD_INVOCATION, removeAll = true)
	public void saveOrUpdate(Role entity) throws DaoException,SystemException,ServiceException {
		Assert.notNull(entity, "参数[entity]为空!");
		roleDao.saveOrUpdate(entity);
		logger.warn("保存色Role:{}",entity.getId());
	}
	
	/**
	 * 新增或修改角色.
	 * <br>修改角色的时候 会给角色重新授权菜单 更新导航菜单缓存.
	 */
	@TriggersRemove(cacheName = { CacheConstants.ROLE_ALL,CacheConstants.MENU_NAVTREE }, when = When.AFTER_METHOD_INVOCATION, removeAll = true)
	public void merge(Role entity) throws DaoException,SystemException,ServiceException {
		Assert.notNull(entity, "参数[entity]为空!");
		roleDao.merge(entity);
		logger.warn("保存色Role:{}",entity.getId());
	}

    @TriggersRemove(cacheName = { CacheConstants.ROLE_ALL,CacheConstants.MENU_NAVTREE }, when = When.AFTER_METHOD_INVOCATION, removeAll = true)
    @Override
    public void saveEntity(Role entity) throws DaoException, SystemException, ServiceException {
        super.saveEntity(entity);
    }

    @Cacheable(cacheName = CacheConstants.ROLE_ALL)
	public List<Role> getAll() throws DaoException,SystemException,ServiceException {
		logger.debug("缓存:{}",CacheConstants.ROLE_ALL);
		return roleDao.getAll();
	}

}
