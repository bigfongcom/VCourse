package com.vcourse.controller.web;

import com.vcourse.VCourseController;

public class WebBaseController extends VCourseController {
	
	//判断是否为讲师，返回该用户id
	protected String getStudentId() {
		Object student_id = request.getSession().getAttribute("student_id");
		return   (student_id!=null)?student_id.toString():null;
	}
}
