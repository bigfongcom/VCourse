package com.vcourse.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.vcourse.mapper.StudentMapper;
import com.vcourse.po.Student;

@Service("studentService")
public class StudentService {
	@Resource(name = "studentMapper")
	private StudentMapper studentMapper;

	public List<Student> findAll(Map map) {
		return studentMapper.selectAll(map);
	}
	
	public Student findById(int id) {
		return studentMapper.selectByPrimaryKey(id);
	}
	
	public Student findByName(String name) {
		return studentMapper.findByName(name);
	}
	
	public int updateByPrimaryKeySelective(Student student) {
		return studentMapper.updateByPrimaryKeySelective(student);
	}

	public int insert(Student student) {
		return studentMapper.insertSelective(student);
	}
	
	public int delete(int id) {
		return studentMapper.deleteByPrimaryKey(id);
	}

	public int selectAllCount(Map  whereMap) {
		return studentMapper.selectAllCount(whereMap);
	}

}