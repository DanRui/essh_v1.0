package com.eryansky.entity.base;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OrderBy;
import javax.persistence.Table;
import javax.persistence.Transient;

import com.eryansky.entity.base.state.SexType;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

import com.eryansky.common.orm.PropertyType;
import com.eryansky.common.orm.annotation.Delete;
import com.eryansky.common.orm.entity.BaseEntity;
import com.eryansky.common.utils.ConvertUtils;
import com.eryansky.common.utils.collections.Collections3;
import com.eryansky.utils.AppConstants;
import com.eryansky.utils.CacheConstants;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.google.common.collect.Lists;

/**
 * 用户管理User.
 * @author 尔演&Eryan eryanwcp@gmail.com
 * @date 2013-3-21 上午12:28:04 
 *
 */
@SuppressWarnings("serial")
@Entity
@Table(name = "T_BASE_USER")
@Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE,region = CacheConstants.HIBERNATE_CACHE_BASE)
//jackson标记不生成json对象的属性 
@JsonIgnoreProperties (value = { "hibernateLazyInitializer" , "handler","fieldHandler","roles"})
//逻辑删除注解标记 propertyName:字段名 value:删除标记的值（使用默认值"1"） type:属性类型
@Delete(propertyName = "status",type = PropertyType.I)
public class User
        extends BaseEntity
        implements Serializable {
	
    /**
     * 登录用户
     */
    private String loginName;
    /**
     * 登录密码
     */
    private String password;
    /**
     * 用户姓名
     */
    private String name;
    /**
     * 性别 女(0) 男(1) 保密(2) 默认：保密
     */
    private Integer sex = SexType.secrecy.getValue();

    /**
     * 邮件 以 ","分割
     */
    private String email;
    /**
     * 住址
     */
    private String address;
    /**
     * 住宅电话 以 ","分割
     */
    private String tel;
    /**
     * 手机号 以 ","分割
     */
    private String mobilephone;
    /**
     * 有序的关联对象集合
     */
    private List<Role> roles = Lists.newArrayList();
    /**
     * 有序的关联Role对象id集合
     */
    private List<Long> roleIds = Lists.newArrayList();

    public User() {

    }

    public User(String loginName, String password, String name, Integer sex,
            String email, String address, String tel, String mobilephone,
            List<Role> roles) {
        super();
        this.loginName = loginName;
        this.password = password;
        this.name = name;
        this.sex = sex;
        this.email = email;
        this.address = address;
        this.tel = tel;
        this.mobilephone = mobilephone;
        this.roles = roles;
    }

    @Column(length = 32, nullable = false,unique = true)
    public String getLoginName() {
        return loginName;
    }

    public void setLoginName(String loginName) {
        this.loginName = loginName;
    }

    @Column(length = 32)
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    // 多对多定义
    @ManyToMany
    // 中间表定义,表名采用默认命名规则
    @JoinTable(name = "T_BASE_USER_ROLE", joinColumns = { @JoinColumn(name = "USER_ID") }, inverseJoinColumns = { @JoinColumn(name = "ROLE_ID") })
    // Fecth策略定义
//   @Fetch(FetchMode.SUBSELECT)
    // 集合按id排序.
    @OrderBy("id")
    @Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE, region = CacheConstants.HIBERNATE_CACHE_BASE)
    public List<Role> getRoles() {
        return roles;
    }

    public void setRoles(List<Role> roles) {
        this.roles = roles;
    }

    @Column(length = 64, nullable = false)
    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Integer getSex() {
        return sex;
    }

    public void setSex(Integer sex) {
        this.sex = sex;
    }

    /**
     * 性别描述.
     */
    @Transient
    public String getSexDesc() {
    	SexType ss = SexType.getSexType(sex);
    	String str = "";
    	if(ss != null){
    		str = ss.getDescription();
    	}
        return str;
    }
    
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getMobilephone() {
        return mobilephone;
    }

    public void setMobilephone(String mobilephone) {
        this.mobilephone = mobilephone;
    }

    /**
     * 用户拥有的角色名称字符串, 多个角色名称用','分隔.
     * <br>如果是超级管理员 直接返回 "超级管理员" AppConstants.ROLE_SUPERADMIN
     */
    @Transient
    // 非持久化属性.
    public String getRoleNames() {
    	Long superId = 1L;
	    if(superId.equals(this.getId())){
	        return AppConstants.ROLE_SUPERADMIN;
	    }
        return ConvertUtils.convertElementPropertyToString(roles, "name",
                ", ");
    }

    @SuppressWarnings("unchecked")
    @Transient
    public List<Long> getRoleIds() {
        if (!Collections3.isEmpty(roles)) {
            roleIds = ConvertUtils.convertElementPropertyToList(roles, "id");
        }
        return roleIds;
    }

    public void setRoleIds(List<Long> roleIds) {
        this.roleIds = roleIds;
    }
    

    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this);
    }

}
