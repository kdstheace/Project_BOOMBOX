package com.boom.box.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.boom.box.vo.MembershipVO;
import com.boom.box.vo.UserVO;


@Repository
public class MembershipDAO {

	@Autowired
	private SqlSession session;

	public MembershipVO selectMembershipOne(int memberShip) {
		MembershipVO vo = null;


		try {
			MembershipMapper mapper = session.getMapper(MembershipMapper.class);
			vo = mapper.selectMemberShipOne(memberShip);
		}catch (Exception e) {
			e.printStackTrace();
		}

		return vo;


	}
	public UserVO selectMemberUser(int user) {
		UserVO vo = null;


		try {
			MembershipMapper mapper = session.getMapper(MembershipMapper.class);
			vo = mapper.selectMemberUser(user);
		}catch (Exception e) {
			e.printStackTrace();
		}

		return vo;



	}
















}
