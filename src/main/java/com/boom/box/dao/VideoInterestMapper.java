package com.boom.box.dao;

import java.util.ArrayList;

import com.boom.box.vo.VideoInterestVO;

public interface VideoInterestMapper {

	public ArrayList<VideoInterestVO> selectVideoInterest(String user_id);
	public ArrayList<VideoInterestVO> selectVideoInterest2(String user_id);

}
