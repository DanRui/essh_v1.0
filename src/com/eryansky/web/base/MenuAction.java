package com.eryansky.web.base;

import java.util.List;

import org.apache.commons.collections.ListUtils;
import org.springframework.beans.factory.annotation.Autowired;

import com.google.common.collect.Lists;
import com.eryansky.common.model.Result;
import com.eryansky.common.model.TreeNode;
import com.eryansky.common.orm.hibernate.EntityManager;
import com.eryansky.common.utils.StringUtils;
import com.eryansky.common.utils.SysConstants;
import com.eryansky.common.web.struts2.StrutsAction;
import com.eryansky.common.web.struts2.utils.Struts2Utils;
import com.eryansky.entity.base.Menu;
import com.eryansky.entity.base.User;
import com.eryansky.entity.base.state.StatusState;
import com.eryansky.service.base.MenuManager;
import com.eryansky.utils.SelectType;

/**
 * 菜单权限Menu管理 Action层.
 * 
 * @author 尔演&Eryan eryanwcp@gmail.com
 * @date 2012-10-11 下午4:36:24
 */
@SuppressWarnings("serial")
public class MenuAction extends StrutsAction<Menu> {

	@Autowired
	private MenuManager menuManager;

	@Override
	public EntityManager<Menu, Long> getEntityManager() {
		return menuManager;
	}
	
	/**
	 * 保存.
	 */
	public String save() throws Exception {
		Result result = null;
		try {
			// 名称重复校验
			Menu menu = menuManager.getByName(model.getName());
			if (menu != null && !menu.getId().equals(model.getId())) {
				result = new Result(Result.WARN, "名称为[" + model.getName()
						+ "]已存在,请修正!", "name");
				logger.debug(result.toString());
				Struts2Utils.renderText(result);
				return null;
			}

			// 设置上级节点
			if (model.getParentId() != null) {
				model.setParentMenu(menuManager.loadById(model.getParentId()));
			}
			if (model.getId() != null) {
				if (model.getId().equals(model.getParentId())) {
					result = new Result(Result.ERROR, "[上级菜单]不能与[菜单名称]相同.",
							null);
					logger.debug(result.toString());
					Struts2Utils.renderText(result);
					return null;
				}
			}
			menuManager.merge(model);
			result = Result.successResult();
			logger.debug(result.toString());
			Struts2Utils.renderText(result);
		} catch (Exception e) {
			throw e;
		}
		return null;
	}

	/**
	 * 菜单树.
	 */
	public void tree() throws Exception {
		List<TreeNode> treeNodes = Lists.newArrayList();
		try {
			treeNodes = menuManager.getTree();
			Struts2Utils.renderJson(treeNodes);
		} catch (Exception e) {
			throw e;
		}
	}

	/**
	 * 导航菜单.
	 */
	public void navTree() throws Exception {
		List<TreeNode> treeNodes = Lists.newArrayList();
		try {
			User user = (User) Struts2Utils
					.getSessionAttribute(SysConstants.SESSION_USER);
			if (user != null) {
				treeNodes = menuManager.getNavTree(user.getId());
			}
			Struts2Utils.renderJson(treeNodes);
		} catch (Exception e) {
			throw e;
		}
	}

	/**
	 * 父级菜单下拉列表.
	 */
	@SuppressWarnings("unchecked")
	public void parentMenu() throws Exception {
		List<TreeNode> treeNodes = Lists.newArrayList();
		TreeNode node;
		try {
			List<TreeNode> titleList = Lists.newArrayList();
			// 添加 "---全部---"、"---请选择---"
			if (!StringUtils.isBlank(selectType)) {
				SelectType s = SelectType.getSelectTypeValue(selectType);
				if (s != null) {
					TreeNode selectTreeNode = new TreeNode("",
							s.getDescription());
					titleList.add(selectTreeNode);
				}
			}

			List<Menu> list = menuManager.getByParentId(null,
					StatusState.normal.getValue());
			for (Menu m : list) {
				node = new TreeNode(m.getId() + "", m.getName(), m.getIco());
				treeNodes.add(node);
			}
			List<TreeNode> unionList = ListUtils.union(titleList, treeNodes);
			Struts2Utils.renderJson(unionList);
		} catch (Exception e) {
			throw e;
		}
	}

	/**
	 * 排序最大值.
	 */
	public void maxSort() throws Exception {
		Result result;
		try {
			Integer maxSort = menuManager.getMaxSort();
			result = new Result(Result.SUCCESS, null, maxSort);
			logger.debug(result.toString());
			Struts2Utils.renderJson(result);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	
}
