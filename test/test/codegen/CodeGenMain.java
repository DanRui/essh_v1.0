package test.codegen;

import com.eryansky.codegen.Builder;
import com.eryansky.codegen.db.DataSource;
import com.eryansky.codegen.db.DbConnection;
import com.eryansky.codegen.db.DbFactory;
import com.eryansky.codegen.vo.Table;
import org.junit.Before;
import org.junit.Test;

import java.util.List;

public class CodeGenMain {
	private List<Table> tables = null;
	private Builder builder = null;
	DataSource db = null;
	String t = "T_SYS%";//user_info
	Table table = null;

	@Before
	public void before() {
		try {
			db = DbFactory.create(new DbConnection().getConn());
			tables = db.getTables(t);
			builder = new Builder(tables);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Test
	public void buildTest() {
		builder.build();
	}

}
