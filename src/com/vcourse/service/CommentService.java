package com.vcourse.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.vcourse.mapper.CommentMapper;
import com.vcourse.mapper.VrecordMapper;
import com.vcourse.po.Comment;
import com.vcourse.po.Vrecord;


@Service("commentService")
public class CommentService {
	@Resource(name = "commentMapper")
	private CommentMapper commentMapper;

	public int insert(Comment comment) {
		return commentMapper.insert(comment);
	}

	public List<Comment> findAll(Map map) {
		return commentMapper.selectAll(map);
	}

	public int selectAllCount(Map map) {
		return commentMapper.selectAllCount(map);
	}

	public Comment findById(Integer id) {
		return commentMapper.selectByPrimaryKey(id);
	}

	public int update(Comment comment) {
		return commentMapper.updateByPrimaryKeySelective(comment);
	}

	public int deleteByMap(Map Map) {
		return commentMapper.deleteByMap(Map);
	}
	

}