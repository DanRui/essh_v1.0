package com.eryansky.web.base;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;

import com.eryansky.common.model.Combobox;
import com.eryansky.common.model.Result;
import com.eryansky.common.orm.hibernate.EntityManager;
import com.eryansky.common.web.struts2.StrutsAction;
import com.eryansky.common.web.struts2.utils.Struts2Utils;
import com.eryansky.entity.base.Menu;
import com.eryansky.entity.base.Role;
import com.eryansky.service.base.MenuManager;
import com.eryansky.service.base.RoleManager;
import com.eryansky.utils.SelectType;
import com.google.common.collect.Lists;

/**
 * 角色Role管理 Action层.
 * 
 * @author 尔演&Eryan eryanwcp@gmail.com
 * @date 2012-10-11 下午4:36:24
 */
@SuppressWarnings("serial")
public class RoleAction extends StrutsAction<Role> {

	@Autowired
	private RoleManager roleManager;
	@Autowired
	private MenuManager menuManager;
	//角色管理菜单id集合
	private List<Long> menuIds = Lists.newArrayList();

	@Override
	public EntityManager<Role, Long> getEntityManager() {
		return roleManager;
	}
	
    /**
     * 删除.
     */
	@Override
	public String delete() throws Exception {
		Result result;
		try {
			roleManager.deleteByIds(ids);
			result = Result.successResult();
			logger.debug(result.toString());
			Struts2Utils.renderJson(result);
		} catch (Exception e) {
			throw e;
		}
		return null;
	}

	/**
     * 保存.
     */
	@Override
	public String save() throws Exception {
		Result result;
		try {
			// 名称重复校验
			Role role = roleManager.findUniqueBy("name", model.getName());
            if (role != null && !role.getId().equals(model.getId())) {
            	result = new Result(Result.WARN,"名称为["+model.getName()+"]已存在,请修正!", "name");
                logger.debug(result.toString());
                Struts2Utils.renderText(result);
                return null;
            }
            
            //设置用户角色信息
			List<Menu> menuList = Lists.newArrayList();
			for (Long menuId : menuIds) {
				Menu menu = menuManager.loadById(menuId);
				menuList.add(menu);
			}
			model.setMenus(menuList);
			
			roleManager.saveEntity(model);
            result = Result.successResult();
            logger.debug(result.toString());
			Struts2Utils.renderText(result);
		} catch (Exception e) {
			throw e;
		}
		return null;
	}
	/**
	 * 角色下拉框列表.
	 */
	public void combobox() throws Exception {
		try {
			List<Role> list = roleManager.getAll();
            List<Combobox> cList = Lists.newArrayList();
            
            //为combobox添加  "---全部---"、"---请选择---"
            if(!StringUtils.isBlank(selectType)){
            	SelectType s = SelectType.getSelectTypeValue(selectType);
            	if(s!=null){
            		Combobox selectCombobox = new Combobox("", s.getDescription());
            		cList.add(selectCombobox);
            	}
            }
            for(Role r:list){
                Combobox combobox = new Combobox(r.getId()+"", r.getName());
                cList.add(combobox);
            }
            Struts2Utils.renderJson(cList);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	public void setMenuIds(List<Long> menuIds) {
		this.menuIds = menuIds;
	}


}
