package com.vcourse.controller.admin;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.vcourse.po.Manager;
import com.vcourse.po.Record;
import com.vcourse.po.Student;
import com.vcourse.service.CollectService;
import com.vcourse.service.CommentService;
import com.vcourse.service.RecordService;
import com.vcourse.service.StudentService;
import com.vcourse.service.VideoService;
import com.vcourse.service.VrecordService;
import com.vcourse.util.MD5Util;
import com.vcourse.util.Page;
import com.vcourse.util.StringUtil;

@Controller
@Scope("prototype")
@RequestMapping("/admin/student")
public class StudentController extends BaseController {

	@Autowired
	private StudentService studentService;
	
	@Autowired
	private VrecordService vrecordService;
	
	@Autowired
	private RecordService recordService;
	
	@Autowired
	private CollectService collectService;

	@Autowired
	private CommentService commentService;


	// 列表
	@RequestMapping({"/","","/index","list"})
	public ModelAndView list() {
		initMV();
		String keywords = request.getParameter("keywords");
		
		whereMap = new HashMap<String, Object>();
		

		if (keywords!=null) {
			keywords=keywords.trim();
			if(!StringUtil.isEmpty(keywords)){
				whereMap.put("name_search","%"+keywords+"%");
				modelAndView.addObject("pageAddparam", "&keywords="+keywords);
			}
		}
		
		int pageNow = getPageNow();
		int totalCount = (int) studentService.selectAllCount(whereMap);
		
		Page page  = new Page(totalCount, pageNow);
		page.setPageSize(6);
		
		
		whereMap.put("startPos", page.getStartPos());
		whereMap.put("pageSize", page.getPageSize());
		List<Student> studentList = studentService.findAll(whereMap);
		
		modelAndView.addObject("page", page);
		modelAndView.addObject("studentList", studentList);
		modelAndView.addObject("keywords", keywords);
		modelAndView.setViewName("admin/student/list");
		return modelAndView;
	}

	

	// 修改
	@RequestMapping("/edit/{sid}")
	public ModelAndView edit(@PathVariable("sid") Integer sid) {
		initMV();
		System.out.println(sid);
		modelAndView.addObject("student", studentService.findById(sid));
		modelAndView.setViewName("admin/student/edit");
		return modelAndView;
	}

	// 编辑个人信息
	@RequestMapping("/doedit")
	public ModelAndView doedit(Student student) {
		initMV();
		if (!StringUtil.isEmpty(student.getPassword())) {
			student.setPassword(MD5Util.string2MD5(student.getPassword()));
		}

		int result = studentService.updateByPrimaryKeySelective(student);
		if (result > 0) {
			return Msg("修改成功", ctxPath() + "admin/student");
		} else {
			return Msg("修改失败");
		}
	}
	
	// 删除
		@RequestMapping("/del")
		public ModelAndView del(Integer id) {
			initMV();

			if(id <= 0) {
				return Msg("参数有误");
			}
			int result = studentService.delete(id);
			if (result > 0) {
				whereMap = new HashMap<String, Object>();
				whereMap.put("sid", id);
				//删除课程记录
				recordService.deleteByMap(whereMap);
				//删除视频查看记录
				vrecordService.deleteByMap(whereMap);
				//删除评论
				commentService.deleteByMap(whereMap);
				//删除收藏
				collectService.deleteByMap(whereMap);
				return Msg("删除成功", ctxPath() + "admin/student/list");
			} else {
				return Msg("删除失败");
			}
		}
}
