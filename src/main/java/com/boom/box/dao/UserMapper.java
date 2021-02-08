package com.boom.box.dao;

import com.boom.box.vo.UserVO;

public interface UserMapper {
	public UserVO selectGoogleId(String id);
	public int insertUser(UserVO user);
	public int insertUserInterest(UserVO user);
}
