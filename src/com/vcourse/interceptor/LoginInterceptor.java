package com.vcourse.interceptor;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class LoginInterceptor implements HandlerInterceptor{
	
	
	
	//允许哪些url不被拦截，哪些需要拦截
	private List<String> allowedPass;
	
	public void setAllowedPass(List<String> allowedPass) {
		this.allowedPass = allowedPass;
	}


	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response,
			Object handler) throws Exception {
		
		/*String path = request.getContextPath();
		String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
		request.setAttribute("basePath", basePath);
		System.out.println(basePath);*/
		String url=request.getRequestURI().toString();
		//先判断session是否存在
		Object manager_id = request.getSession().getAttribute("manager_id");
		request.setAttribute("cur_url", request.getServletPath());
		if (manager_id!=null) {
			return true;
		} else {
			for (String temp : allowedPass) {
				if (url.endsWith(temp)) {
					return true;
				}
			}
		}
		
		
		response.sendRedirect(request.getContextPath()+"/sys/login");
		return false;
	}
	

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response,
			Object handler, ModelAndView mv) throws Exception {
	}


	@Override
	public void afterCompletion(HttpServletRequest request,
			HttpServletResponse response, Object handler, Exception e)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

}
