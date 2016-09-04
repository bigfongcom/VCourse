package com.vcourse.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.vcourse.mapper.VideoMapper;
import com.vcourse.po.Video;


@Service("videoService")
public class VideoService {
	@Resource(name = "videoMapper")
	private VideoMapper videoMapper;
	
	public int insert(Video video) {
		return videoMapper.insert(video);
	}
	
	public Video findById(int id) {
		return videoMapper.selectByPrimaryKey(id);
	}
	
	public List<Video> findByCid(Integer cid) {
		return videoMapper.selectByCid(cid);
	}

	public int delete(Integer id) {
		return videoMapper.deleteByPrimaryKey(id);
	}

	public int deleteByCid(Integer id) {
		return videoMapper.deleteByCid(id);
	}

	public int update(Video video) {
		return videoMapper.updateByPrimaryKey(video);
	}

	public void clickAdd(Integer id) {
		videoMapper.clickAdd(id);
	}
	
	/*public List<Video> findAll() {
		return videoMapper.selectAll();
	}*/
	
	/*
	
	
	public Manager findByName(String name) {
		return managerMapper.findByName(name);
	}
	
	public int updateByPrimaryKeySelective(Manager manager) {
		return managerMapper.updateByPrimaryKeySelective(manager);
	}

	
	
	public int delete(int id) {
		return managerMapper.deleteByPrimaryKey(id);
	}*/

}