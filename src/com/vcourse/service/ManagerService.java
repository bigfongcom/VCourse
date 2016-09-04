package com.vcourse.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.vcourse.mapper.ManagerMapper;
import com.vcourse.po.Manager;

@Service("managerService")
public class ManagerService {
	@Resource(name = "managerMapper")
	private ManagerMapper managerMapper;

/*	public void save(Manager manager) {
		// TODO Auto-generated method stub
		managerMapper.save(manager);
	}

	

	
	*/
	

	public List<Manager> findAll() {
		return managerMapper.selectAll();
	}
	
	public Manager findById(int id) {
		return managerMapper.selectByPrimaryKey(id);
	}
	
	public Manager findByName(String name) {
		return managerMapper.findByName(name);
	}
	
	public int updateByPrimaryKeySelective(Manager manager) {
		return managerMapper.updateByPrimaryKeySelective(manager);
	}

	public int insert(Manager manager) {
		return managerMapper.insert(manager);
	}
	
	public int delete(int id) {
		return managerMapper.deleteByPrimaryKey(id);
	}

	public int selectAllCount(Map map) {
		return managerMapper.selectAllCount(map);
	}

	public int updateStart(Map map) {
		return managerMapper.updateStart(map);
	}

	public Manager findTeacherStart() {
		return managerMapper.findTeacherStart();
	}


}