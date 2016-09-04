package com.vcourse.mapper;

import java.util.List;
import java.util.Map;

import com.vcourse.po.Course;

public interface CourseMapper {

    int insertSelective(Course record);

    int updateByPrimaryKeyWithBLOBs(Course record);

    int updateByPrimaryKey(Course record);
    
    int insert(Course record);
    
    Course selectByPrimaryKey(Integer id);
    
    int selectAllCount(Map map);
    
    List<Course> selectAll(Map map);
    
    int deleteByPrimaryKey(Integer id);
    
    int updateByPrimaryKeySelective(Course record);

	int clickAdd(Integer id);
}