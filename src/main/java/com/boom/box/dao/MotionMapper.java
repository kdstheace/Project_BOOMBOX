package com.boom.box.dao;

import java.util.ArrayList;

import com.boom.box.vo.MotionVO;

public interface MotionMapper {
	public int insertMotion(MotionVO motion);
	public MotionVO selectMotionOne(MotionVO motion);
	public MotionVO selectMotionOneByTitle(String motion_title);
	public ArrayList<MotionVO> selectMotionListByClass(MotionVO motion);
	public MotionVO selectMotionOnePic(MotionVO vo);
}
