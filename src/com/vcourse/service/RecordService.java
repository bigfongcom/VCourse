package com.vcourse.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.vcourse.mapper.RecordMapper;
import com.vcourse.po.Record;


@Service("recordService")
public class RecordService {
	@Resource(name = "recordMapper")
	private RecordMapper recordMapper;
	
	public int insert(Record record) {
		return recordMapper.insert(record);
	}
	
	public Record findById(int id) {
		return recordMapper.selectByPrimaryKey(id);
	}
	
	public List<Record> findAll(Map map) {
		return recordMapper.selectAll(map);
	}
	
	public int selectAllCount(Map map) {
		return recordMapper.selectAllCount(map);
	}

	public int deleteByMap(Map  map) {
		return recordMapper.deleteByMap(map);
	}

}