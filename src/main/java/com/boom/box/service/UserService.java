package com.boom.box.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.ArrayList;
import java.util.HashMap;

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
			session.setAttribute("userManager", vo.getUser_manager());
			
			String num = "2";
			String managerNum = vo.getUser_manager();
			
			if (managerNum.equals(num)) {
				path = "manager/managerHome";
			} else {
				path = "redirect:/";
			}
			
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
	  session.removeAttribute("loginGoogleId");
      session.removeAttribute("loginId");
      session.removeAttribute("loginImg");
      session.removeAttribute("loginName");
      session.removeAttribute("userEmail");
      session.removeAttribute("userZip");
      session.removeAttribute("userAddress");
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
				session.setAttribute("loginName", user.getUser_name());
				path = "stage/close";
			}else {
				System.out.println("개인정보 수정 실패");
				path = "user/updateInfoForm";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return path;
	}
	
	//홈
	public void home(UserVO user, Model model) {
		UserVO vo = dao.selectGoogleId(user.getUser_googleId());

			session.setAttribute("loginGoogleId",vo.getUser_googleId());
			session.setAttribute("loginId", vo.getUser_id());
			session.setAttribute("loginImg", vo.getUser_googleImg());
			session.setAttribute("loginName", vo.getUser_name());
			session.setAttribute("userEmail", vo.getUser_email());
			session.setAttribute("userZip", vo.getUser_zip());
			session.setAttribute("userAddress", vo.getUser_address());

	}


	public ArrayList<HashMap<String, Object>> selectUserList() {
			ArrayList<HashMap<String, Object>> list = dao.selectUserList();
			return list;
		}
	
	public String selectGoogleImg(int user_id) {
		String url = dao.selectGoogleImg(user_id);
		return url;
	}
	public ArrayList<String> selectInterest(int user_id) {
		ArrayList<String> list = dao.selectInterest(user_id);
		return list;
	}
	public Integer canIWatch(int user_id){
		Integer result = dao.canIWatch(user_id);
		return result;
	}
	public ArrayList<HashMap<String, Object>> selectFollowList(int follow_user_id){
		ArrayList<HashMap<String, Object>> list = dao.selectFollowList(follow_user_id);
		return list;
	}
}
