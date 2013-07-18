package com.eryansky.codegen.db;

import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.eryansky.codegen.vo.Column;
import com.eryansky.codegen.vo.Table;

/**
 * Oracle Metadata读取
 */
public class OracleDataSource extends DataSource {

	public OracleDataSource(Connection conn, String catalog, String schema) {
		super(conn, catalog, schema);
	}

	@Override
	public List<Column> getColumns(String namePattern) throws SQLException {
		return null;
	}

	@Override
	public List<Column> getPrimaryKey(String namePattern) throws SQLException {
		return null;
	}

	@Override
	public List<Column> getForeignKeys(String namePattern) throws SQLException {
		return null;
	}

	@Override
	public List<Table> getTables(String namePattern) throws SQLException {
		List<Table> tables = new ArrayList<Table>();
		ResultSet rs = null;
		try {
			DatabaseMetaData dmd = conn.getMetaData();// 获取数据库的MataData信息
			rs = dmd.getTables(catalog, schema, namePattern, DEFAULT_TYPES);
			while (rs.next()) {
				Table table = new Table();
				table.setTableName(rs.getString("TABLE_NAME"));
				table.setSchema(rs.getString("TABLE_SCHEM"));
				table.setCatalog(rs.getString("TABLE_CAT"));
				table.setTableType(rs.getString("TABLE_TYPE"));
				table.setRemark(rs.getString("REMARKS"));
				tables.add(table);
			}

		} catch (SQLException e) {
			throw e;
		} finally {
			close(null, rs);
		}
		return tables;
	}

}
