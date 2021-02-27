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


	public MyStageVO selectMyStageone(int id) {

		return dao.selectMyStageone(id);
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


}
