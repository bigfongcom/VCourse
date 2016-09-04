package com.vcourse.mapper;

import java.util.List;
import java.util.Map;

import com.vcourse.po.Manager;

public interface ManagerMapper {

    int deleteByPrimaryKey(Integer id);

    int insert(Manager record);

    int insertSelective(Manager record);
    
    List<Manager> selectAll();
    
    Manager selectByPrimaryKey(Integer id);
    
    Manager findByName(String name);

    int updateByPrimaryKeySelective(Manager record);

    int updateByPrimaryKey(Manager record);

	int selectAllCount(Map map);

	int updateStart(Map map);

	Manager Manager();

	Manager findTeacherStart();
}