package com.eryansky.web.base;

import java.util.List;

import com.eryansky.common.model.Combobox;
import com.eryansky.entity.base.Resource;
import com.eryansky.entity.base.state.ResourceState;
import org.apache.commons.collections.ListUtils;
import org.springframework.beans.factory.annotation.Autowired;

import com.google.common.collect.Lists;
import com.eryansky.common.exception.ActionException;
import com.eryansky.common.model.Result;
import com.eryansky.common.model.TreeNode;
import com.eryansky.common.orm.hibernate.EntityManager;
import com.eryansky.common.utils.StringUtils;
import com.eryansky.common.web.struts2.StrutsAction;
import com.eryansky.common.web.struts2.utils.Struts2Utils;
import com.eryansky.entity.base.state.StatusState;
import com.eryansky.service.base.ResourceManager;
import com.eryansky.utils.SelectType;

/**
 * 资源权限Resource管理 Action层.
 * 
 * @author 尔演&Eryan eryanwcp@gmail.com
 * @date 2012-10-11 下午4:36:24
 */
@SuppressWarnings("serial")
public class ResourceAction extends StrutsAction<Resource> {

	@Autowired
	private ResourceManager resourceManager;
	/**
	 * 父级资源ID
	 */
	private Long parentId;

	@Override
	public EntityManager<Resource, Long> getEntityManager() {
		return resourceManager;
	}
	
	/**
	 * 保存.
	 */
	public String save() throws Exception {
		Result result = null;
		try {
			// 名称重复校验
			Resource resource = resourceManager.getByName(model.getName());
			if (resource != null && !resource.getId().equals(model.getId())) {
				result = new Result(Result.WARN, "名称为[" + model.getName()
						+ "]已存在,请修正!", "name");
				logger.debug(result.toString());
				Struts2Utils.renderText(result);
				return null;
			}

			// 设置上级节点
			if (parentId != null) {
				Resource parentResource = resourceManager.loadById(parentId);
				if(parentResource == null){
					logger.error("父级资源[{}]已被删除.",parentId);
					throw new ActionException("父级资源已被删除.");
				}
				model.setParentResource(parentResource);
			}else{
				model.setParentResource(null);
			}
			
			if (model.getId() != null) {
				if (model.getId().equals(parentId)) {
					result = new Result(Result.ERROR, "[上级资源]不能与[资源名称]相同.",
							null);
					logger.debug(result.toString());
					Struts2Utils.renderText(result);
					return null;
				}
			}
			resourceManager.saveEntity(model);
			result = Result.successResult();
			logger.debug(result.toString());
			Struts2Utils.renderText(result);
		} catch (Exception e) {
			throw e;
		}
		return null;
	}

	/**
	 * 资源树.
	 */
	public void tree() throws Exception {
		List<TreeNode> treeNodes = Lists.newArrayList();
		try {
			treeNodes = resourceManager.getTree();
			Struts2Utils.renderJson(treeNodes);
		} catch (Exception e) {
			throw e;
		}
	}

    /**
     * 资源类型下拉列表.
     */
    public void resourceTypeCombobox() throws Exception {
        List<Combobox> cList = Lists.newArrayList();
        try {

            //为combobox添加  "---全部---"、"---请选择---"
            if(!StringUtils.isBlank(selectType)){
                SelectType s = SelectType.getSelectTypeValue(selectType);
                if(s!=null){
                    Combobox selectCombobox = new Combobox("", s.getDescription());
                    cList.add(selectCombobox);
                }
            }

            ResourceState[] rss = ResourceState.values();
            for(int i=0;i<rss.length;i++){
                Combobox combobox = new Combobox();
                combobox.setValue(rss[i].getValue().toString());
                combobox.setText(rss[i].getDescription());
                cList.add(combobox);
            }
            Struts2Utils.renderJson(cList);
        } catch (Exception e) {
            throw e;
        }
    }

	/**
	 * 父级资源下拉列表.
	 */
	@SuppressWarnings("unchecked")
	public void parentResource() throws Exception {
		List<TreeNode> treeNodes = Lists.newArrayList();
		TreeNode node;
		try {
			List<TreeNode> titleList = Lists.newArrayList();
			List<Resource> list = resourceManager.getByParentId(null,
					StatusState.normal.getValue(),null);
			for (Resource m : list) {
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
			Integer maxSort = resourceManager.getMaxSort();
			result = new Result(Result.SUCCESS, null, maxSort);
			logger.debug(result.toString());
			Struts2Utils.renderJson(result);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	public void setParentId(Long parentId) {
		this.parentId = parentId;
	}
	
	
}
