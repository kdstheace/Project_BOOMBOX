package com.boom.box.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.boom.box.HomeController;
import com.boom.box.service.UserService;
import com.boom.box.vo.UserVO;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

@Controller
@RequestMapping(value="/user")
public class UserViewController {
	private static final Logger logger = LoggerFactory.getLogger(UserViewController.class);
	@Autowired
	private UserService service;

	//로그인 폼
	@RequestMapping(value = "/loginForm", method = RequestMethod.GET)
	public String login() {
		return "user/loginForm";
	}
	
	//조인폼
	@RequestMapping(value = "/joinForm", method = RequestMethod.GET)
	public String joinForm() {
		return "user/joinForm";		
	}
	
	//구글로그인
	@RequestMapping(value="/googleLogin", method= RequestMethod.GET)
	public String googleLogin(UserVO user, Model model) {
		String path = service.googleLogin(user, model);
		return path;
	}
	
	// name 중복검사Form
	@RequestMapping(value = "/nameCheckForm", method = RequestMethod.GET)
	public String nameCheckForm() {
		return "user/nameCheckForm";
	}
	
	// id중복검사
	@RequestMapping(value = "/nameCheck", method = RequestMethod.POST)
	public String nameCheck(UserVO user, Model model) {
		UserVO userOne = service.selectUserOne(user);
		System.out.println(userOne);           
		model.addAttribute("userOne", userOne);
		model.addAttribute("checkName", user);
		
		return "user/nameCheckForm";
	}
	
	// email 중복검사 Form
	@RequestMapping(value = "/emailCheckForm", method = RequestMethod.GET)
	public String emailCheckForm() {
		return "user/emailCheckForm";
	}
	
	// email 중복검사
	@RequestMapping(value = "/emailCheck", method = RequestMethod.POST)
	public String emailCheck(UserVO user, Model model) {
		System.out.println(user);
		UserVO userOne = service.selectUserEmail(user);
		model.addAttribute("userOne", userOne);
		model.addAttribute("checkEmail", user);
		
		return "user/emailCheckForm";
	}
	
	//회원가입
	@RequestMapping(value="/join", method = RequestMethod.POST)
	public String join(UserVO user) {
		String path = service.insertUser(user);
		logger.info("회원가입 최종 성공");
		return path;
	}
	
	//로그아웃
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout() {
		service.logout();
		return "redirect:/user/loginForm";
	}
	
	//개인정보수정 폼가기
	@RequestMapping(value = "/updateInfoForm", method = RequestMethod.GET)
	public String updateInfoForm() {
		System.out.println("개인정보 폼 들어감");
		return "user/updateInfoForm";
	}
	
	
	//개인정보수정 진행하기
	@RequestMapping(value="/updateInfo", method = RequestMethod.POST)
	public String editInfoForm(UserVO user) {
		System.out.println("개인정보 수정 시행 클릭");
		System.out.println(user);
		String path = service.updateInfo(user);
		return path;
	}
	
}
