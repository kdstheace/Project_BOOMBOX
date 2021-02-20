package com.boom.box.dao;

import org.springframework.beans.factory.annotation.Autowired;
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
	
	public MotionVO selectMotionOne(int motion_video_id) {
		MotionVO motion = null;
		try {
			MotionMapper mapper = session.getMapper(MotionMapper.class);
			motion = mapper.selectMotionOne(motion_video_id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return motion;
	}
	
}
