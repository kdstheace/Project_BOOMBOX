package com.boom.box.dao;

import com.boom.box.vo.MotionVO;

public interface MotionMapper {
	public int insertMotion(MotionVO motion);
	public MotionVO selectMotionOne(int motion_video_id);
}
