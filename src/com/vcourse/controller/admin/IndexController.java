package com.vcourse.controller.admin;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.vcourse.po.Comment;
import com.vcourse.service.CommentService;
import com.vcourse.service.CourseService;
import com.vcourse.service.ManagerService;
import com.vcourse.service.StudentService;

@Controller
@Scope("prototype")
public class IndexController extends BaseController{
	@Autowired
	private StudentService studentService;
	@Autowired
	private ManagerService managerService;
	@Autowired
	private CourseService courseService;
	@Autowired
	private CommentService commentService;
	
	//系统首页
	@RequestMapping("/admin/index")
	public ModelAndView index() {
		initMV();
		//注册用户数
		int studentCount = studentService.selectAllCount(null);
		//讲师数量
		whereMap = new HashMap<String, Object>();
		whereMap.put("role", 2);
		int teacherCount = managerService.selectAllCount(whereMap);
		
		//课程数量
		int courseCount = courseService.findAllCount(null);
		//评论数量
		int commentCount = commentService.selectAllCount(null);
		
		//最新5条评论
		whereMap = new HashMap<String, Object>();
		whereMap.put("startPos", 0);
		whereMap.put("pageSize", 5);
		List<Comment> commentList = commentService.findAll(whereMap);
		
		modelAndView.addObject("studentCount", studentCount);
		modelAndView.addObject("teacherCount", teacherCount);
		modelAndView.addObject("courseCount", courseCount);
		modelAndView.addObject("commentCount", commentCount);
		modelAndView.addObject("commentList", commentList);
		return modelAndView;
	}
	
}
