package com.vcourse.mapper;

import java.util.List;
import java.util.Map;

import com.vcourse.po.Vrecord;

public interface VrecordMapper {

	int deleteByPrimaryKey(Integer id);

	int insert(Vrecord record);

	int insertSelective(Vrecord record);

	Vrecord selectByPrimaryKey(Integer id);

	int updateByPrimaryKeySelective(Vrecord record);

	int updateByPrimaryKey(Vrecord record);

	List<Vrecord> selectAll(Map map);

	int selectAllCount(Map map);

	void deleteByMap(Map map);
}