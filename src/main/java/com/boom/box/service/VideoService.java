package com.boom.box.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.boom.box.controller.VideoViewController;
import com.boom.box.dao.VideoDAO;
import com.boom.box.vo.VideoVO;

import org.springframework.stereotype.Service;

@Service
public class VideoService {
	private static final Logger logger = LoggerFactory.getLogger(VideoService.class);
	@Autowired
	private VideoDAO dao;
	

	public int insertVideo(VideoVO video) {
		logger.info("서비스로 데이터 받아서 서비스 동작 시작");
		int count = 0;
		try {
			count = dao.insertVideo(video);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}
	
	public ArrayList<HashMap<String, Object>> selectVideoList(String searchText, int startRecord, int countPerPage){
		ArrayList<HashMap<String, Object>> list = dao.selectVideoList(searchText, startRecord, countPerPage);
		return list;
	}
	
	public ArrayList<HashMap<String, Object>> selectVideoListByLike(int startRecord, int countPerPage, int user_id){
		ArrayList<HashMap<String, Object>> list = dao.selectVideoListByLike(startRecord, countPerPage, user_id);
		return list;
	}
	
	public ArrayList<HashMap<String, Object>> selectVideoByFollow(int startRecord, int countPerPage, int follow_user_id){
		ArrayList<HashMap<String, Object>> list = dao.selectVideoByFollow(startRecord, countPerPage, follow_user_id);
		return list;
	}
	
	public VideoVO selectVideoById(int video_id) {
		VideoVO video = dao.selectVideoById(video_id);
		return video;
	}
	public HashMap<String, Object> selectVideoOne(int video_id){
		HashMap<String, Object> list = dao.selectVideoOne(video_id);
		return list;
	}
	public int selectVideoCount(String searchText) {
		int count = dao.selectVideoCount(searchText);
		return count;
	}

	public int deleteVideo(int video_id) {
		return dao.deleteVideo(video_id);

	}
	public void updateVideoHits(int video_id) {
		dao.updateVideoHits(video_id);
	}
	public int insertLike(VideoVO video) {
		return dao.insertLike(video);
	}
	public int countLike(int like_video_id) {
		return dao.countLike(like_video_id);
	}
	public boolean isLike(HashMap<String, Integer> map) {
		Integer count = dao.isLike(map);
		if(count != null) {
			return true;
		}else {
			return false;
		}
	}
	
	public int deleteLike(HashMap<String, Integer> map) {
		int count = dao.deleteLike(map);
		return count;
	}
	
	public ArrayList<HashMap<String, Object>> selectVideoByInterest(int user_id){
		ArrayList<HashMap<String, Object>> list = dao.selectVideoByInterest(user_id);
		return list;
	}
}
