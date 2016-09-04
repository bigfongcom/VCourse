package com.vcourse.mapper;

import java.util.List;
import java.util.Map;

import com.vcourse.po.Record;

public interface RecordMapper {

	int deleteByPrimaryKey(Integer id);

	int insert(Record record);

	int insertSelective(Record record);

	Record selectByPrimaryKey(Integer id);

	int updateByPrimaryKeySelective(Record record);

	int updateByPrimaryKey(Record record);

	List<Record> selectAll(Map map);
	
	int selectAllCount(Map map);

	int deleteByMap(Map map);
}