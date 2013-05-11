package com.eryansky.common.web.filter.gzip;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

import com.eryansky.common.web.utils.WebUtils;

/**
 * GZIP拦截器.
 * 
 * @author 尔演&Eryan eryanwcp@gmail.com
 * @date 2013-3-30 下午9:32:59
 * 
 */
public class GZIPFilter implements Filter {

	public void doFilter(ServletRequest req, ServletResponse res,
			FilterChain chain) throws IOException, ServletException {
		if (req instanceof HttpServletRequest) {
			HttpServletRequest request = (HttpServletRequest) req;
			HttpServletResponse response = (HttpServletResponse) res;
			WebUtils.checkAccetptGzip(request);
			if (WebUtils.checkAccetptGzip(request)) {
				GZIPResponseWrapper wrappedResponse = new GZIPResponseWrapper(
						response);
				chain.doFilter(req, wrappedResponse);
				wrappedResponse.finishResponse();
				return;
			}
			chain.doFilter(req, res);
		}
	}

	public void init(FilterConfig filterConfig) {
		// noop
	}

	public void destroy() {
		// noop
	}
}
