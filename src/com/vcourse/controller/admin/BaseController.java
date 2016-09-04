package com.vcourse.controller.admin;

import com.vcourse.VCourseController;

public class BaseController extends VCourseController {
	//判断是否为讲师，返回该用户id
	protected String isTeacher() {
		String role = request.getSession().getAttribute("manager_role").toString();
		System.out.println("role:"+role);
		if (role.equals("2")) {
		   return   request.getSession().getAttribute("manager_id").toString();
		} else {
			return null;
		}
	}
	
}
