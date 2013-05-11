package com.eryansky.web.sys;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;

import com.google.common.collect.Lists;
import com.eryansky.common.model.Combobox;
import com.eryansky.common.model.Result;
import com.eryansky.common.orm.hibernate.EntityManager;
import com.eryansky.common.web.struts2.StrutsAction;
import com.eryansky.common.web.struts2.utils.Struts2Utils;
import com.eryansky.entity.sys.DictionaryType;
import com.eryansky.service.sys.DictionaryTypeManager;
import com.eryansky.utils.SelectType;

/**
 * 数据字典类型DictionaryType管理 Action层.
 * 
 * @author 尔演&Eryan eryanwcp@gmail.com
 * @date 2012-10-11 下午4:36:24
 */
@SuppressWarnings("serial")
public class DictionaryTypeAction
        extends StrutsAction<DictionaryType> {

    @Autowired
    private DictionaryTypeManager dictionaryTypeManager;

    @Override
	public EntityManager<DictionaryType, Long> getEntityManager() {
		return dictionaryTypeManager;
	}

    /**
     * 保存
     */
    public String save() throws Exception {
        Result result = null;
        try {
            // 名称是否重复校验
            DictionaryType dictionaryType = dictionaryTypeManager
                    .getByName(model.getName());
            if (dictionaryType != null
                    && !dictionaryType.getId().equals(model.getId())) {
            	result = new Result(Result.WARN, "名称为["
                        + model.getName() + "]已存在,请修正!", "name");
                Struts2Utils.renderText(result);
                return null;
            }
            
            // 编码是否重复校验
            DictionaryType dictionaryType2 = dictionaryTypeManager
                    .getByCode(model.getCode());
            if (dictionaryType2 != null
                    && !dictionaryType2.getId().equals(model.getId())) {
            	result = new Result(Result.WARN, "编码为["
                        + model.getCode() + "]已存在,请修正!", "code");
                logger.debug(result.toString());
                Struts2Utils.renderText(result);
                return null;
            }
            
            dictionaryTypeManager.saveOrUpdate(model);
            result = Result.successResult();
            logger.debug(result.toString());
            Struts2Utils.renderText(result);
        } catch (Exception e) {
            e.printStackTrace();
            throw e;
        }
        return null;
    }

    
    /**
     * 下拉列表
     */
    public void combobox() throws Exception {
        try {
            List<DictionaryType> list = dictionaryTypeManager.getAll();
            List<Combobox> cList = Lists.newArrayList();
            
            //为combobox添加  "---全部---"、"---请选择---"
            if(!StringUtils.isBlank(selectType)){
            	SelectType s = SelectType.getSelectTypeValue(selectType);
            	if(s!=null){
            		Combobox selectCombobox = new Combobox("", s.getDescription());
            		cList.add(selectCombobox);
            	}
            }
            for(DictionaryType d:list){
                Combobox combobox = new Combobox(d.getCode(), d.getName());
                cList.add(combobox);
            }
            Struts2Utils.renderJson(cList);
        } catch (Exception e) {
            e.printStackTrace();
            throw e;
        }
    }

    /**
     * 排序最大值.
     */
    public void maxSort() throws Exception {
        try {
            Integer maxSort = dictionaryTypeManager.getMaxSort();
            Result result = new Result(Result.SUCCESS, null, maxSort);
            Struts2Utils.renderJson(result);
        } catch (Exception e) {
            e.printStackTrace();
            throw e;
        }
    }

}
