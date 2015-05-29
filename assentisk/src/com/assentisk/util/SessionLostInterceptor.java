package com.assentisk.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;


public class SessionLostInterceptor extends HandlerInterceptorAdapter {

	private String checking;

	public String getChecking() {
		return checking;
	}
	

	public void setChecking(String checking) {
		this.checking = checking;
	}


	@Override
	public boolean preHandle(HttpServletRequest req, HttpServletResponse res,
			Object handler) throws Exception {
		System.out.println(req.getSession().getAttribute("languageVal"));
		if (req.getSession().getAttribute("languageVal")==null) {

			res.sendRedirect(req.getContextPath() + "/login.htm");
			return false;
		}

		return super.preHandle(req, res, handler);
	}

}
