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
			session.setAttribute("loginGoogleId",vo.getUser_googleId());
			session.setAttribute("loginId", vo.getUser_id());
			session.setAttribute("loginImg", vo.getUser_googleImg());
			session.setAttribute("loginName", vo.getUser_name());
			session.setAttribute("userEmail", vo.getUser_email());
			session.setAttribute("userZip", vo.getUser_zip());
			session.setAttribute("userAddress", vo.getUser_address());
			
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
	//중복 닉네임 찾기
	public UserVO selectUserOne(UserVO user) {
		return dao.selectUserOne(user);
	}
	
	//중복 이메일 찾기
	public UserVO selectUserEmail(UserVO user) {
		return dao.selectUserEmail(user);
	}
	
	public String updateInfo(UserVO user) {
		int loginID = (int)session.getAttribute("loginId");
		user.setUser_id(loginID);
		String path = "";
		int count = 0;
		try {
			System.out.println("개인정보 DAO 들어감");
			count = dao.updateInfo(user);
			if(count > 0) {
				System.out.println("개인정보 수정 성동");
				path = "redirect:/";
			}else {
				System.out.println("개인정보 수정 실패");
				path = "user/updateInfoForm";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return path;
	}
	
	//

}
