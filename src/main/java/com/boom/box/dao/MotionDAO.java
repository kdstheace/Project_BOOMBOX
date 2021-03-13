package com.boom.box.dao;

import org.springframework.beans.factory.annotation.Autowired;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.boom.box.vo.MotionVO;

@Repository
public class MotionDAO {
	@Autowired
	private SqlSession session;
	
	public int insertMotion(MotionVO motion) {
		int count = 0;
		try {
			MotionMapper mapper = session.getMapper(MotionMapper.class);
			count = mapper.insertMotion(motion);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}
	
	public MotionVO selectMotionOne(MotionVO motion) {
		MotionVO vo = null;
		try {
			MotionMapper mapper = session.getMapper(MotionMapper.class);
			vo = mapper.selectMotionOne(motion);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return vo;
	}
	
	public MotionVO selectMotionOneByTitle(String motion_title) {
		MotionVO vo = null;
		try {
			MotionMapper mapper = session.getMapper(MotionMapper.class);
			vo = mapper.selectMotionOneByTitle(motion_title);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return vo;
	}
	
	public ArrayList<MotionVO> selectMotionListByClass(MotionVO motion){
		ArrayList<MotionVO> list = null;
		try {
			MotionMapper mapper = session.getMapper(MotionMapper.class);
			list = mapper.selectMotionListByClass(motion);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public MotionVO selectMotionOnePic(MotionVO vo) {
		MotionVO result = null;
		try {
			MotionMapper mapper = session.getMapper(MotionMapper.class);
			result = mapper.selectMotionOnePic(vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	
	}
}
