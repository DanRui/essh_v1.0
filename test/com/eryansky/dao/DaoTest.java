package com.eryansky.dao;

import java.util.Properties;
import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.eryansky.common.model.User;
import com.eryansky.common.orm.Page;
import com.eryansky.common.orm.dbutils.DbUtilsDao;
import com.eryansky.common.orm.jdbc.JdbcDao;
import com.eryansky.common.orm.jpa.JpaDao;
import com.eryansky.common.utils.io.PropertiesLoader;
import com.eryansky.entity.base.Menu;
import com.eryansky.service.base.RoleManager;

/**
 * Dao单元测试.
 * @author 尔演&Eryan eryanwcp@gmail.com
 * @date 2013-4-16 下午8:12:40 
 * @version 1.0
 */
public class DaoTest {
	
	@SuppressWarnings("unused")
    private static Properties pro;
	
	private static JdbcDao jdbcDao;
	
	private static JpaDao<User, Long> userJpaDao;
	private static DbUtilsDao dbUtilsDao;
	private static RoleManager roleManager;
	
	@BeforeClass
	public static void init() throws Exception{
		ApplicationContext context = new ClassPathXmlApplicationContext("spring-test.xml");
		jdbcDao = (JdbcDao)context.getBean("jdbcDao");
		dbUtilsDao = (DbUtilsDao)context.getBean("dbUtilsDao");
		roleManager = (RoleManager)context.getBean("roleManager");
		pro = new PropertiesLoader("/appconfig.properties").getProperties();
	}
	
	@Test
    public void test(){
		try {
			Page<Menu> menus =dbUtilsDao.findPage(Menu.class, "select * from T_BASE_MENU ", 1, 20);
			for(Menu m :menus.getResult()){
				System.out.println(m.getName());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@Test
    public void update(){
		try {
			String sql = "update T_BASE_ROLE set name = ? where id = ?";
			Object[] obj = new Object[]{"11",1};
			int count;
			count = dbUtilsDao.update(sql,new Object[]{"11",1});
			
//			count = jdbcDao.executeSql(sql, obj);
			System.out.println(count);

//		    roleManager.update();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
