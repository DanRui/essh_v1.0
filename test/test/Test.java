package test;

import java.util.List;

import org.apache.commons.lang3.Validate;

import com.eryansky.common.utils.collections.Collections3;

/**
 *   测试.
 */
public class Test {

	public static void main(String[] args) {
		List<Long> ids = null;
		if (!Collections3.isEmpty(ids)) {
			for (Long id : ids) {
				System.out.println(id);
			}
		}
		
		
		try {
			Validate.notBlank("", "queryString不能为空");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
	}

}
