package com.boom.box.dao;

import com.boom.box.vo.UserVO;

public interface UserMapper {
	//구글아이디 같은지 체크
	public UserVO selectGoogleId(String id);
	//회원가입
	public int insertUser(UserVO user);
	//회원가입시 유저관심 인서트
	public int insertUserInterest(UserVO user);
	//회원정보 수정
	public int updateInfo(UserVO user);
	//유저 닉네임 중복검사
	public UserVO selectUserOne(UserVO user);
	//유저 이메일 중복검사
	public UserVO selectUserEmail(UserVO user);
	//업데이트 할 때 우선 인터레스트 지우고 인서트 하는걸로 
	public int deleteUserInterest(UserVO user);
}
