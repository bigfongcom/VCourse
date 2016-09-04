package com.vcourse.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.vcourse.mapper.CourseMapper;
import com.vcourse.po.Course;

@Service("courseService")
public class CourseService {
	@Resource(name = "courseMapper")
	private CourseMapper courseMapper;
	
	public int insert(Course course) {
		return courseMapper.insert(course);
	}
	
	public Course findById(int id) {
		return courseMapper.selectByPrimaryKey(id);
	}
	
	public int findAllCount(Map map) {
		return courseMapper.selectAllCount(map);
	}
	
	public List<Course> findAll(Map map) {
		return courseMapper.selectAll(map);
	}

	public int delete(Integer id) {
		return courseMapper.deleteByPrimaryKey(id);
	}

	public int update(Course course) {
		return courseMapper.updateByPrimaryKeySelective(course);
	}

	public void clickAdd(Integer id) {
		courseMapper.clickAdd(id);
	}
	
	
	
	
	/*
	
	
	public Manager findByName(String name) {
		return managerMapper.findByName(name);
	}
	
	public int updateByPrimaryKeySelective(Manager manager) {
		return managerMapper.updateByPrimaryKeySelective(manager);
	}

	
	
	public int delete(int id) {
		return managerMapper.deleteByPrimaryKey(id);
	}*/

}