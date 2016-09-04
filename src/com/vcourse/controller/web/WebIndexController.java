package com.vcourse.controller.web;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.vcourse.po.AjaxReturn;
import com.vcourse.po.Course;
import com.vcourse.po.Manager;
import com.vcourse.po.Student;
import com.vcourse.service.CourseService;
import com.vcourse.service.ManagerService;
import com.vcourse.service.StudentService;
import com.vcourse.util.MD5Util;
import com.vcourse.util.StringUtil;

@Controller
@Scope("prototype")
public class WebIndexController extends WebBaseController{
	@Autowired
	private StudentService studentService;
	
	@Autowired
	private CourseService courseService;
	
	@Autowired
	private ManagerService managerService;
	
	//系统首页
	@RequestMapping({"/index","/"})
	public ModelAndView index() {
		initMV();
		
		//查找学校课程
		whereMap=new HashMap<String,Object>();
		whereMap.put("startPos",0);
		whereMap.put("pageSize", 4);
		List<Course> newCourseList = courseService.findAll(whereMap);
		
		//热门课程
		whereMap=new HashMap<String,Object>();
		whereMap.put("startPos",0);
		whereMap.put("pageSize", 3);
		whereMap.put("order_by", "course_click_desc");
		List<Course> hotCourseList = courseService.findAll(whereMap);
		
		//名师风采
		whereMap=new HashMap<String,Object>();
		whereMap.put("startPos",0);
		Manager teacherStart =  managerService.findTeacherStart();
		List<Course> startCourseList = null;
		if (teacherStart!=null) {
			//该名师的课程
			whereMap=new HashMap<String,Object>();
			whereMap.put("mid",teacherStart.getId());
			whereMap.put("startPos",0);
			whereMap.put("pageSize", 7);
			startCourseList = courseService.findAll(whereMap);
			
		}
		
		modelAndView.addObject("newCourseList", newCourseList);
		modelAndView.addObject("hotCourseList", hotCourseList);
		modelAndView.addObject("course_action","atHome");
		modelAndView.addObject("teacherStart",teacherStart);
		modelAndView.addObject("startCourseList",startCourseList);
		modelAndView.setViewName("index");
		return modelAndView;
	}
	
	@RequestMapping({"/register"})
	public ModelAndView register() {
		initMV();
		return modelAndView;
	}
	
	@RequestMapping("/doRegister")
	@ResponseBody
	public AjaxReturn doRegister(Student student) {

		AjaxReturn ajax = new AjaxReturn();

		if (StringUtil.isEmpty(student.getUsername())) {
			ajax.setMsg("用户名不能为空");
		} else if (StringUtil.isEmpty(student.getPassword())) {
			ajax.setMsg("密码不能为空");
		} else {
			//判断用户是否已被注册
			Student u = studentService.findByName(student.getUsername());
			
			if (u!=null) {
				ajax.setMsg("该用户名已被使用");
			}else{
				String pasword = MD5Util.string2MD5(student.getPassword());
				student.setPassword(pasword);
				int result = studentService.insert(student);
				if (result>0) {
					ajax.setStatus(1);
					ajax.setMsg("注册成功，请登陆");
				}else {
					ajax.setMsg("用户名或密码错误");
					
				}
			}
		}

		return ajax;

	}
	
	//登陆
	@RequestMapping({ "/login" })
	public String login() {
		Object student_id = request.getSession().getAttribute("student_id");
		if (student_id != null) {
			return redirect("/index");
		}
		return "login";
	}
	
	
	@RequestMapping("/dologin")
	@ResponseBody
	public AjaxReturn dologin(Student student) {

		AjaxReturn ajax = new AjaxReturn();
		Object student_id = request.getSession().getAttribute("student_id");

		if (student_id != null) {
			ajax.setStatus(1);
			ajax.setMsg("您已登陆");
		} else if (StringUtil.isEmpty(student.getUsername())) {
			ajax.setMsg("用户名不能为空");

		} else if (StringUtil.isEmpty(student.getPassword())) {
			ajax.setMsg("密码不能为空");
		} else {
			Student u = studentService.findByName(student.getUsername());
			String pasword = MD5Util.string2MD5(student.getPassword());
			if (u == null || !u.getPassword().equals(pasword)) {
				ajax.setMsg("用户名或密码错误");
			} else {
				request.getSession().setAttribute("student_id", u.getId());
				request.getSession().setAttribute("student_username",u.getUsername());
				request.getSession().setAttribute("student_thumb", u.getThumb());
				ajax.setStatus(1);
				ajax.setMsg("登陆成功");
			}
		}

		return ajax;

	}
	
	@RequestMapping("/logout")
	public String logout() {
		HttpSession session = request.getSession();
		session.setAttribute("student_id", null);
		session.setAttribute("student_username", null);
		session.setAttribute("student_thumb", null);
		return redirect("/login");
	}
}
