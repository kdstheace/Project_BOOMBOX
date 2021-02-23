package com.boom.box.service;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boom.box.dao.MotionDAO;
import com.boom.box.vo.MotionVO;

@Service
public class MotionService {
	private static final Logger logger = LoggerFactory.getLogger(MotionService.class);
	@Autowired
	private MotionDAO dao;
	
	public String insertMotion(MotionVO motion) {
		int count = dao.insertMotion(motion);
		String path="";
		if(count > 0) {
			logger.info("모션 업로드 성공");
			path = "redirect:/manager/home";
		}else {
			logger.info("모션 업로드 실패");
			path = "redirect:/manager/motionRegistrationForm";
		}
		return path;
	}
	
	public MotionVO selectMotionOne(MotionVO motion) {
		MotionVO vo = dao.selectMotionOne(motion);
		return vo;
	}
	
	public MotionVO selectMotionOneByTitle(String motion_title) {
		MotionVO vo = dao.selectMotionOneByTitle(motion_title);
		return vo;
	}
	public ArrayList<MotionVO> selectMotionListByClass(MotionVO motion){
		ArrayList<MotionVO> list = dao.selectMotionListByClass(motion);
		return list;
	}
}
