package com.boom.box.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.boom.box.vo.FollowVO;

@Repository
public class FollowDAO {

	@Autowired
	private SqlSession session;


	public int insertFollow(FollowVO vo) {
		int count = 0;
		try {
			FollowMapper mapper = session.getMapper(FollowMapper.class);
			count = mapper.insertFollow(vo);


		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}



	public int deleteFollow(int follow_id) {
		int count = 0;
		try {
			FollowMapper mapper = session.getMapper(FollowMapper.class);
			count = mapper.deleteFollow(follow_id);


		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}

	public FollowVO seleteFollowUser(int user_id ) {
		FollowVO vo = null;
		try {
			FollowMapper mapper = session.getMapper(FollowMapper.class);
			vo = mapper.seleteFollowUser(user_id);


		} catch (Exception e) {
			e.printStackTrace();
		}
		return vo;
	}







}
