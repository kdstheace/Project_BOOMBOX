package com.boom.box.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import javax.servlet.http.HttpSession;


import org.springframework.stereotype.Service;

import com.boom.box.dao.UserDAO;
import com.boom.box.vo.UserVO;

@Service
public class UserService {
	@Autowired
	private UserDAO dao;
	@Autowired
	private HttpSession session;


	
	public String googleLogin(String id) {
		UserVO vo = dao.selectGoogleId(id);
		String path = "";
		if(vo != null) {
			session.setAttribute("loginId", vo.getUser_id());
			path = "redirect:/";
		}else {
			path = "user/joinForm";
		}
		return path;
	}


	public String userInsert(UserVO user) {
		int cnt = dao.userInsert(user);
		String path = "";
		if(cnt > 0) {
			path = "redirect:/";
		}else {
			path = "user/joinForm";
		}
		return path;
	}
	
	//로그아웃
	public void logout() {
		session.removeAttribute("loginId");
	}
}
