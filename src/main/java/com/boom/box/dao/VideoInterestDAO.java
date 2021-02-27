package com.boom.box.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.boom.box.vo.UserInterestVO;
import com.boom.box.vo.VideoInterestVO;

@Repository
public class VideoInterestDAO {

	@Autowired
	private SqlSession session;

	public ArrayList<VideoInterestVO> selectVideoInterest(String user_id) {
		ArrayList<VideoInterestVO> list = null;

		try {
			VideoInterestMapper mapper = session.getMapper(VideoInterestMapper.class);
			list = mapper.selectVideoInterest(user_id);

		} catch (Exception e) {
			e.printStackTrace();
		}


		return list;
	}



	public ArrayList<VideoInterestVO> selectVideoInterest2(String user_id){
	ArrayList<VideoInterestVO> list = null;

	try {
		VideoInterestMapper mapper = session.getMapper(VideoInterestMapper.class);
		list = mapper.selectVideoInterest2(user_id);

	} catch (Exception e) {
		e.printStackTrace();
	}


	return list;
}












}
