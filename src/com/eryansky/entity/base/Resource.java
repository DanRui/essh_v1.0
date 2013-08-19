package com.eryansky.entity.base;

import com.eryansky.entity.base.state.ResourceState;
import com.eryansky.entity.base.state.StatusState;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.google.common.collect.Lists;
import com.eryansky.common.orm.entity.BaseEntity;
import com.eryansky.common.utils.ConvertUtils;
import com.eryansky.utils.CacheConstants;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

/**
 * 受保护的资源菜案Resource.
 * Author 尔演&Eryan eryanwcp@gmail.com
 * Date 2013-3-21 上午12:27:49
 *
 */
@SuppressWarnings("serial")
@Entity
@Table(name = "T_BASE_RESOURCE")
@Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE,region = CacheConstants.HIBERNATE_CACHE_BASE)
//jackson标记不生成json对象的属性 
@JsonIgnoreProperties (value = { "hibernateLazyInitializer" , "handler","fieldHandler" ,  "parentResource",
        "roles", "roleNames", "subResources", "navigation" })
public class Resource
        extends BaseEntity
        implements Serializable {

    /**
     * 资源名称
     */
    private String name;
    /**
     * 资源编码
     */
    private String code;
    /**
     * 资源url地址
     */
    private String url;
    /**
     * 排序
     */
    private Integer orderNo;
    /**
     * 图标
     */
    private String ico;
    /**
     * 父级Resource
     */
    private Resource parentResource;
    /**
     * 父级ResourceId @Transient
     */
    private Long parentId;
    /**
     * 标记url
     */
    private String markUrl;
    /**
     * 资源类型 资源(0) 功能(1)
     */
    private Integer type = ResourceState.menu.getValue();
    /**
     * 有序的关联对象集合
     */
    private List<Role> roles = Lists.newArrayList();
    /**
     * 子Resource集合
     */
    private List<Resource> subResources = Lists.newArrayList();

    public Resource() {
    }

    @Column(name = "MARK_URL",length = 2000)
    public String getMarkUrl() {
        return markUrl;
    }

    public void setMarkUrl(String markUrl) {
        this.markUrl = markUrl;
    }

    @NotBlank(message = "{resource_name.notblank}")
    @Length(max = 20, message = "{resource_name.length}")
    @Column(length = 255,unique = true)
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Column(length = 36)
    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    @Column(length = 255)
    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }
    
    @Column(name = "ORDER_NO")
    public Integer getOrderNo() {
        return orderNo;
    }

    public void setOrderNo(Integer orderNo) {
        this.orderNo = orderNo;
    }

    @Column(length = 255)
    public String getIco() {
        return ico;
    }

    public void setIco(String ico) {
        this.ico = ico;
    }
    
    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    @ManyToOne(cascade = { CascadeType.PERSIST, CascadeType.MERGE })
    @JoinColumn(name = "PARENT_ID")
    public Resource getParentResource() {
        return parentResource;
    }

    public void setParentResource(Resource parentResource) {
        this.parentResource = parentResource;
    }

    @ManyToMany(mappedBy = "resources")
    @Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE,region = CacheConstants.HIBERNATE_CACHE_BASE)
    public List<Role> getRoles() {
        return roles;
    }

    public void setRoles(List<Role> roles) {
        this.roles = roles;
    }

    /**
     * 角色拥有的资源字符串,多个之间以","分割
     * 
     * @return
     */
    @Transient
    public String getRoleNames() {
        return ConvertUtils.convertElementPropertyToString(roles, "name",
                ", ");
    }

    @OneToMany(mappedBy = "parentResource")
    public List<Resource> getSubResources() {
        return subResources;
    }

    public void setSubResources(List<Resource> subResources) {
        this.subResources = subResources;
    }

    @Transient
    public List<Resource> getNavigation() {
        ArrayList<Resource> arrayList = new ArrayList<Resource>();
        Resource resource = this;
        arrayList.add(resource);
        while (null != resource.parentResource) {
            resource = resource.parentResource;
            arrayList.add(0, resource);
        }
        return arrayList;
    }

    @Transient
    public Long getParentId() {
        if (parentResource != null) {
            parentId = parentResource.getId();
        }
        return parentId;
    }

    public void setParentId(Long parentId) {
        this.parentId = parentId;
    }

    /**
     * 资源类型描述
     */
    @Transient
    public String getTypeDesc() {
        ResourceState r = ResourceState.getResourceState(type);
        String str = "";
        if(r != null){
            str = r.getDescription();
        }
        return str;
    }

    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this);
    }

}