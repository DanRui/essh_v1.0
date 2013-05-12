package com.eryansky.service.base;

import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.Set;

import javax.validation.ConstraintViolation;

import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.google.common.collect.Maps;
import com.eryansky.common.model.User;
import com.eryansky.common.orm.Page;
import com.eryansky.common.orm.jdbc.JdbcDao;
import com.eryansky.common.orm.jpa.JpaDao;
import com.eryansky.common.utils.io.PropertiesLoader;
import com.eryansky.common.utils.mapper.JsonMapper;
import com.eryansky.entity.base.Menu;
import com.eryansky.service.CommonManager;

/**
 * Account单元测试
 * @author 尔演&Eryan eryanwcp@gmail.com
 * @date   2012-8-17 上午9:31:38
 */
public class AccountManagerTest {
	
	@SuppressWarnings("unused")
    private static Properties pro;
	
	private static JdbcDao jdbcDao;
	private static MenuManager menuManager;
	private static CommonManager commonManager;
	
	private static JpaDao<User, Long> userJpaDao;
	
	@BeforeClass
	public static void init() throws Exception{
		ApplicationContext context = new ClassPathXmlApplicationContext("spring-test.xml");
		jdbcDao = (JdbcDao)context.getBean("jdbcDao");
		menuManager = (MenuManager)context.getBean("menuManager");
		commonManager = (CommonManager)context.getBean("commonManager");
		
		pro = new PropertiesLoader("/appconfig.properties").getProperties();
		userJpaDao = new JpaDao<User, Long>(User.class);
	}
	
	@Test
    public void jpaPage(){
		try {
			Page<User> page = userJpaDao.findPage(new Page<User>(20), "from User u where u.loginName = ?", new Object[]{"admin"});
			System.out.println(JsonMapper.nonEmptyMapper().toJson(page));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@Test
    public void test2(){
	    Map<String, String> map = Maps.newHashMap();
	    map.put("name", "%");
	    System.out.println(jdbcDao.findForListMap("select * from t_base_menu where name like :name ",  map));
    }
	
	
	@Test
    public void page(){
		String sql = "select * from T_BASE_USER";
		List list1 = jdbcDao.findForJdbc(sql, 1, 20);
		System.out.println(JsonMapper.nonEmptyMapper().toJson(list1));
    }
	
	@Test
    public void assertt(){
		System.out.println(commonManager.getIdByProperty("Menu", "name", "菜单管理"));
		System.out.println(commonManager.getIdByTFO("T_BASE_MENU", "NAME", "菜 单管理"));
    }
	@Test
    public void validator(){
		try {
			menuManager.save(new Menu());
		} catch (Exception e) {
			StringBuilder sb = new StringBuilder();
			javax.validation.ConstraintViolationException ce = (javax.validation.ConstraintViolationException) e;
			Set<ConstraintViolation<?>> set =  ce.getConstraintViolations();
			Iterator<?> iterator = set.iterator();
			int i = -1;
			while(iterator.hasNext()){
				ConstraintViolation<?> c = (ConstraintViolation<?>) iterator.next();
				sb.append(c.getMessage());
				i++;
				if (i < set.size() - 1) {
					sb.append(",");
				}else{
					sb.append(".");
				}
			}
			System.out.println(sb.toString());
			e.printStackTrace();
		}
	}
	
	@Test
    public void dbutils(){
    }

}
