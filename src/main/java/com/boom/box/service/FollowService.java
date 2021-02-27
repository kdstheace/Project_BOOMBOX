package com.boom.box.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boom.box.dao.FollowDAO;
import com.boom.box.vo.FollowVO;

@Service
public class FollowService {

	@Autowired
	private FollowDAO dao;

	public int insertFollow(FollowVO vo) {

		return dao.insertFollow(vo);
	}



	public int deleteFollow(int follow_id) {
		return dao.deleteFollow(follow_id);
	}

	public FollowVO seleteFollowUser(int user_id) {
		return dao.seleteFollowUser(user_id);
	}
}
