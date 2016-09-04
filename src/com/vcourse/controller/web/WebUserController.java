package com.vcourse.controller.web;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.vcourse.po.AjaxReturn;
import com.vcourse.po.Collect;
import com.vcourse.po.Comment;
import com.vcourse.po.Record;
import com.vcourse.po.Student;
import com.vcourse.service.CollectService;
import com.vcourse.service.CommentService;
import com.vcourse.service.RecordService;
import com.vcourse.service.StudentService;
import com.vcourse.service.VrecordService;
import com.vcourse.util.MD5Util;
import com.vcourse.util.Page;
import com.vcourse.util.StringUtil;

@Controller
@Scope("prototype")
@RequestMapping("/user")
public class WebUserController extends WebBaseController {
	@Autowired
	private StudentService studentService;
	
	@Autowired
	private RecordService recordService;
	
	@Autowired
	private CollectService collectService;
	
	@Autowired
	private CommentService commentService;
	
	@Autowired
	private VrecordService vrecordService;

	// 我的课程
	@RequestMapping({ "/index", "/", "" })
	public ModelAndView index() {
		initMV();
		String student_id = getStudentId();

		int pageNow = getPageNow();
		whereMap = new HashMap<String, Object>();
		whereMap.put("sid", Integer.parseInt(student_id));
		
		
		int totalCount = (int) recordService.selectAllCount(whereMap);
		
		Page page  = new Page(totalCount, pageNow);
		page.setPageSize(10);
		
		
		whereMap.put("startPos", page.getStartPos());
		whereMap.put("pageSize", page.getPageSize());
		List<Record> recordList = recordService.findAll(whereMap);
		
		modelAndView.addObject("page", page);
		modelAndView.addObject("recordList", recordList);
		modelAndView.addObject("user_action", "user");
		modelAndView.setViewName("user/index");
		return modelAndView;
	}
	
	//取消收藏
	@RequestMapping({ "/unrecord/{rid}" })
	public ModelAndView unrecord(@PathVariable("rid") Integer rid) {
		initMV();
		Record record = recordService.findById(rid);
		String student_id = getStudentId();
		whereMap = new HashMap<String, Object>();
		whereMap.put("id", rid);
		whereMap.put("sid", Integer.parseInt(student_id));
		int result = recordService.deleteByMap(whereMap);
		if (result>0) {
			//删除视频查看记录
			whereMap = new HashMap<String, Object>();
			whereMap.put("v_cid", record.getCid());
			whereMap.put("sid", Integer.parseInt(student_id));
			vrecordService.deleteByMap(whereMap);
			
			return Msg("取消成功",ctxPath()+"user");
		} else {
			return Msg("取消失败");
		}
	}

	// 收藏
	@RequestMapping({ "/collect" })
	public ModelAndView collect() {
		initMV();
		String student_id = getStudentId();

		int pageNow = getPageNow();
		whereMap = new HashMap<String, Object>();
		whereMap.put("sid", Integer.parseInt(student_id));
		int totalCount = collectService.selectAllCount(whereMap);
		
		Page page  = new Page(totalCount, pageNow);
		page.setPageSize(6);
		
		
		whereMap.put("startPos", page.getStartPos());
		whereMap.put("pageSize", page.getPageSize());
		List<Collect> collectList = collectService.findAll(whereMap);
		
		modelAndView.addObject("page", page);
		modelAndView.addObject("collectList", collectList);
		modelAndView.addObject("user_action", "collect");
		modelAndView.setViewName("user/collect");
		return modelAndView;
	}
	
	//取消收藏
	@RequestMapping({ "/uncollect/{coid}" })
	public ModelAndView uncollect(@PathVariable("coid") Integer coid) {
		initMV();
		String student_id = getStudentId();
		whereMap = new HashMap<String, Object>();
		whereMap.put("id", coid);
		whereMap.put("sid", Integer.parseInt(student_id));
		int result = collectService.deleteByMap(whereMap);
		if (result>0) {
			return Msg("取消成功",ctxPath()+"user/collect");
		} else {
			return Msg("取消失败");
		}
	}

	// 评论
	@RequestMapping({ "/comments" })
	public ModelAndView comments() {
		initMV();
		
		String student_id = getStudentId();

		int pageNow = getPageNow();
		whereMap = new HashMap<String, Object>();
		whereMap.put("sid", Integer.parseInt(student_id));
		int totalCount = commentService.selectAllCount(whereMap);
		
		Page page  = new Page(totalCount, pageNow);
		page.setPageSize(10);
		
		
		whereMap.put("startPos", page.getStartPos());
		whereMap.put("pageSize", page.getPageSize());
		List<Comment> commentList = commentService.findAll(whereMap);
		
		modelAndView.addObject("page", page);
		modelAndView.addObject("commentList", commentList);
		
		modelAndView.addObject("user_action", "comments");
		modelAndView.setViewName("user/comments");
		return modelAndView;
	}

	//基本信息
	@RequestMapping({ "/info" })
	public ModelAndView info() {
		initMV();
		Student student = studentService.findById(Integer.parseInt(getStudentId()));
		
		modelAndView.addObject("student", student);
		modelAndView.addObject("user_action", "info");
		modelAndView.setViewName("user/info");
		return modelAndView;
	}
	
	//基本信息
	@RequestMapping({ "/updateInfo" })
	public ModelAndView updateInfo(Student student) {
		initMV();
		student.setId(Integer.parseInt(getStudentId()));
		int result = studentService.updateByPrimaryKeySelective(student);
		
		if (result>0) {
			return Msg("修改成功",ctxPath()+"user/info");
		} else {
			return Msg("修改失败");
		}
	}
	
	//头像
	@RequestMapping({ "/thumb" })
	public ModelAndView thumb() {
		initMV();
		modelAndView.addObject("user_action", "thumb");
		modelAndView.setViewName("user/thumb");
		return modelAndView;
	}
	
	@RequestMapping({ "/updateThumb" })
	@ResponseBody
	public AjaxReturn updateThumb(String thumb) {
		initMV();
		AjaxReturn ajax = new AjaxReturn();
		Student student = new Student();
		student.setId(Integer.parseInt(getStudentId()));
		student.setThumb(thumb);
		int result = studentService.updateByPrimaryKeySelective(student);
		if (result>0) {
			ajax.setStatus(1);
			request.getSession().setAttribute("student_thumb",thumb);
			ajax.setMsg("修改成功");
		} else {
			ajax.setMsg("修改失败");
		}
		
		return ajax;
	}
	
	
	
	//安全设置
	@RequestMapping({ "/pwd" })
	public ModelAndView pwd(String oldPwd,String pwd1,String pwd2) {
		initMV();
		
		String submit = request.getParameter("submit");
		
		if (submit!=null) {
			if (StringUtil.isEmpty(oldPwd) || StringUtil.isEmpty(pwd1) || StringUtil.isEmpty(pwd2)) {
				return Msg("密码不能为空");
			} else if(!pwd1.equals(pwd2)) {
				return Msg("新密码与确认密码不一致");
			}else if(pwd1.length()>16) {
				return Msg("密码要小于16位字符");
			}
			
			Student student = studentService.findById(Integer.parseInt(getStudentId()));
			
			oldPwd = MD5Util.string2MD5(oldPwd);
			if (!(student.getPassword()).equals(oldPwd)) {
				return Msg("旧密码不对");
			}
			
			pwd1 = MD5Util.string2MD5(pwd1);
			student.setPassword(pwd1);
			int result = studentService.updateByPrimaryKeySelective(student);
			if (result>0) {
				return Msg("修改成功",ctxPath()+"logout");
			} else {
				return Msg("修改失败");
			}
		}else{
			modelAndView.addObject("user_action", "pwd");
			modelAndView.setViewName("user/pwd");
			return modelAndView;
		}
		
		
		
	}

}
