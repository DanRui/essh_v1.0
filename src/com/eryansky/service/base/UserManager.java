package com.eryansky.service.base;

import java.util.ArrayList;
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
import com.eryansky.common.utils.SysConstants;
import com.eryansky.common.utils.collections.Collections3;
import com.eryansky.common.web.struts2.utils.Struts2Utils;
import com.eryansky.entity.base.User;

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
	 * 自定义删除方法.
	 */
	public void deleteByIds(List<Long> ids) throws DaoException,SystemException,ServiceException {
		if(!Collections3.isEmpty(ids)){
			for(Long id :ids){
				User superUser = this.getSuperUser();
				if (id.equals(superUser.getId())) {
					throw new SystemException("不允许删除超级用户!");
				}
				User user = userDao.get(id);
				if(user != null){
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
		return userDao.load(1l);//超级用户ID为1
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



}
