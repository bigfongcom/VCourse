package com.vcourse.controller.admin;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.google.common.base.Function;
import com.vcourse.po.Manager;
import com.vcourse.service.ManagerService;
import com.vcourse.util.MD5Util;
import com.vcourse.util.StringUtil;

@Controller
@Scope("prototype")
@RequestMapping("/admin/manager")
public class ManagerController extends BaseController {

	@Autowired
	private ManagerService managerService;

	// 个人信息
	@RequestMapping("/profile")
	public ModelAndView profile() {
		initMV();
		int manager_id = (Integer) request.getSession().getAttribute(
				"manager_id");
		modelAndView.addObject("manager", managerService.findById(manager_id));
		return modelAndView;
	}

	// 编辑个人信息
	@RequestMapping("/profile-save")
	public ModelAndView profileSave(Manager manager) {
		initMV();
		int manager_id = (Integer) request.getSession().getAttribute(
				"manager_id");
		manager.setId(manager_id);
		if (!StringUtil.isEmpty(manager.getPassword())) {
			manager.setPassword(MD5Util.string2MD5(manager.getPassword()));
		}

		// e10adc3949ba59abbe56e057f20f883e
		int result = managerService.updateByPrimaryKeySelective(manager);
		if (result > 0) {
			// 更新session
			Manager u = managerService.findById(manager_id);
			request.getSession().setAttribute("manager_username",
					u.getUsername());
			request.getSession().setAttribute("manager_nickname",
					u.getNickname());
			request.getSession().setAttribute("manager_email", u.getEmail());
			request.getSession().setAttribute("manager_thumb", u.getThumb());
			request.getSession().setAttribute("manager_role", u.getRole());
			return Msg("修改成功", ctxPath() + "admin/manager/profile");
		} else {
			return Msg("修改失败");
		}
	}

	// 添加
	@RequestMapping("/add")
	public ModelAndView add() {
		initMV();
		return modelAndView;
	}

	// 执行添加
	@RequestMapping("/doadd")
	public ModelAndView doadd(Manager manager) {
		initMV();
		if (StringUtil.isEmpty(manager.getUsername())) {
			return Msg("用户名不能为空");
		} else if (StringUtil.isEmpty(manager.getNickname())) {
			return Msg("昵称不能为空");
		} else if (StringUtil.isEmpty(manager.getPassword())) {
			return Msg("密码不能为空");
		} else if (manager.getRole() <= 0) {
			return Msg("请选择角色");
		} else if (StringUtil.isEmpty(manager.getThumb())) {
			return Msg("头像不能为空");
		}

		manager.setPassword(MD5Util.string2MD5(manager.getPassword()));

		int result = managerService.insert(manager);
		System.err.println(result);
		if (result > 0) {
			return Msg("添加成功", ctxPath() + "admin/manager/list");
		} else {
			return Msg("添加失败");
		}
	}

	// 列表
	@RequestMapping("/list")
	public ModelAndView list() {
		initMV();
		List<Manager> manangerList = managerService.findAll();
		modelAndView.addObject("manangerList", manangerList);
		return modelAndView;
	}

	// 删除
	@RequestMapping("/del")
	public ModelAndView del(Integer id) {
		initMV();
		if (id == 1) {
			return Msg("超级管理员不允许删除");
		} else if (id <= 0) {
			return Msg("参数有误");
		}
		int result = managerService.delete(id);
		if (result > 0) {
			return Msg("删除成功", ctxPath() + "admin/manager/list");
		} else {
			return Msg("删除失败");
		}
	}

	// 修改
	@RequestMapping("/edit")
	public ModelAndView edit(Integer id) {
		initMV();
		modelAndView.addObject("manager", managerService.findById(id));
		return modelAndView;
	}

	// 编辑个人信息
	@RequestMapping("/doedit")
	public ModelAndView doedit(Manager manager) {
		initMV();
		if (!StringUtil.isEmpty(manager.getPassword())) {
			manager.setPassword(MD5Util.string2MD5(manager.getPassword()));
		}

		int result = managerService.updateByPrimaryKeySelective(manager);
		if (result > 0) {
			int manager_id = (Integer) request.getSession().getAttribute(
					"manager_id");
			if (manager.getId() == manager_id) {
				// 更新session
				Manager u = managerService.findById(manager.getId());
				request.getSession().setAttribute("manager_username",
						u.getUsername());
				request.getSession().setAttribute("manager_nickname",
						u.getNickname());
				request.getSession()
						.setAttribute("manager_email", u.getEmail());
				request.getSession()
						.setAttribute("manager_thumb", u.getThumb());
				request.getSession().setAttribute("manager_role", u.getRole());
			}
			return Msg("修改成功", ctxPath() + "admin/manager/list");
		} else {
			return Msg("修改失败");
		}
	}
	
	@RequestMapping("/setstart/{mid}")
	public ModelAndView  setStart(@PathVariable("mid") Integer mid){
		Manager manager = managerService.findById(mid);
		
		if (manager.getRole()!=2) {
			return Msg("仅能推荐讲师");
		}
		
		//取消
		whereMap = new HashMap<String, Object>();
		whereMap.put("isStart", 0);
		int result = managerService.updateStart(whereMap);
		if (result > 0) {
			whereMap = new HashMap<String, Object>();
			whereMap.put("isStart", 1);
			whereMap.put("id", mid);
			int result2 = managerService.updateStart(whereMap);
			
			if (result2 > 0) {
				return Msg("推荐名师成功", ctxPath() + "admin/manager/list");
			} 
		}
		return Msg("推荐失败");
	}
	
	@RequestMapping("/unstart/{mid}")
	public ModelAndView  unstart(@PathVariable("mid") Integer mid){
		//取消
		whereMap = new HashMap<String, Object>();
		whereMap.put("isStart", 0);
		whereMap.put("id", mid);
		int result = managerService.updateStart(whereMap);
		if (result > 0) {
			return Msg("修改成功", ctxPath() + "admin/manager/list");
		}
		return Msg("修改败");
	}
}
