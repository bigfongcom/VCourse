package com.vcourse.mapper;

import java.util.List;
import java.util.Map;

import com.vcourse.po.Comment;

public interface CommentMapper {

    int deleteByPrimaryKey(Integer id);

    int insert(Comment comment);

    int insertSelective(Comment comment);

    Comment selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Comment comment);

    int updateByPrimaryKey(Comment comment);
    
    List<Comment> selectAll(Map map);

	int selectAllCount(Map map);

	void deleteBySid(Integer id);

	int deleteByMap(Map map);
}