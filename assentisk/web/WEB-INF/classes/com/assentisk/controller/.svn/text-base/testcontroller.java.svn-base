package com.assentisk.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.validation.BindException;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;

import com.assentisk.dao.MasterDao;

public class testcontroller extends SimpleFormController{
	
	protected MasterDao tst;
		
	public MasterDao getTst() {
		return tst;
	}

	public void setTst(MasterDao tst) {
		this.tst = tst;
	}

	protected ModelAndView showForm(HttpServletRequest req,
			HttpServletResponse res, BindException ex) throws Exception {
		
		System.out.println("called");
		System.out.println(tst.getList());
		return null;
	}

	protected ModelAndView onSubmit(HttpServletRequest req,
			HttpServletResponse res, Object cmd, BindException errors)
			throws Exception {
		
		return null;
	}
}
