package test;

import java.util.List;

import org.apache.commons.lang3.Validate;

import com.eryansky.common.utils.collections.Collections3;

/**
 * @copyright  : CopyRright (c) 2012 Jiang Xi Strong Co. Ltd. All right reserved.
 * @description: Test.java
 * @project    : 抚州人社局人才市场系统 ——人才市场招聘网站子系统
 * @jdk        : jdk5.0 
 * @comments   : 描述类功能
 * @create     : 尔演&Eryan eryanwcp@gmail.com
 * @modify     : new
 * @version    : V1.0  
 * @author     : 尔演&Eryan eryanwcp@gmail.com
 * @date       : 2013-1-19 下午10:12:48 
 * @history    : 2013-1-19
 *     No./ Date/Author/Operate/
 *     1. 2012.12.19    温春平  new 
 */
/**
 * @description: {TODO}
 * @author : 尔演&Eryan eryanwcp@gmail.com
 * @date : 2013-1-19 下午10:12:48
 * @version : v1.0
 * @since
 */
public class Test {

	/**
	 * @param args
	 * @author : 尔演&Eryan eryanwcp@gmail.com
	 * @date : 2013-1-19 下午10:12:48
	 * @version : v1.0
	 */
	public static void main(String[] args) {
//		List<Long> ids = null;
//		if (!Collections3.isEmpty(ids)) {
//			for (Long id : ids) {
//				System.out.println(id);
//			}
//		}
		
		
		try {
			Validate.notBlank("", "queryString不能为空");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
	}

}
