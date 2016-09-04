package com.vcourse.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.vcourse.mapper.CollectMapper;
import com.vcourse.po.Collect;

@Service("collectService")
public class CollectService {
	@Resource(name = "collectMapper")
	private CollectMapper collectMapper;

	public int insert(Collect collect) {
		return collectMapper.insert(collect);
	}

	public Collect findById(int id) {
		return collectMapper.selectByPrimaryKey(id);
	}

	public List<Collect> findAll(Map map) {
		return collectMapper.selectAll(map);
	}

	public int selectAllCount(Map map) {
		return collectMapper.selectAllCount(map);
	}
	
	public List<Collect> selectAll(Map map) {
		return collectMapper.selectAll(map);
	}

	public int deleteByMap(Map Map) {
		return  collectMapper.deleteByMap(Map);
	}
}