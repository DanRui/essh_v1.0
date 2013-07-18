package com.eryansky.entity.base;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.google.common.collect.Lists;
import com.eryansky.common.orm.entity.BaseEntity;
import com.eryansky.common.utils.ConvertUtils;
import com.eryansky.entity.base.state.MenuState;
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
 * 受保护的资源菜案Menu.
 * Author 尔演&Eryan eryanwcp@gmail.com
 * Date 2013-3-21 上午12:27:49
 *
 */
@SuppressWarnings("serial")
@Entity
@Table(name = "T_BASE_MENU")
@Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE,region = CacheConstants.HIBERNATE_CACHE_BASE)
//jackson标记不生成json对象的属性 
@JsonIgnoreProperties (value = { "hibernateLazyInitializer" ,  "parentMenu",
        "roles", "roleNames", "subMenus", "navigation" })
public class Menu
        extends BaseEntity
        implements Serializable {

    /**
     * 菜单名称
     */
    private String name;
    /**
     * 菜单url地址
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
     * 父级Menu
     */
    private Menu parentMenu;
    /**
     * 父级MenuId @Transient
     */
    private Long parentId;
    /**
     * 标记url
     */
    private String markUrl;
    /**
     * 菜单类型 菜单(0) 按钮(1)
     */
    private Integer type = MenuState.menu.getValue();
    /**
     * 有序的关联对象集合
     */
    private List<Role> roles = Lists.newArrayList();
    /**
     * @Transient 子Menu集合
     */
    private List<Menu> subMenus = Lists.newArrayList();

    public Menu() {
    }

    public Menu(String name, String url, Integer orderNo, String ico,
            Menu parentMenu, String markUrl,Integer type, List<Menu> subMenus) {
        this.name = name;
        this.url = url;
        this.orderNo = orderNo;
        this.ico = ico;
        this.parentMenu = parentMenu;
        this.markUrl = markUrl;
        this.type = type;
        this.subMenus = subMenus;
    }

    @Column(name = "MARK_URL",length = 255)
    public String getMarkUrl() {
        return markUrl;
    }

    public void setMarkUrl(String markUrl) {
        this.markUrl = markUrl;
    }

    @NotBlank(message = "{menu_name.notblank}")
    @Length(max = 20, message = "{menu_name.length}")
    @Column(length = 255,unique = true)
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
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
    public Menu getParentMenu() {
        return parentMenu;
    }

    public void setParentMenu(Menu parentMenu) {
        this.parentMenu = parentMenu;
    }

    @ManyToMany(mappedBy = "menus")
    @Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE,region = CacheConstants.HIBERNATE_CACHE_BASE)
    public List<Role> getRoles() {
        return roles;
    }

    public void setRoles(List<Role> roles) {
        this.roles = roles;
    }

    /**
     * 角色拥有的菜单字符串,多个之间以","分割
     * 
     * @return
     */
    @Transient
    public String getRoleNames() {
        return ConvertUtils.convertElementPropertyToString(roles, "name",
                ", ");
    }

    @OneToMany(mappedBy = "parentMenu")
    public List<Menu> getSubMenus() {
        return subMenus;
    }

    public void setSubMenus(List<Menu> subMenus) {
        this.subMenus = subMenus;
    }

    @Transient
    public List<Menu> getNavigation() {
        ArrayList<Menu> arrayList = new ArrayList<Menu>();
        Menu menu = this;
        arrayList.add(menu);
        while (null != menu.parentMenu) {
            menu = menu.parentMenu;
            arrayList.add(0, menu);
        }
        return arrayList;
    }

    @Transient
    public Long getParentId() {
        if (parentMenu != null) {
            parentId = parentMenu.getId();
        }
        return parentId;
    }

    public void setParentId(Long parentId) {
        this.parentId = parentId;
    }

    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this);
    }

}