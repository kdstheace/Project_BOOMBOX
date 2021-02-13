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
			vo = mapper.selectMembershipOne(memberShip);
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


	public int insertMembership(MembershipVO vo) {
		int cnt =0;

		try {
			MembershipMapper mapper = session.getMapper(MembershipMapper.class);
			cnt = mapper.insertMembership(vo);
		}catch (Exception e) {
			e.printStackTrace();
		}

		return cnt;


	}

	public int insertStartMembership(int vo) {

		int cnt =0;

		try {
			MembershipMapper mapper = session.getMapper(MembershipMapper.class);
			cnt = mapper.insertStartMembership(vo);
		}catch (Exception e) {
			e.printStackTrace();
		}

		return cnt;

	}

	public String selectSecondOut(int userId) {
		String outDate = null;
		try {
			MembershipMapper mapper = session.getMapper(MembershipMapper.class);
			outDate = mapper.selectSecondOut(userId);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return outDate;
	}















}
