package com.vcourse.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Param;

import com.vcourse.po.Video;

public interface VideoMapper {


    int insert(Video record);

	List<Video> selectByCid(Integer cid);

	int deleteByPrimaryKey(Integer id);

	int deleteByCid(Integer cid);

	Video selectByPrimaryKey(int id);

	int updateByPrimaryKey(Video video);

	int clickAdd(Integer id);


}