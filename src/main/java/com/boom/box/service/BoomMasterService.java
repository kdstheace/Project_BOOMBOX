package com.boom.box.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boom.box.dao.BoomMasterDAO;
import com.boom.box.dao.VideoDAO;
import com.boom.box.vo.BoomMasterVO;
import com.boom.box.vo.VideoVO;

@Service
public class BoomMasterService {
	private static final Logger logger = LoggerFactory.getLogger(BoomMasterService.class);

	@Autowired
	private BoomMasterDAO dao;

	
	@Autowired
	private VideoDAO videoDAO;


	public ArrayList<HashMap<String, Object>> selectBoomMasterApplyList() {
		ArrayList<HashMap<String, Object>> list = dao.selectBoomMasterApplyList();
		return list;
	}

	public int insertBoomMaster(BoomMasterVO boomMaster) {
		logger.info("붐마등록, 서비스로 데이터 받아서 서비스 동작 시작");
		int count = dao.insertBoomMaster(boomMaster);
		return count;
	}

	public void changeBoomMaster(BoomMasterVO boomMaster) {
		if (boomMaster.getBoommaster_confirm() == 0) {
			boomMaster.setBoommaster_confirm(1);
		} else {
			boomMaster.setBoommaster_confirm(0);
		}
		dao.changeBoomMaster(boomMaster);
	}
	
	
	
	

	public BoomMasterVO selectBoomasterOne(int id) {
	return dao.selectBoomasterOne(id);
	}

	public VideoVO selectVideoClass(int video_id) {
	return videoDAO.selectVideoClass(video_id);
	}
	
	public int deleteBoomMaster(int boomMaster_User_Id) {
		logger.info("붐마삭제, 서비스로 데이터 받아서 서비스 동작 시작");
		int count = dao.deleteBoomMasterOne(boomMaster_User_Id);
		return count;
	}
}
