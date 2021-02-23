package com.boom.box.dao;


import com.boom.box.vo.MembershipVO;
import com.boom.box.vo.UserVO;

public interface MembershipMapper {


	public MembershipVO selectMembershipOne(int memberShip);
	public UserVO selectMemberUser(int user);
	public String selectSecondOut(int userId);
	public int insertMembership(MembershipVO vo);
	public int insertStartMembership(int vo) ;
	public int  updateDefultday(int userId);


}
