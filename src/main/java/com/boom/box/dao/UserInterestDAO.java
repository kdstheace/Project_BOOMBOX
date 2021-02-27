package com.boom.box.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.boom.box.vo.UserInterestVO;

@Repository
public class UserInterestDAO {

	@Autowired
	private SqlSession session;


	public ArrayList<UserInterestVO> selectInterest(int user_id){

		ArrayList<UserInterestVO> list = null;

		try {
			UserInterestMapper mapper = session.getMapper(UserInterestMapper.class);
			list = mapper.selectInterest(user_id);

		} catch (Exception e) {
			e.printStackTrace();
		}



	return list;
	}
















}
