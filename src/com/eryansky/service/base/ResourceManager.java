package com.eryansky.service.base;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import com.eryansky.common.utils.StringUtils;
import com.eryansky.entity.base.Resource;
import com.eryansky.entity.base.state.ResourceState;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;

import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.eryansky.common.exception.DaoException;
import com.eryansky.common.exception.ServiceException;
import com.eryansky.common.exception.SystemException;
import com.eryansky.common.model.TreeNode;
import com.eryansky.common.orm.hibernate.EntityManager;
import com.eryansky.common.orm.hibernate.HibernateDao;
import com.eryansky.common.utils.collections.Collections3;
import com.eryansky.entity.base.Role;
import com.eryansky.entity.base.User;
import com.eryansky.entity.base.state.StatusState;
import com.eryansky.utils.CacheConstants;

/**
 * 资源Resource管理 Service层实现类.
 * <br>树形资源使用缓存 当保存、删除操作时清除缓存
 * @author 尔演&Eryan eryanwcp@gmail.com
 * @date 2012-10-11 下午4:26:46
 */
@Service
public class ResourceManager extends EntityManager<Resource, Long> {


	@Autowired
	private UserManager userManager;
	
	private HibernateDao<Resource, Long> resourceDao;// 默认的泛型DAO成员变量.
	
	/**
	 * 通过注入的sessionFactory初始化默认的泛型DAO成员变量.
	 */
	@Autowired
	public void setSessionFactory(final SessionFactory sessionFactory) {
		resourceDao = new HibernateDao<Resource, Long>(sessionFactory, Resource.class);
	}

	@Override
	protected HibernateDao<Resource, Long> getEntityDao() {
		return resourceDao;
	}

	/**
	 * 保存或修改.
	 */
	//清除缓存
	@CacheEvict(value = { CacheConstants.RESOURCE_USER_RESOURCE_TREE_CACHE,
            CacheConstants.RESOURCE_USER_AUTHORITY_URLS_CACHE,
            CacheConstants.RESOURCE_USER_MENU_TREE_CACHE},allEntries = true)
	public void saveOrUpdate(Resource entity) throws DaoException, SystemException,
			ServiceException {
        logger.debug("清空缓存:{}", CacheConstants.RESOURCE_USER_RESOURCE_TREE_CACHE
                +","+CacheConstants.RESOURCE_USER_AUTHORITY_URLS_CACHE
                +","+CacheConstants.RESOURCE_USER_MENU_TREE_CACHE);
		Assert.notNull(entity, "参数[entity]为空!");
		resourceDao.saveOrUpdate(entity);
	}
	
	/**
	 * 保存或修改.
	 */
	//清除缓存
    @CacheEvict(value = { CacheConstants.RESOURCE_USER_RESOURCE_TREE_CACHE,
            CacheConstants.RESOURCE_USER_AUTHORITY_URLS_CACHE,
            CacheConstants.RESOURCE_USER_MENU_TREE_CACHE},allEntries = true)
	public void merge(Resource entity) throws DaoException, SystemException,
			ServiceException {
        logger.debug("清空缓存:{}", CacheConstants.RESOURCE_USER_RESOURCE_TREE_CACHE
                +","+CacheConstants.RESOURCE_USER_AUTHORITY_URLS_CACHE
                +","+CacheConstants.RESOURCE_USER_MENU_TREE_CACHE);
		Assert.notNull(entity, "参数[entity]为空!");
		resourceDao.merge(entity);
	}

    @CacheEvict(value = { CacheConstants.RESOURCE_USER_RESOURCE_TREE_CACHE,
            CacheConstants.RESOURCE_USER_AUTHORITY_URLS_CACHE,
            CacheConstants.RESOURCE_USER_MENU_TREE_CACHE},allEntries = true)
    @Override
    public void saveEntity(Resource entity) throws DaoException, SystemException, ServiceException {
        logger.debug("清空缓存:{}", CacheConstants.RESOURCE_USER_RESOURCE_TREE_CACHE
                +","+CacheConstants.RESOURCE_USER_AUTHORITY_URLS_CACHE
                +","+CacheConstants.RESOURCE_USER_MENU_TREE_CACHE);
        super.saveEntity(entity);
    }

    /**
	 * 自定义删除方法.
	 */
	//清除缓存
    @CacheEvict(value = { CacheConstants.RESOURCE_USER_RESOURCE_TREE_CACHE,
            CacheConstants.RESOURCE_USER_AUTHORITY_URLS_CACHE,
            CacheConstants.RESOURCE_USER_MENU_TREE_CACHE},allEntries = true)
	public void deleteByIds(List<Long> ids) throws DaoException, SystemException,
			ServiceException {
        logger.debug("清空缓存:{}", CacheConstants.RESOURCE_USER_RESOURCE_TREE_CACHE
                +","+CacheConstants.RESOURCE_USER_AUTHORITY_URLS_CACHE
                +","+CacheConstants.RESOURCE_USER_MENU_TREE_CACHE);
		if(!Collections3.isEmpty(ids)){
			for (Long id:ids) {
				List<Resource> subResources = getByParentId(id,
						StatusState.normal.getValue());
				if (subResources.isEmpty() == false) {// 如果存在子资源 则将所有子资源一起删除
					for (Resource m : subResources) {
						resourceDao.delete(m);
					}
				}
				// deleteResourceById(id);
				// 不直接通过id删除对象 (因为有可能在删除子资源的时候就被删除了)
				Resource resource = loadById(id);
				if (resource != null) {
					resourceDao.delete(resource);
				}
			}
		}else{
			logger.warn("参数[ids]为空.");
		}
		
	}

    /**
     * 用户导航菜单(排除非菜单资源).
     * @param userId 用户ID
     * @return
     * @throws DaoException
     * @throws SystemException
     * @throws ServiceException
     */
    @Cacheable(value = { CacheConstants.RESOURCE_USER_MENU_TREE_CACHE},key = "#userId +'getNavMenuTreeByUserId'")
    public List<TreeNode> getNavMenuTreeByUserId(Long userId) throws DaoException,
            SystemException, ServiceException {
        List<TreeNode> menuNodes = this.getResourceTreeByUserId(userId);
        Iterator<TreeNode> iterator = menuNodes.iterator();
        while (iterator.hasNext()){
            TreeNode parentNode = iterator.next();
            if(parentNode.getAttributes().get("type") == ResourceState.menu.getValue()) {
                List<TreeNode> childrenNodes = parentNode.getChildren();
                Iterator<TreeNode> childrenIterator = childrenNodes.iterator();
                while(childrenIterator.hasNext()){
                    TreeNode childrenNode = childrenIterator.next();
                    if(childrenNode.getAttributes().get("type") != ResourceState.menu.getValue()) {
                        childrenIterator.remove();
                    }
                }
            }else{
                iterator.remove();
            }
        }
        logger.debug("缓存:{}", CacheConstants.RESOURCE_USER_MENU_TREE_CACHE +" 参数：userId="+userId);
        return menuNodes;
    }
    /**
     * 根据用户ID得到导航栏资源（权限控制）.
     * @param userId 用户ID
     * @return
     * @throws DaoException
     * @throws SystemException
     * @throws ServiceException
     */
    //使用缓存
    @Cacheable(value = { CacheConstants.RESOURCE_USER_RESOURCE_TREE_CACHE},key = "#userId +'getResourceTreeByUserId'")
    public List<TreeNode> getResourceTreeByUserId(Long userId) throws DaoException,
            SystemException, ServiceException {
        // Assert.notNull(userId, "参数[userId]为空!");
        List<TreeNode> treeNodes = Lists.newArrayList();
        List<Resource> parentList = new ArrayList<Resource>();// 顶级资源
        List<Resource> subList = new ArrayList<Resource>();// 子级资源集合
        User user = userManager.loadById(userId);
        User superUser = userManager.getSuperUser();
        if (user != null && superUser != null
                && user.getId() == superUser.getId()) {// 超级用户
            logger.debug("缓存:{}", CacheConstants.RESOURCE_USER_RESOURCE_TREE_CACHE +" 参数：userId="+userId);
            return this.getResourceTree();
        } else if (user != null) {
            List<Role> roles = user.getRoles();
            for (Role r : roles) {
                List<Resource> resources = r.getResources();
                for (Resource m : resources) {
                    if (m.getParentResource() == null) {
                        // 去除顶级重复资源
                        if (!parentList.contains(m)) {
                            //过滤禁用的资源
                            if(m.getStatus() == StatusState.normal.getValue()){
                                parentList.add(m);
                            }
                        }
                    } else {
                        //过滤禁用的资源
                        if(m.getStatus() == StatusState.normal.getValue()){
                            subList.add(m);
                        }
                    }
                }
            }

            for (int i = 0; i < parentList.size(); i++) {
                Resource parenResource = parentList.get(i);
                TreeNode treeNode1 = new TreeNode(parenResource.getId() + "",
                        parenResource.getName(), parenResource.getIco());
                // 自定义属性 url
                Map<String, Object> attributes1 = Maps.newHashMap();
                attributes1.put("url", parenResource.getUrl());
                attributes1.put("markUrl", parenResource.getMarkUrl());
                attributes1.put("code", parenResource.getCode());
                attributes1.put("type",parenResource.getType());
                treeNode1.setAttributes(attributes1);
                treeNodes.add(treeNode1);
                List<Resource> subList2 = new ArrayList<Resource>();
                for (Resource mm : subList) {
                    if (mm.getParentResource().getId() == parenResource.getId()) {
                        // 去除二级重复资源
                        if (!subList2.contains(mm)) {
                            subList2.add(mm);
                        }
                    }
                }
                for (int j = 0; j < subList2.size(); j++) {
                    Resource subResource = subList2.get(j);
                    TreeNode treeNode2 = new TreeNode(subResource.getId() + "",
                            subResource.getName(), subResource.getIco());
                    // 自定义属性 url
                    Map<String, Object> attributes = Maps.newHashMap();
                    attributes.put("url", subResource.getUrl());
                    attributes.put("markUrl", subResource.getMarkUrl());
                    attributes.put("code", subResource.getCode());
                    attributes.put("type",subResource.getType());
                    treeNode2.setAttributes(attributes);
                    // 将节点赋值到顶级节点 作为父级的子节点
                    treeNode1.addChild(treeNode2);
                }
            }
        } else {
            throw new SystemException("非法用户.");
        }
        logger.debug("缓存:{}", CacheConstants.RESOURCE_USER_RESOURCE_TREE_CACHE +" 参数：userId="+userId);
        return treeNodes;
    }


    /**
     * 获取所有导航资源（无权限限制）.
     * @return
     * @throws DaoException
     * @throws SystemException
     * @throws ServiceException
     */
    public List<TreeNode> getResourceTree() throws DaoException, SystemException,
            ServiceException {
        List<TreeNode> treeNodes = Lists.newArrayList();
        // 顶级资源
        List<Resource> parentList = getByParentId(null,
                StatusState.normal.getValue());
        for (int i = 0; i < parentList.size(); i++) {
            Resource parenResource = parentList.get(i);
            TreeNode treeNode1 = new TreeNode(parenResource.getId() + "",
                    parenResource.getName(), parenResource.getIco());
            // 自定义属性 url
            Map<String, Object> attributes1 = Maps.newHashMap();
//            attributes1.put("url", parenResource.getUrl());
            attributes1.put("markUrl", parenResource.getMarkUrl());
            attributes1.put("code", parenResource.getCode());
            attributes1.put("type",parenResource.getType());
            treeNode1.setAttributes(attributes1);
            treeNodes.add(treeNode1);

            // 第二级
            List<Resource> subList = getByParentId(parenResource.getId(),
                    StatusState.normal.getValue());
            for (int j = 0; j < subList.size(); j++) {
                Resource subResource = subList.get(j);
                TreeNode treeNode2 = new TreeNode(subResource.getId() + "",
                        subResource.getName(), subResource.getIco());
                // 自定义属性 url
                Map<String, Object> attributes2 = Maps.newHashMap();
                attributes2.put("url", subResource.getUrl());
                attributes2.put("markUrl", subResource.getMarkUrl());
                attributes2.put("code", subResource.getCode());
                attributes2.put("type",subResource.getType());
                treeNode2.setAttributes(attributes2);
                // 将节点赋值到顶级节点 作为父级的子节点
                treeNode1.addChild(treeNode2);
            }
        }
        return treeNodes;

    }



    /**
	 * 
	 * 根据name得到Resource.
	 * 
	 * @param name
	 *            资源名称
	 * @return
	 * @throws DaoException
	 * @throws SystemException
	 * @throws ServiceException
	 */
	public Resource getByName(String name) throws DaoException, SystemException,
			ServiceException {
		if (StringUtils.isBlank(name)) {
			return null;
		}
		name = StringUtils.strip(name);// 去除两边空格
		return resourceDao.findUniqueBy("name", name);
	}


    /**
     *
     * 根据编码得到Resource.
     *
     * @param code
     *            资源编码
     * @return
     * @throws DaoException
     * @throws SystemException
     * @throws ServiceException
     */
    public Resource getByCode(String code) throws DaoException, SystemException,
            ServiceException {
        if (StringUtils.isBlank(code)) {
            return null;
        }
        return resourceDao.findUniqueBy("code", code);
    }

	/**
	 * 
	 * 根据父ID得到 Resource. <br>
	 * 默认按 orderNo asc,id asc排序.
	 * 
	 * @param parentId
	 *            父节点ID(当该参数为null的时候查询顶级资源列表)
	 * @param status 
	 *            数据状态 @see com.eryansky.entity.base.state.StatusState
	 *            <br>status传null则使用默认值 默认值:StatusState.normal.getValue()
	 * @return
	 * @throws DaoException
	 * @throws SystemException
	 * @throws ServiceException
	 */
	@SuppressWarnings("unchecked")
	public List<Resource> getByParentId(Long parentId, Integer status)
			throws DaoException, SystemException, ServiceException {
		//默认值 正常
		if(status == null){
			status = StatusState.normal.getValue();
		}
		StringBuilder sb = new StringBuilder();
		Object[] objs;
		sb.append("from Resource r where r.status = ?  ");
        sb.append(" and r.parentResource.id ");
        if (parentId == null) {
			sb.append(" is null ");
			objs = new Object[] { status };
		} else {
			sb.append(" = ? ");
			objs = new Object[] { status, parentId };
		}
		sb.append(" order by r.orderNo asc,r.id asc");

		List<Resource> list = resourceDao.createQuery(sb.toString(), objs).list();
		return list;
	}



    /**
     * 根据请求地址判断用户是否有权访问该url
     * @param requestUrl 请求URL地址
     * @param userId 用户ID
     * @return
     */
    @Cacheable(value = {CacheConstants.RESOURCE_USER_AUTHORITY_URLS_CACHE},key = "#requestUrl + #userId +'isAuthority'")
    public boolean isAuthority(String requestUrl,Long userId)
            throws DaoException,SystemException,ServiceException{
        //如果是超级管理员 直接允许被授权
        if(userManager.getSuperUser().getId().equals(userId)) {
            return true;
        }
        //检查该URL是否需要拦截
        boolean isInterceptorUrl = this.isInterceptorUrl(requestUrl);
        if (isInterceptorUrl){
            //用户权限
            List<String> userAuthoritys = this.getUserAuthoritysByUserId(userId);
            for(String markUrl :userAuthoritys){
                String[] markUrls = markUrl.split(";");
                for(int i=0;i<markUrls.length;i++){
                    if(StringUtils.isNotBlank(markUrls[i]) && StringUtils.simpleWildcardMatch(markUrls[i],requestUrl)){
                        return true;
                    }
                }
            }
            return false;
        }
        logger.debug("缓存:{}", CacheConstants.RESOURCE_USER_AUTHORITY_URLS_CACHE +"参数：requestUrl="+requestUrl+",userId="+userId);
        return true;
    }


    /**
     * 查找需要拦截的所有url规则
     * @return
     */
    public List<String> getAllInterceptorUrls()
            throws DaoException,SystemException,ServiceException{
        List<String> markUrls = Lists.newArrayList();
        //查找所有资源
//        List<Resource> resources = this.findBy("NEI_status",StatusState.delete.getValue());
        List<Resource> resources = this.getAll();
        for(Resource resource : resources){
            if(StringUtils.isNotBlank(resource.getMarkUrl())){
                markUrls.add(resource.getMarkUrl());
            }
        }
        return markUrls;
    }

    /**
     * 检查某个URL是都需要拦截
     * @param requestUrl 检查的URL地址
     * @return
     */
    public boolean isInterceptorUrl(String requestUrl)
            throws DaoException,SystemException,ServiceException{
        List<String> markUrlList = this.getAllInterceptorUrls();
        for(String markUrl :markUrlList){
            String[] markUrls = markUrl.split(";");
            for(int i=0;i<markUrls.length;i++){
                if(StringUtils.isNotBlank(markUrls[i]) && StringUtils.simpleWildcardMatch(markUrls[i],requestUrl)){
                    return true;
                }
            }
        }
        return false;
    }


    /**
     * 根据用户ID查找用户拥有的URL权限
     * @param userId   用户ID
     * @return    List<String> 用户拥有的markUrl地址
     */
    public List<String> getUserAuthoritysByUserId(Long userId)
            throws DaoException,SystemException,ServiceException{
        List<String> userAuthoritys = Lists.newArrayList();
        List<TreeNode> treeNodes = this.getResourceTreeByUserId(userId);
        for(TreeNode node : treeNodes){
            Object obj = node.getAttributes().get("markUrl");
            if(obj != null){
                String markUrl = (String)obj ;
                if(StringUtils.isNotBlank(markUrl)){
                    userAuthoritys.add(markUrl);
                }
            }
            //二级目录
            List<TreeNode> childrenNodes =  node.getChildren();
            for(TreeNode childrenNode : childrenNodes){
                Object childrenObj = childrenNode.getAttributes().get("markUrl");
                if(childrenObj != null){
                    String markUrl = (String)childrenObj ;
                    if(StringUtils.isNotBlank(markUrl)){
                        userAuthoritys.add(markUrl);
                    }
                }
            }
        }
        return  userAuthoritys;
    }


    /**
	 * 得到排序字段的最大值.
	 * 
	 * @return 返回排序字段的最大值
	 */
	public Integer getMaxSort() throws DaoException, SystemException,
			ServiceException {
		Iterator<?> iterator = resourceDao.createQuery(
				"select max(m.orderNo)from Resource m ").iterate();
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
