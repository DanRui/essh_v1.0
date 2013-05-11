package com.eryansky.common.exception;

/**
 * 系统异常,继承自BaseException.
 * 
 * @author 尔演&Eryan eryanwcp@gmail.com
 * @date 2012-4-30 上午12:08:55
 */
@SuppressWarnings("serial")
public class SystemException extends BaseException {

	public SystemException() {
		super();
	}

	public SystemException(String message) {
		super(message);
	}

	public SystemException(Throwable cause) {
		super(cause);
	}

	public SystemException(String message, Throwable cause) {
		super(message, cause);
	}

}
