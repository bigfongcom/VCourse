package com.vcourse.controller.web;

import java.sql.Timestamp;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.vcourse.po.Collect;
import com.vcourse.po.Comment;
import com.vcourse.po.Course;
import com.vcourse.po.Record;
import com.vcourse.po.Video;
import com.vcourse.po.Vrecord;
import com.vcourse.service.CollectService;
import com.vcourse.service.CommentService;
import com.vcourse.service.CourseService;
import com.vcourse.service.ManagerService;
import com.vcourse.service.RecordService;
import com.vcourse.service.StudentService;
import com.vcourse.service.VideoService;
import com.vcourse.service.VrecordService;
import com.vcourse.util.Page;
import com.vcourse.util.StringUtil;

@Controller
@Scope("prototype")
public class WebCourseController extends WebBaseController {
	@Autowired
	private StudentService studentService;

	@Autowired
	private VideoService videoService;

	@Autowired
	private ManagerService managerService;

	@Autowired
	private VrecordService vrecordService;

	@Autowired
	private RecordService recordService;

	@Autowired
	private CommentService commentService;

	@Autowired
	private CollectService collectService;

	@Autowired
	private CourseService courseService;

	private void getCourseList(String OrderBy) {
		
		String keywords = request.getParameter("keywords");
		
		int pageNow = getPageNow();
		Page page = null;
		List<Course> courseList = null;
		whereMap = new HashMap<String, Object>();
		
		if (keywords!=null) {
			keywords=keywords.trim();
			if(!StringUtil.isEmpty(keywords)){
				whereMap.put("title_search","%"+keywords+"%");
				modelAndView.addObject("pageAddparam", "&keywords="+keywords);
			}
		}
		
		int totalCount = (int) courseService.findAllCount(whereMap);

		page = new Page(totalCount, pageNow);
		page.setPageSize(10);

		whereMap.put("startPos", page.getStartPos());
		whereMap.put("pageSize", page.getPageSize());

		modelAndView.addObject("page", page);

		whereMap.put("order_by", OrderBy);
		courseList = courseService.findAll(whereMap);
		modelAndView.addObject("courseList", courseList);
	}

	@RequestMapping("/all")
	public ModelAndView index() {
		initMV();
		getCourseList("course_id_asc");
		modelAndView.addObject("course_action", "all");
		modelAndView.setViewName("course");
		return modelAndView;
	}

	@RequestMapping("/hot")
	public ModelAndView hot() {
		initMV();
		getCourseList("course_click_desc");
		modelAndView.addObject("course_action", "hot");
		modelAndView.setViewName("course");
		return modelAndView;
	}

	@RequestMapping("/new")
	public ModelAndView newList() {
		initMV();
		getCourseList(null);
		modelAndView.setViewName("course");
		modelAndView.addObject("course_action", "new");
		return modelAndView;
	}

	// 课程详情
	@RequestMapping("/course/{id}")
	public ModelAndView detail(@PathVariable("id") Integer id) {
		initMV();
		Course course = courseService.findById(id);

		// 点击量加1
		courseService.clickAdd(id);

		// 课程视频
		List<Video> videoList = videoService.findByCid(id);

		// 判断有学员人数
		whereMap = new HashMap<>();
		whereMap.put("cid", id);
		int recordCount = recordService.selectAllCount(whereMap);

		// 判断收藏量
		whereMap = new HashMap<>();
		whereMap.put("cid", id);
		int collecCount = collectService.selectAllCount(whereMap);

		String student_id = getStudentId();
		if (student_id != null) {
			// 判断是否加入了学习
			whereMap = new HashMap<>();
			whereMap.put("cid", id);
			whereMap.put("sid", student_id);
			int hasAdd = recordService.selectAllCount(whereMap);
			modelAndView.addObject("hasAdd", hasAdd);

			// 判断是否已加入收藏
			whereMap = new HashMap<>();
			whereMap.put("cid", id);
			whereMap.put("sid", student_id);
			int hasCollect = collectService.selectAllCount(whereMap);
			modelAndView.addObject("hasCollect", hasCollect);
		}

		// 查找最新学员
		whereMap = new HashMap<>();
		whereMap.put("cid", id);
		whereMap.put("startPos", 0);
		whereMap.put("pageSize", 12);
		List<Record> newStudents = recordService.findAll(whereMap);
		
		//评论列表
		whereMap = new HashMap<>();
		whereMap.put("cid", id);
		List<Comment> commentList = commentService.findAll(whereMap);

		modelAndView.addObject("course", course);
		modelAndView.addObject("videoList", videoList);
		modelAndView.addObject("teacher",
				managerService.findById(course.getMid()));
		modelAndView.addObject("recordCount", recordCount);
		modelAndView.addObject("collecCount", collecCount);
		modelAndView.addObject("newStudents", newStudents);
		modelAndView.addObject("commentList", commentList);
		modelAndView.setViewName("course_detail");
		return modelAndView;
	}

	// 加入课程详情
	@RequestMapping("/join/{id}")
	public ModelAndView join(@PathVariable("id") Integer id) {
		initMV();
		Course course = courseService.findById(id);

		if (course == null) {
			return Msg("课程名称不存在");
		}

		// 判断是否加入了学习
		String student_id = getStudentId();
		if (student_id != null) {
			whereMap = new HashMap<>();
			whereMap.put("cid", id);
			whereMap.put("sid", student_id);
			int hasAdd = recordService.selectAllCount(whereMap);
			// 还没加入
			if (hasAdd == 0) {
				Record record = new Record();
				record.setCid(id);
				record.setSid(Integer.parseInt(student_id));
				record.setCreateTime(new Timestamp((new Date()).getTime()));
				int result = recordService.insert(record);
				if (result > 0) {
					return Msg("加入成功", ctxPath() + "course/" + id);
				} else {
					return Msg("加入失败");
				}

			} else {
				return Msg("不能多次加入");
			}

		} else {
			return Msg("请先登陆", ctxPath() + "login");
		}

	}

	// 收藏课程
	@RequestMapping("/collect/{id}")
	public ModelAndView collect(@PathVariable("id") Integer id) {
		initMV();
		Course course = courseService.findById(id);

		if (course == null) {
			return Msg("课程名称不存在");
		}

		// 判断是否加入了
		String student_id = getStudentId();
		if (student_id != null) {
			whereMap = new HashMap<>();
			whereMap.put("cid", id);
			whereMap.put("sid", student_id);
			int hasAdd = collectService.selectAllCount(whereMap);
			// 还没加入
			if (hasAdd == 0) {
				Collect collect = new Collect();
				collect.setCid(id);
				collect.setSid(Integer.parseInt(student_id));
				collect.setCreateTime(new Timestamp((new Date()).getTime()));

				int result = collectService.insert(collect);
				if (result > 0) {
					return Msg("收藏成功", ctxPath() + "course/" + id);
				} else {
					return Msg("收藏失败");
				}

			} else {
				return Msg("不能多次收藏");
			}

		} else {
			return Msg("请先登陆", ctxPath() + "login");
		}

	}

	// 发表评论
	@RequestMapping("/comment/{id}")
	public ModelAndView comment(@PathVariable("id") Integer id,String qustion) {
		initMV();
		Course course = courseService.findById(id);

		if (course == null) {
			return Msg("课程名称不存在");
		}

		String student_id = getStudentId();
		if (student_id != null) {
			Comment comment = new Comment();
			comment.setCourseid(id);
			comment.setSid(Integer.parseInt(student_id));
			comment.setQustion(qustion);
			comment.setQustionTime(new Timestamp((new Date()).getTime()));

			int result = commentService.insert(comment);
			if (result > 0) {
				return Msg("发表成功", ctxPath() + "course/" + id);
			} else {
				return Msg("发表失败");
			}

		} else {
			return Msg("请先登陆", ctxPath() + "login");
		}

	}

	@RequestMapping("/video/{id}")
	public ModelAndView video(@PathVariable("id") Integer id) {
		initMV();

		String student_id = getStudentId();
		if (student_id == null) {
			return Msg("您还没有登陆，无法查看该视频");
		}
		Video video = videoService.findById(id);

		if (video == null) {
			return Msg("视频不存在");
		}
		
		whereMap = new HashMap<>();
		whereMap.put("cid", video.getCid());
		whereMap.put("sid", student_id);
		int hasAddRecord = recordService.selectAllCount(whereMap);
		
		if (hasAddRecord==0) {
			return Msg("请先把课程加入学习任务");
		}
		
		// 点击量加1
		videoService.clickAdd(id);

		// 课程信息
		Course course = courseService.findById(video.getCid());

		// 课程视频
		List<Video> videoList = videoService.findByCid(video.getCid());

		// 判断是否加入了视频记录，
		whereMap = new HashMap<>();
		whereMap.put("vid", id);
		whereMap.put("sid", student_id);
		int hasAdd = vrecordService.selectAllCount(whereMap);
		// 没有则添加
		if (hasAdd == 0) {
			Vrecord vrecord = new Vrecord();
			vrecord.setvCid(video.getCid());
			vrecord.setvId(video.getId());
			vrecord.setvSid(Integer.parseInt(student_id));
			vrecord.setvCreateTime(new Timestamp((new Date()).getTime()));
			vrecordService.insert(vrecord);
		}

		modelAndView.addObject("video", video);
		modelAndView.addObject("videoList", videoList);
		modelAndView.addObject("course", course);
		modelAndView.setViewName("course_video");
		return modelAndView;
	}

}
