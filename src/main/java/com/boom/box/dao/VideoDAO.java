package com.boom.box.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.boom.box.vo.VideoVO;

@Repository
public class VideoDAO {
	@Autowired
	private SqlSession session;
	private static final Logger logger = LoggerFactory.getLogger(VideoDAO.class);

	@Transactional(rollbackFor = {Exception.class})
	public int insertVideo(VideoVO video) throws Exception{
		logger.info("다오까지 들어왔음. 다오작동시작.");
		int count1 = 0;
		int count2 = 0;
		try {
			VideoMapper mapper = session.getMapper(VideoMapper.class);
			count1 = mapper.insertVideo(video);
			count2 = mapper.insertVideoInterest(video);
			logger.info("디비 들어갔다 막 나옴");
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception();
		}
		return count1;
	}
	
	public ArrayList<HashMap<String, Object>> selectVideoList(String searchText, int startRecord, int countPerPage){
		ArrayList<HashMap<String, Object>> list = null;
		RowBounds rb = new RowBounds(startRecord, countPerPage);
		try {
			VideoMapper mapper = session.getMapper(VideoMapper.class);
			list = mapper.selectVideoList(rb, searchText);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public VideoVO selectVideoById(int video_id) {
		VideoVO video = null;
		try {
			VideoMapper mapper = session.getMapper(VideoMapper.class);
			video = mapper.selectVideoById(video_id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return video;

	}
	public HashMap<String, Object> selectVideoOne(int video_id){
		HashMap<String, Object> list = null;
		try {
			VideoMapper mapper = session.getMapper(VideoMapper.class);
			list = mapper.selectVideoOne(video_id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public int selectVideoCount(String searchText) {
		int count = 0;
		try {
			VideoMapper mapper = session.getMapper(VideoMapper.class);
			count = mapper.selectVideoCount(searchText);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}
	
}
