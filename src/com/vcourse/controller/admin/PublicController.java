package com.vcourse.controller.admin;

import java.io.File;
import java.util.Date;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.vcourse.po.AjaxReturn;
import com.vcourse.po.Manager;
import com.vcourse.service.ManagerService;
import com.vcourse.util.MD5Util;
import com.vcourse.util.StringUtil;

@Controller
@Scope("prototype")
public class PublicController extends BaseController {
	private final Log log = LogFactory.getLog(this.getClass());

	@Autowired
	private ManagerService managerService;

	@RequestMapping({ "/sys/", "/sys/login",""})
	public String login() {
		Object manager_id = request.getSession().getAttribute("manager_id");
		if (manager_id != null) {
			return redirect("/admin/index");
		}
		return "admin/login";

	}

	@RequestMapping("/sys/dologin")
	@ResponseBody
	public AjaxReturn dologin(Manager manager) {

		AjaxReturn ajax = new AjaxReturn();
		Object manager_id = request.getSession().getAttribute("manager_id");

		if (manager_id != null) {
			ajax.setStatus(1);
			ajax.setMsg("您已登陆");
		} else if (StringUtil.isEmpty(manager.getUsername())) {
			ajax.setMsg("用户名不能为空");

		} else if (StringUtil.isEmpty(manager.getPassword())) {
			ajax.setMsg("密码不能为空");
		} else {
			Manager u = managerService.findByName(manager.getUsername());
			String pasword = MD5Util.string2MD5(manager.getPassword());
			if (u == null || !u.getPassword().equals(pasword)) {
				ajax.setMsg("用户名或密码错误");
			} else {
				request.getSession().setAttribute("manager_id", u.getId());
				request.getSession().setAttribute("manager_username",
						u.getUsername());
				request.getSession().setAttribute("manager_nickname",u.getNickname());
				request.getSession()
						.setAttribute("manager_email", u.getEmail());
				request.getSession()
						.setAttribute("manager_thumb", u.getThumb());
				request.getSession().setAttribute("manager_role", u.getRole());
				ajax.setStatus(1);
				ajax.setMsg("登陆成功");
			}
		}

		return ajax;

	}

	@RequestMapping("/sys/logout")
	public String logout() {
		HttpSession session = request.getSession();
		session.setAttribute("manager_id", null);
		session.setAttribute("manager_username", null);
		session.setAttribute("manager_email", null);
		session.setAttribute("manager_role", null);
		session.setAttribute("manager_role", null);
		request.getSession().setAttribute("manager_nickname",null);
		return redirect("/sys/login");
	}

	// 图片上传
	@RequestMapping("/ajaxUpload")
	@ResponseBody
	public String ajaxUpload(HttpServletRequest req, MultipartFile file) {
		// AjaxReturn ajax = new AjaxReturn();
		JSONObject object = new JSONObject();
		System.out.println(file);
		if (file != null) {
			// 获取保存的路径，
			if (file.isEmpty()) {
				// ajax.setMsg("未选择文件");
				object.put("status", 0);
				object.put("msg", "未选择文件");
			} else {
				String fileFileName = file.getOriginalFilename();
				if (fileFileName.endsWith(".exe")) {
					object.put("status", 0);
					object.put("msg", "对不起,你上传的文件格式不允许!!!");
				} else {

					System.out.println("开始");
					String path = req.getSession().getServletContext().getRealPath("Uploads");
					//String fileName = (new Date().getTime()) + "-" + file.getOriginalFilename();
					
					 //重命名
					String fileName = UUID.randomUUID().toString()+ fileFileName.substring(fileFileName.lastIndexOf("."),fileFileName.length());
					File targetFile = new File(path, fileName);
					if (!targetFile.exists()) {
						targetFile.mkdirs();
					}

					// 保存
					try {
						file.transferTo(targetFile);
						// ajax.setStatus(1);
						// ajax.setMsg(fileName);
						System.out.println("文件上传成功:" + fileName);

						object.put("status", 1);
						object.put("msg", fileName);

					} catch (Exception e) {
						e.printStackTrace();
						System.out.println("文件上传失败");
						// ajax.setMsg("文件上传失败");

						object.put("status", 0);
						object.put("msg", "文件上传失败");
					}

				}
			}

		}

		//object.put("success", "false");
		return JSONObject.fromObject(object).toString();
	}
}
