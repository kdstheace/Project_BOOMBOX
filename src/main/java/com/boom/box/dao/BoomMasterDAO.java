package com.boom.box.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.boom.box.vo.BoomMasterVO;

@Repository
public class BoomMasterDAO {
	@Autowired
	private SqlSession session;
	private static final Logger logger = LoggerFactory.getLogger(BoomMasterDAO.class);

	public int insertBoomMaster(BoomMasterVO boomMaster) {
		logger.info("붐마스터 등록 다오까지 들어옴 ㅇㅇ");
		// 오토와이어드 안될 때 this.dao = null 로 뜬다.
		int count = 0;
		try {
			BoomMasterMapper mapper = session.getMapper(BoomMasterMapper.class);
			count = mapper.insertBoomMaster(boomMaster);

			logger.info("디비 들어갔다 막 나옴");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}
	
	
	public ArrayList<HashMap<String, Object>> selectBoomMasterApplyList() {
		ArrayList<HashMap<String, Object>> list = null;
		try {
			BoomMasterMapper mapper = session.getMapper(BoomMasterMapper.class);
			list = mapper.selectBoomMasterApplyList();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public void changeBoomMaster(BoomMasterVO boomMaster) {
		try {
			BoomMasterMapper mapper = session.getMapper(BoomMasterMapper.class);
			mapper.changeBoomMaster(boomMaster);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public BoomMasterVO selectBoomasterOne(int id) {

		BoomMasterVO vo = null;


		try {
			BoomMasterMapper mapper = session.getMapper(BoomMasterMapper.class);
			vo = mapper.selectBoomasterOne(id);
		}catch (Exception e) {
			e.printStackTrace();
		}

		return vo;
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
