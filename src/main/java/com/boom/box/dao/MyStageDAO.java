package com.boom.box.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;

import com.boom.box.vo.MembershipVO;
import com.boom.box.vo.MyStageVO;

@Repository
public class MyStageDAO {
	@Autowired
	private SqlSession session;


	public MyStageVO selectMyStageone(int id) {

		MyStageVO vo= null;



		try {
			MyStageMapper mapper = session.getMapper(MyStageMapper.class);
			vo = mapper.selectMyStageone(id);
		}catch (Exception e) {
			e.printStackTrace();
		}

		return vo;
	}

	public int insertStage(int userId) {
		int count= 0;
		try {
			MyStageMapper mapper = session.getMapper(MyStageMapper.class);
			count = mapper.insertStage(userId);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}
	
	public int updateStage(MyStageVO vo) {
		int cnt= 0;



		try {
			MyStageMapper mapper = session.getMapper(MyStageMapper.class);
			cnt = mapper.updateStage(vo);
		}catch (Exception e) {
			e.printStackTrace();
		}

		return cnt;
	}


	public ArrayList<HashMap<String, Object>> selectVideoListMystage(int id){
		ArrayList<HashMap<String, Object>> list = null;
		try {
			MyStageMapper mapper = session.getMapper(MyStageMapper.class);
			list = mapper.selectVideoListMystage(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}











}
