package com.boom.box.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.boom.box.service.ManagerService;

@Controller
@RequestMapping(value = "/manager")
public class ManagerViewController {
	private static final Logger logger = LoggerFactory.getLogger(ManagerViewController.class);
	@Autowired
	private ManagerService service;

	// 고객센터 폼
	@RequestMapping(value = "/crmForm", method = RequestMethod.GET)
	public String crmForm() {
		System.out.println("고객센터 폼 들어감");
		return "manager/crmForm";
	}

	// 고객센터 전달하기
	@RequestMapping(value = "/crmSend", method = RequestMethod.POST)
	public String crmSend() {
		System.out.println("고객센터 내용 전달 시작");
		return "manager/crmSend";
	}

	//고객센터 메인페이지 가기
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String managerHome() {
		System.out.println("고객센터 홈");
		return "manager/managerHome";
	}
	
	//신고관리 페이지 가기
	@RequestMapping(value = "/reportManagerForm", method = RequestMethod.GET)
	public String reportManagerForm() {
		System.out.println("신고관리 페이지");
		return "manager/reportManagerForm";
	}
	
	//모션등록 페이지 가기
	@RequestMapping(value = "/motionRegistrationForm", method = RequestMethod.GET)
	public String motionRegistrationForm() {
		System.out.println("모션등록 페이지");
		return "/manager/motionRegistrationForm";
	}
	
	//붐마스터 등록 페이지 가기
	@RequestMapping(value = "/boomMasterRegistrationForm", method = RequestMethod.GET)
	public String boomMasterRegistrationForm() {
		System.out.println("붐마스터 등록 페이지");
		return "/manager/boomMasterRegistrationForm";
	}
	
	//광고등록 페이지 가기
	@RequestMapping(value = "/adRegistrationForm", method = RequestMethod.GET)
	public String adRegistrationForm() {
		System.out.println("광고등록 페이지");
		return "/manager/adRegistrationForm";
	}
	
	//비디오 삭제 페이지 가기
	@RequestMapping(value = "/videoDeleteForm", method = RequestMethod.GET)
	public String videoDeleteForm() {
		System.out.println("비디오 삭제 페이지");
		return "/manager/videoDeleteForm";
	}
	
	//멤버십 관리 페이지 가기
	@RequestMapping(value = "/membershipManagerForm", method = RequestMethod.GET)
	public String membershipManagerForm() {
		System.out.println("멤버십 관리 페이지");
		return "/manager/membershipManagerForm";
	}


}
