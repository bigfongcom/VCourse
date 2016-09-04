package com.vcourse.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.vcourse.mapper.VrecordMapper;
import com.vcourse.po.Vrecord;


@Service("vrecordService")
public class VrecordService {
	@Resource(name = "vrecordMapper")
	private VrecordMapper vrecordMapper;
	
	public int insert(Vrecord vrecord) {
		return vrecordMapper.insert(vrecord);
	}
	
	public Vrecord findById(int id) {
		return vrecordMapper.selectByPrimaryKey(id);
	}
	
	public List<Vrecord> findAll(Map map) {
		return vrecordMapper.selectAll(map);
	}
	
	public int selectAllCount(Map map) {
		return vrecordMapper.selectAllCount(map);
	}

	public void deleteByMap(Map  map) {
		vrecordMapper.deleteByMap(map);
	}

}