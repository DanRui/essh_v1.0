package com.eryansky.service.base;

import java.util.ArrayList;
import java.util.List;

import com.eryansky.utils.CacheConstants;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;

import com.eryansky.common.exception.DaoException;
import com.eryansky.common.exception.ServiceException;
import com.eryansky.common.exception.SystemException;
import com.eryansky.common.orm.hibernate.EntityManager;
import com.eryansky.common.orm.hibernate.HibernateDao;
import com.eryansky.common.utils.SysConstants;
import com.eryansky.common.utils.collections.Collections3;
import com.eryansky.common.web.struts2.utils.Struts2Utils;
import com.eryansky.entity.base.User;
import com.eryansky.entity.base.state.StatusState;

/**
 * 用户管理User Service层实现类.
 * @author 尔演&Eryan eryanwcp@gmail.com
 * @date 2013-3-20 上午11:22:13 
 *
 */
@Service
public class UserManager extends EntityManager<User, Long> {
	
	private HibernateDao<User, Long> userDao;
	
	@Autowired
	public void setSessionFactory(SessionFactory sessionFactory) {
		userDao = new HibernateDao<User, Long>(sessionFactory, User.class);
	}
	
	@Override
	protected HibernateDao<User, Long> getEntityDao() {
		return userDao;
	}

    /**
     * 新增或修改角色.
     * <br>修改角色的时候 会给角色重新授权菜单 更新导航菜单缓存.
     */
    @CacheEvict(value = {  CacheConstants.ROLE_ALL_CACHE,
            CacheConstants.RESOURCE_USER_AUTHORITY_URLS_CACHE,
            CacheConstants.RESOURCE_USER_MENU_TREE_CACHE,
            CacheConstants.RESOURCE_USER_RESOURCE_TREE_CACHE},allEntries = true)
    public void saveOrUpdate(User entity) throws DaoException,SystemException,ServiceException {
        logger.debug("清空缓存:{}",CacheConstants.RESOURCE_USER_AUTHORITY_URLS_CACHE
                +","+CacheConstants.RESOURCE_USER_MENU_TREE_CACHE
                +","+CacheConstants.RESOURCE_USER_RESOURCE_TREE_CACHE);
        Assert.notNull(entity, "参数[entity]为空!");
        userDao.saveOrUpdate(entity);
    }

    /**
     * 新增或修改角色.
     * <br>修改角色的时候 会给角色重新授权菜单 更新导航菜单缓存.
     */
    @CacheEvict(value = {  CacheConstants.ROLE_ALL_CACHE,
            CacheConstants.RESOURCE_USER_AUTHORITY_URLS_CACHE,
            CacheConstants.RESOURCE_USER_MENU_TREE_CACHE,
            CacheConstants.RESOURCE_USER_RESOURCE_TREE_CACHE},allEntries = true)
    public void merge(User entity) throws DaoException,SystemException,ServiceException {
        logger.debug("清空缓存:{}",CacheConstants.RESOURCE_USER_AUTHORITY_URLS_CACHE
                +","+CacheConstants.RESOURCE_USER_MENU_TREE_CACHE
                +","+CacheConstants.RESOURCE_USER_RESOURCE_TREE_CACHE);
        Assert.notNull(entity, "参数[entity]为空!");
        userDao.merge(entity);
    }

	/**
	 * 自定义删除方法.
	 */
    @CacheEvict(value = {
            CacheConstants.RESOURCE_USER_AUTHORITY_URLS_CACHE,
            CacheConstants.RESOURCE_USER_MENU_TREE_CACHE,
            CacheConstants.RESOURCE_USER_RESOURCE_TREE_CACHE},allEntries = true)
	public void deleteByIds(List<Long> ids) throws DaoException,SystemException,ServiceException {
		if(!Collections3.isEmpty(ids)){
            logger.debug("清空缓存:{}",CacheConstants.RESOURCE_USER_AUTHORITY_URLS_CACHE
                    +","+CacheConstants.RESOURCE_USER_MENU_TREE_CACHE
                    +","+CacheConstants.RESOURCE_USER_RESOURCE_TREE_CACHE);
			for(Long id :ids){
				User superUser = this.getSuperUser();
				if (id.equals(superUser.getId())) {
					throw new SystemException("不允许删除超级用户!");
				}
				User user = userDao.get(id);
				if(user != null){
					//设置角色为空
					user.setRoles(null);
					//逻辑删除
					//手工方式(此处不使用 由注解方式实现逻辑删除)
//					user.setStatus(StatusState.delete.getValue());
					//注解方式 由注解设置用户状态
					userDao.delete(user);
				}
			}
		}else{
			logger.warn("参数[ids]为空.");
		}
		
		
	}
	
	/**
	 * 得到当前登录用户.
	 * @return
	 * @throws DaoException
	 * @throws SystemException
	 * @throws ServiceException
	 */
	public User getCurrentUser() throws DaoException,SystemException,ServiceException{
        User user = (User) Struts2Utils.getSessionAttribute(SysConstants.SESSION_USER);
        return user;
    }
	
	/**
	 * 得到超级用户.
	 * 
	 * @return
	 * @throws DaoException
	 * @throws SystemException
	 * @throws ServiceException
	 */
	public User getSuperUser() throws DaoException,SystemException,ServiceException {
        User superUser = userDao.load(1l);//超级用户ID为1
        if(superUser == null){
            throw new SystemException("系统未设置超级用户.");
        }
        return superUser;
	}
	/**
	 * 根据登录名、密码查找用户.
	 * 
	 * @param loginName
	 *            登录名
	 * @param password
	 *            密码
	 * @return
	 * @throws DaoException
	 * @throws SystemException
	 * @throws ServiceException
	 */
	@SuppressWarnings("unchecked")
	public User getUserByLP(String loginName, String password)
			throws DaoException,SystemException,ServiceException {
		Assert.notNull(loginName, "参数[loginName]为空!");
		Assert.notNull(password, "参数[password]为空!");
		List<User> list = userDao.createQuery(
					"from User u where u.loginName = ? and u.password = ?",
					new Object[] { loginName, password }).list();
		return list.isEmpty() ? null:list.get(0);
	}

	
	/**
	 * 根据父ID得到角色.
	 * 
	 * @param roleids
	 * @return
	 * @throws DaoException
	 * @throws SystemException
	 * @throws ServiceException
	 */
	@SuppressWarnings("unchecked")
	public List<User> getRoleIds(String roleids) throws DaoException,SystemException,ServiceException {
		StringBuffer sb = new StringBuffer();
		sb.append("from User u where u.roleids ");
		List<User> list = new ArrayList<User>();
		if (roleids == null) {
			sb.append(" is null order by u.id asc");
			list = userDao.createQuery(sb.toString()).list();
		} else {
			sb.append(" = ? order by u.id asc");
			list = userDao.createQuery(sb.toString(),
					new Object[] { roleids }).list();
		}
		return list;
	}

	/**
	 * 根据登录名查找.
	 * <br>注：排除已删除的对象
	 * @param loginName 登录名
	 * @return
	 * @throws DaoException
	 * @throws SystemException
	 * @throws ServiceException
	 */
	@SuppressWarnings("unchecked")
	public User getUserByLoginName(String loginName)
			throws DaoException,SystemException,ServiceException {
		Assert.notNull(loginName, "参数[loginName]为空!");
		Assert.notNull(loginName, "参数[status]为空!");
		List<User> list = userDao.createQuery(
					"from User u where u.loginName = ? and u.status <> ?",
					new Object[] { loginName, StatusState.delete.getValue() }).list();
		return list.isEmpty() ? null:list.get(0);
	}

}
