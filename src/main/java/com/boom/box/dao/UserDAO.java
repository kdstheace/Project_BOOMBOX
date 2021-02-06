package com.boom.box.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.boom.box.vo.UserVO;

@Repository
public class UserDAO {
	@Autowired
	private SqlSession session;
	
	public UserVO selectGoogleId(String id) {
		UserVO vo = null;
		
		try {
			UserMapper mapper = session.getMapper(UserMapper.class);
			vo = mapper.selectGoogleId(id);
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return vo;
	}

	public int userInsert(UserVO user) {
		int cnt = 0;
		try {
			UserMapper mapper = session.getMapper(UserMapper.class);
			cnt = mapper.userInsert(user);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cnt;
	}
}
