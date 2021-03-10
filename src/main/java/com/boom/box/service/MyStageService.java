package com.boom.box.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boom.box.dao.MyStageDAO;
import com.boom.box.vo.MyStageVO;

@Service
public class MyStageService {

	@Autowired
	private MyStageDAO dao;


	public MyStageVO selectMyStageOne(int id) {

		return dao.selectMyStageOne(id);
	}

	public int updateStage(MyStageVO vo) {
		int count = 0;
		try {
			count = dao.updateStage(vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}

	
	public ArrayList<HashMap<String, Object>> selectVideoListMystage(int id){

		return dao.selectVideoListMystage(id);
	}
	
	public int deleteBanner(MyStageVO vo) {
		int count = 0;
		try {
			count = dao.deleteBanner(vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}


	public int deleteProfile(MyStageVO vo) {
		int count = 0;
		try {
			count = dao.deleteProfile(vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}
	public ArrayList<HashMap<String, Object>> selectMyStageReport(int id) {

		return dao.selectMyStageReport(id);
	}
	
	public int insertFollow(HashMap<String, Integer> map) {
		int count = dao.insertFollow(map);
		return count;
	}
	
	public int deleteFollow(HashMap<String, Integer> map) {
		int count = dao.deleteFollow(map);
		return count;
	}
	
	public boolean isFollow(HashMap<String, Integer> map) {
		Integer follow_id = dao.isFollow(map);
		if(follow_id != null) {
			return true;
		}else {
			return false;
		}
	}
	
	public int countFollow(int follow_stage_id) {
		int count = dao.countFollow(follow_stage_id);
		return count;
	}
	
	public int countFollowByVideoId(int video_id) {
		int count = dao.countFollowByVideoId(video_id);
		return count;
	}
	public ArrayList<Integer> selectFollowById(int follow_user_id){
		ArrayList<Integer> list = dao.selectFollowById(follow_user_id);
		return list;
	}
}
