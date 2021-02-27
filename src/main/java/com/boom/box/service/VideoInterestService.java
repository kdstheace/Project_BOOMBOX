package com.boom.box.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boom.box.dao.VideoInterestDAO;
import com.boom.box.vo.UserInterestVO;
import com.boom.box.vo.VideoInterestVO;

@Service
public class VideoInterestService {

	@Autowired
	private VideoInterestDAO dao;


	public ArrayList<VideoInterestVO> selectVideoInterest(String user_id){

		return dao. selectVideoInterest(user_id);
	}
	public ArrayList<VideoInterestVO> selectVideoInterest2(String user_id){
		return dao.selectVideoInterest2(user_id);
	}

}
