package com.eryansky.codegen.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import com.eryansky.codegen.util.Resources;

/**
 * @author big_tiger
 */
public class DbConnection {
	
	public Connection getConn() {
		Connection conn = null;
		try {
			Class.forName(Resources.DRIVER).newInstance();
			conn = DriverManager.getConnection(Resources.URL, Resources.USERNAME, Resources.PASSWORD);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InstantiationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return conn;
	}

}
