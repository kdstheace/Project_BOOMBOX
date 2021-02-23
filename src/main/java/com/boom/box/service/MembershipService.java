package com.boom.box.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boom.box.dao.MembershipDAO;
import com.boom.box.vo.MembershipVO;
import com.boom.box.vo.UserVO;

@Service
public class MembershipService {

	@Autowired
	private MembershipDAO dao;
	@Autowired
	private HttpSession session;

	public MembershipVO selectMembershipOne(int memberShip) {
		MembershipVO vo = dao.selectMembershipOne(memberShip);
		return vo;
	}
	public UserVO selectMemberUser(int user) {
		return dao.selectMemberUser(user);
	}

	public int insertMembership(MembershipVO vo) {
		return dao.insertMembership(vo);

	}


	public int insertStartMembership(int vo) {
		return dao.insertStartMembership(vo);
	}

	public String selectSecondOut(int userId) {
		return dao.selectSecondOut(userId);
	}

	public int  updateDefultday(int userId) {
		return dao.updateDefultday(userId);
	}



}
