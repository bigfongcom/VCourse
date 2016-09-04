package com.vcourse.controller.admin;

import java.sql.Timestamp;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.vcourse.po.Collect;
import com.vcourse.po.Comment;
import com.vcourse.po.Course;
import com.vcourse.po.Video;
import com.vcourse.service.CollectService;
import com.vcourse.service.CommentService;
import com.vcourse.service.CourseService;
import com.vcourse.service.RecordService;
import com.vcourse.service.VideoService;
import com.vcourse.service.VrecordService;
import com.vcourse.util.Page;
import com.vcourse.util.StringUtil;

@Controller
@Scope("prototype")
@RequestMapping("/admin/course")
public class CourseController extends BaseController {

	/*
	 * @Autowired private ManagerService managerService;
	 */

	@Autowired
	private CourseService courseService;

	@Autowired
	private VideoService videoService;

	@Autowired
	private CollectService collectService;

	@Autowired
	private CommentService commentService;
	
	@Autowired
	private VrecordService vrecordService;
	
	@Autowired
	private RecordService recordService;

	// 课程列表
	@RequestMapping("/list")
	public ModelAndView list() {
		initMV();
		
		String keywords = request.getParameter("keywords");
		System.out.println(keywords);
		int pageNow = getPageNow();
		Page page = null;
		List<Course> courseList = null;
		whereMap = new HashMap<String, Object>();
		whereMap.put("mid", isTeacher());
		
		if (keywords!=null) {
			keywords=keywords.trim();
			if(!StringUtil.isEmpty(keywords)){
				whereMap.put("title_search","%"+keywords+"%");
				modelAndView.addObject("pageAddparam", "&keywords="+keywords);
			}
		}
		
		System.out.println(whereMap);
		int totalCount = (int) courseService.findAllCount(whereMap);

		page = new Page(totalCount, pageNow);

		whereMap.put("startPos", page.getStartPos());
		whereMap.put("pageSize", page.getPageSize());

		modelAndView.addObject("page", page);

		courseList = courseService.findAll(whereMap);
		modelAndView.addObject("keywords", keywords);
		modelAndView.addObject("courseList", courseList);
		return modelAndView;
	}

	// 添加
	@RequestMapping("/add")
	public ModelAndView add() {
		initMV();
		return modelAndView;
	}

	// 执行添加
	@RequestMapping("/doadd")
	public ModelAndView doadd(Course course) {
		initMV();
		if (StringUtil.isEmpty(course.getTitle())) {
			return Msg("课程名称不能为空");
		} else if (StringUtil.isEmpty(course.getDescription())) {
			return Msg("简介不能为空");
		} else if (StringUtil.isEmpty(course.getThumb())) {
			return Msg("缩略图不能为空");
		}

		int manager_id = (Integer) request.getSession().getAttribute(
				"manager_id");
		course.setMid(manager_id);
		course.setCreateTime(new Timestamp((new Date()).getTime()));

		int result = courseService.insert(course);
		System.err.println(result);
		if (result > 0) {
			return Msg("添加成功", ctxPath() + "admin/course/list");
		} else {
			return Msg("添加失败");
		}
	}

	// 编辑
	@RequestMapping("/edit")
	public ModelAndView edit(Integer id) {
		initMV();
		Course course = courseService.findById(id);
		modelAndView.addObject("course", course);
		return modelAndView;
	}

	// 执行编辑
	@RequestMapping("/doEdit")
	public ModelAndView doEdit(Course course) {
		initMV();
		if (StringUtil.isEmpty(course.getTitle())) {
			return Msg("课程名称不能为空");
		} else if (StringUtil.isEmpty(course.getDescription())) {
			return Msg("简介不能为空");
		} else if (StringUtil.isEmpty(course.getThumb())) {
			return Msg("缩略图不能为空");
		}

		/*
		 * Course course2 = courseService.findById(course.getId());
		 * course.setMid(course2.getMid());
		 */
		course.setCreateTime(new Timestamp((new Date()).getTime()));

		int result = courseService.update(course);
		System.err.println(result);
		if (result > 0) {
			return Msg("编辑成功", ctxPath() + "admin/course/list");
		} else {
			return Msg("编辑失败");
		}
	}

	// 删除
	@RequestMapping("/del")
	public ModelAndView del(Integer id) {
		initMV();

		if (id <= 0) {
			return Msg("参数有误");
		}
		int result = courseService.delete(id);
		if (result > 0) {
			// 删除视频
			videoService.deleteByCid(id);
			
			whereMap = new HashMap<String, Object>();
			whereMap.put("cid", id);
			//删除课程记录
			recordService.deleteByMap(whereMap);
			//删除视频查看记录
			vrecordService.deleteByMap(whereMap);
			//删除评论
			commentService.deleteByMap(whereMap);
			//删除收藏
			collectService.deleteByMap(whereMap);
			
			return Msg("删除成功", ctxPath() + "admin/course/list");
		} else {
			return Msg("删除失败");
		}
	}

	// 视频列表
	@RequestMapping("/video-list")
	public ModelAndView videoList(Integer cid) {
		initMV();
		List<Video> videoList = videoService.findByCid(cid);
		modelAndView.addObject("videoList", videoList);
		modelAndView.addObject("cid", cid);
		return modelAndView;
	}

	@RequestMapping("/video-add")
	public ModelAndView videoAdd() {
		initMV();
		List<Course> courseList = courseService.findAll(whereMap);
		modelAndView.addObject("courseList", courseList);
		return modelAndView;
	}

	// 执行添加
	@RequestMapping("/doVideoAdd")
	public ModelAndView doVideoAdd(Video video) {
		initMV();
		if (StringUtil.isEmpty(video.getVtitle())) {
			return Msg("视频标题不能为空");
		} else if (StringUtil.isEmpty(video.getVdescription())) {
			return Msg("简介不能为空");
		} else if (StringUtil.isEmpty(video.getVpath())) {
			return Msg("请上传视频");
		}
		video.setVctime(new Timestamp((new Date()).getTime()));

		int result = videoService.insert(video);
		if (result > 0) {
			return Msg("添加成功", ctxPath() + "admin/course/video-list?cid="
					+ video.getCid());
		} else {
			return Msg("添加失败");
		}
	}

	@RequestMapping("/video-edit")
	public ModelAndView videoEdit(Integer id) {
		initMV();
		List<Course> courseList = courseService.findAll(whereMap);
		Video video = videoService.findById(id);
		modelAndView.addObject("video", video);
		modelAndView.addObject("courseList", courseList);
		return modelAndView;
	}

	// 删除

	@RequestMapping("/videoDel")
	public ModelAndView videoDel(Integer id) {
		initMV();
		
		if (id <= 0) {
			return Msg("参数有误");
		}

		Video video = videoService.findById(id);
		int result = videoService.delete(id);
		if (result > 0) {
			
			whereMap = new HashMap<String, Object>();
			whereMap.put("vid", id);
			//删除视频查看记录
			vrecordService.deleteByMap(whereMap);
			
			return Msg("删除成功", ctxPath() + "admin/course/video-list?cid="
					+ video.getCid());
		} else {
			return Msg("删除失败");
		}
	}

	// 执行编辑
	@RequestMapping("/doVideoEdit")
	public ModelAndView doVideoEdit(Video video) {
		initMV();
		if (video.getId() <= 0) {
			return Msg("非法操作");
		} else if (StringUtil.isEmpty(video.getVtitle())) {
			return Msg("视频标题不能为空");
		} else if (StringUtil.isEmpty(video.getVdescription())) {
			return Msg("简介不能为空");
		} else if (StringUtil.isEmpty(video.getVpath())) {
			return Msg("请上传视频");
		}
		video.setVctime(new Timestamp((new Date()).getTime()));

		int result = videoService.update(video);
		if (result > 0) {
			return Msg("编辑成功", ctxPath() + "admin/course/video-list?cid="
					+ video.getCid());
		} else {
			return Msg("编辑失败");
		}
	}

	// 收藏列表
	@RequestMapping("/collect/{cid}")
	public ModelAndView collect(@PathVariable("cid") Integer cid) {
		initMV();

		if (cid <= 0) {
			return Msg("参数有误");
		}

		int pageNow = getPageNow();
		whereMap = new HashMap<String, Object>();
		whereMap.put("cid", cid);
		int totalCount = collectService.selectAllCount(whereMap);

		Page page = new Page(totalCount, pageNow);
		page.setPageSize(10);

		whereMap.put("startPos", page.getStartPos());
		whereMap.put("pageSize", page.getPageSize());
		List<Collect> collectList = collectService.findAll(whereMap);

		modelAndView.addObject("cid", cid);
		modelAndView.addObject("page", page);
		modelAndView.addObject("collectList", collectList);
		modelAndView.setViewName("/admin/course/collect");
		return modelAndView;
	}

	// 评论列表
	@RequestMapping("/comment/{cid}")
	public ModelAndView comment(@PathVariable("cid") Integer cid) {
		initMV();
		
		if (cid <= 0) {
			return Msg("参数有误");
		}

		int pageNow = getPageNow();
		whereMap = new HashMap<String, Object>();
		whereMap.put("cid", cid);
		whereMap.put("mid", isTeacher());
		int totalCount = commentService.selectAllCount(whereMap);
		
		Page page  = new Page(totalCount, pageNow);
		page.setPageSize(10);
		
		
		whereMap.put("startPos", page.getStartPos());
		whereMap.put("pageSize", page.getPageSize());
		List<Comment> commentList = commentService.findAll(whereMap);
		
		modelAndView.addObject("page", page);
		modelAndView.addObject("commentList", commentList);
		modelAndView.setViewName("/admin/course/comment");
		return modelAndView;
	}
	
	//回复评论
	@RequestMapping("/comment-answer/{coid}")
	public ModelAndView commentSnswer(@PathVariable("coid") Integer coid,String answer) {
		initMV();
		
		if (coid <= 0) {
			return Msg("参数有误");
		}
		
		String submit = request.getParameter("sub");
		
		System.out.println("coid:"+coid);
		System.out.println("answer:"+answer);
		System.out.println("submit:"+submit);
		
		if (submit!=null) {
			int manager_id = (Integer) request.getSession().getAttribute(
					"manager_id");
			Comment comment = new Comment();
			comment.setId(coid);
			comment.setMid(manager_id);
			comment.setAnswer(answer);
			comment.setAnswerTime(new Timestamp((new Date()).getTime()));
			int result = commentService.update(comment);
			
			if (result > 0) {
				comment = commentService.findById(coid);
				return Msg("回复成功", ctxPath() + "admin/course/comment/"
						+ comment.getCourseid());
			} else {
				return Msg("回复失败");
			}
			
		} else {
			Comment comment = commentService.findById(coid);
			modelAndView.addObject("comment", comment);
			modelAndView.setViewName("/admin/course/comment-answer");
			return modelAndView;
		}
		
		
	}
	
	//回复评论
		@RequestMapping("/comment-del/{coid}")
		public ModelAndView commentDel(@PathVariable("coid") Integer coid) {
			initMV();
			
			if (coid <= 0) {
				return Msg("参数有误");
			}
			
			Comment comment = commentService.findById(coid);
			int cid = comment.getCourseid();
			
			whereMap = new HashMap<String, Object>();
			whereMap.put("id", coid);
			
			int result = commentService.deleteByMap(whereMap);
			
			if (result > 0) {
				return Msg("删除成功", ctxPath() + "admin/course/comment/"
						+ cid);
			} else {
				return Msg("删除失败");
			}
				
			
		}
}
