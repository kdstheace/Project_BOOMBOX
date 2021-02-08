package com.boom.box.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import javax.servlet.http.HttpSession;


import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.boom.box.dao.UserDAO;
import com.boom.box.vo.UserVO;

@Service
public class UserService {
	@Autowired
	private UserDAO dao;
	@Autowired
	private HttpSession session;
	private static final Logger logger = LoggerFactory.getLogger(UserService.class);

	
	public String googleLogin(UserVO user, Model model) {
		UserVO vo = dao.selectGoogleId(user.getUser_googleId());
		String path = "";
		if (vo != null) {
			session.setAttribute("googleId",vo.getUser_googleId());
			session.setAttribute("loginId", vo.getUser_id());
			logger.info("세션에 아이디 넣었음");
			session.setAttribute("loginImg", vo.getUser_googleImg());
			logger.info("로그인 성공 아이디는 {}",session.getAttribute("loginId"));
			path = "redirect:/";
		} else {
			model.addAttribute("userVO", user);
			path = "user/joinForm";
		}
		return path;
	}


	public String insertUser(UserVO user) {
		String path = "";
		int count = 0;
		try {
			count = dao.insertUser(user);
			if(count > 0) {
				path = "redirect:/";
			}else {
				path = "user/joinForm";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return path;
	}
	
	//로그아웃
	public void logout() {
		session.removeAttribute("loginId");
	}
}
