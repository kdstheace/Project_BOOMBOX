package com.boom.box.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.boom.box.dao.BoomMasterDAO;
import com.boom.box.vo.BoomMasterVO;

@Service
public class BoomMasterService {
	private static final Logger logger = LoggerFactory.getLogger(BoomMasterService.class);

	private BoomMasterDAO dao;

	public ArrayList<HashMap<String, Object>> selectBoomMasterList() {
		ArrayList<HashMap<String, Object>> list = dao.selectBoomMasterList();
		return list;
	}

	public String bmApply() {
		// TODO Auto-generated method stub
		return null;
	}
	
	public int insertBoomMaster(BoomMasterVO boomMaster) {
		logger.info("붐마등록, 서비스로 데이터 받아서 서비스 동작 시작");
		int count = 0;
		try {
			count = dao.insertBoomMaster(boomMaster);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}
}
