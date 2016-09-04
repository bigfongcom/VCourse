package com.vcourse;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.ModelAndView;

public class VCourseController {
	//protected Msg msg = null;
	protected ModelAndView modelAndView=null;
	protected Map<String,Object> whereMap=null;
	
	@Autowired  
	protected  HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest(); 
	
	protected String redirect(String redirectString) {
		return "redirect:"+redirectString;
	}
	
	public String ctxPath() {
		//return request.getContextPath();
		return request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
	}
	
	protected void initMV() {
		if (this.modelAndView==null) {
			this.modelAndView = new ModelAndView();
		}
	}
	
	protected ModelAndView Tpl(String jspPath) {
		initMV();
		modelAndView.setViewName(jspPath);
		return modelAndView;
	}
	
	protected ModelAndView Msg(String msg) {
		initMV();
		modelAndView.addObject("msg", msg);
		modelAndView.addObject("jumpTime", 2);
		modelAndView.addObject("jumpUrl", "javascript:history.go(-1);");
		modelAndView.setViewName("msg");
		return modelAndView;
	}
	
	protected ModelAndView Msg(String msg,String jumpUrl) {
		initMV();
		modelAndView.addObject("msg", msg);
		modelAndView.addObject("jumpTime", 2);
		modelAndView.addObject("jumpUrl", jumpUrl);
		modelAndView.setViewName("msg");
		return modelAndView;
	}
	
	protected ModelAndView Msg(String msg,String jumpUrl, Integer jumpTime) {
		initMV();
		modelAndView.addObject("msg", msg);
		modelAndView.addObject("jumpUrl", jumpUrl);
		modelAndView.addObject("jumpTime", jumpTime);
		modelAndView.setViewName("msg");
		return modelAndView;
	}
	
	protected int getPageNow() {
		String pageNow = request.getParameter("pageNow");
		if (!(pageNow!=null)) {
			pageNow = "1";
		}
		return Integer.parseInt(pageNow);
	}
}
