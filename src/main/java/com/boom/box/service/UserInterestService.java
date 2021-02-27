package com.boom.box.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boom.box.dao.UserInterestDAO;
import com.boom.box.vo.UserInterestVO;

@Service
public class UserInterestService {

	@Autowired
	private UserInterestDAO dao;



	public ArrayList<UserInterestVO> selectInterest(int user_id){

		return dao.selectInterest(user_id);


	}


}
