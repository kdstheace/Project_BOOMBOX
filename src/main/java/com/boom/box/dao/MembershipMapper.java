package com.boom.box.dao;


import com.boom.box.vo.MembershipVO;
import com.boom.box.vo.UserVO;

public interface MembershipMapper {


	public MembershipVO selectMemberShipOne(int memberShip);
	public UserVO selectMemberUser(int user);
}
