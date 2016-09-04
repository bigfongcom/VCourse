package com.vcourse.mapper;

import java.util.List;
import java.util.Map;

import com.vcourse.po.Collect;

public interface CollectMapper {

	int deleteByPrimaryKey(Integer id);

	int insert(Collect record);

	int insertSelective(Collect record);

	Collect selectByPrimaryKey(Integer id);

	int updateByPrimaryKeySelective(Collect record);

	int updateByPrimaryKey(Collect record);

	List<Collect> selectAll(Map map);

	int selectAllCount(Map map);

	int deleteByMap(Map map);
}