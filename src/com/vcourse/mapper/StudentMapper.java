package com.vcourse.mapper;

import java.util.List;
import java.util.Map;

import com.vcourse.po.Student;

public interface StudentMapper {


    int deleteByPrimaryKey(Integer id);

    int insert(Student record);

    int insertSelective(Student record);

    Student selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Student record);

    int updateByPrimaryKey(Student record);
    
    List<Student> selectAll(Map map);
    
    Student findByName(String name);

	int selectAllCount(Map map);
}