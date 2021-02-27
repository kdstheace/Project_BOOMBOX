package com.boom.box.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.boom.box.service.BoomMasterService;
import com.boom.box.service.ManagerService;
import com.boom.box.service.UserService;
import com.boom.box.util.PageNavigator;
import com.boom.box.vo.BoomMasterVO;
import com.boom.box.vo.BoomMasterVO;

@Controller
@RequestMapping(value = "/manager")
public class ManagerViewController {
	private static final Logger logger = LoggerFactory.getLogger(ManagerViewController.class);
	@Autowired
	private UserService usService;
	@Autowired
	private BoomMasterService bmService;
	
	@Autowired
	private ManagerService service;
	
	private final int countPerPage = 10;
	private final int pagePerGroup = 5;

	//관리자 메인페이지 가기
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String managerHome() {
		System.out.println("관리자페이지");
		return "manager/managerHome";
	}
	
	// 신고관리 페이지 가기
	@RequestMapping(value = "/reportManagerForm", method = RequestMethod.GET)
	public String reportManagerForm(Model model) {
		System.out.println("신고관리 페이지");
		ArrayList<HashMap<String, Object>> list = usService.selectUserList();
		model.addAttribute("list", list);
		logger.info("체크:{}", list);
		return "manager/reportManagerForm";
	}
	
	//모션등록 페이지 가기
	@RequestMapping(value = "/motionRegistrationForm", method = RequestMethod.GET)
	public String motionRegistrationForm(@RequestParam(defaultValue = "0")int video_id, Model model) {
		System.out.println("모션등록 페이지");
		model.addAttribute("video_id", video_id);
		return "/manager/motionRegistrationForm";
	}
	
	// 붐마스터 등록 페이지 가기
	@RequestMapping(value = "/boomMasterRegistrationForm", method = RequestMethod.GET)
	public String boomMasterRegistrationForm(Model model) {
		logger.info("붐마스터 등록/취소 페이지");
		ArrayList<HashMap<String, Object>> list = bmService.selectBoomMasterApplyList();
		model.addAttribute("list", list);
		logger.info("체크:{}", list);
		return "/manager/boomMasterRegistrationForm";
	}
	// 붐마스터 등록/취소 전환
	@RequestMapping(value = "/changeBoomMaster", method = RequestMethod.GET)
	public String changeBoomMaster(BoomMasterVO boomMaster) {
		logger.info("수락/취소 클릭클릭 베이베~");
		bmService.changeBoomMaster(boomMaster);
		return "redirect:/manager/boomMasterRegistrationForm";
	}
	//광고등록 페이지 가기
	@RequestMapping(value = "/adRegistrationForm", method = RequestMethod.GET)
	public String adRegistrationForm() {
		System.out.println("광고등록 페이지");
		return "/manager/adRegistrationForm";
	}
	
	
	//고객센터 페이지 가기
	@RequestMapping(value = "/crmManagerForm", method = RequestMethod.GET)
	public String crmManagerForm(Model model) {
		System.out.println("고객센터 페이지");
		ArrayList<HashMap<String, Object>> list = service.selectCrmList();
		model.addAttribute("crm", list);
		logger.info("체크:{}", list);
		return "/manager/crmManagerForm";
	}
		
	//멤버십 관리 페이지 가기
	@RequestMapping(value = "/membershipManagerForm", method = RequestMethod.GET)
	public String membershipManagerForm() {
		System.out.println("멤버십 관리 페이지");
		return "/manager/membershipManagerForm";
	}
	
	//검색기능...???
	@RequestMapping(value="/searchForm", method = RequestMethod.GET)
	public String searchForm(Model model, @RequestParam(defaultValue = "")String searchText
							, @RequestParam(defaultValue = "1")int page) {
		logger.info("검색어:{}", searchText);
		logger.info("검색결과 이동");
		int total = service.selectUserCount(searchText);
		logger.info("서비스 제대로 확인");
		PageNavigator navi = new PageNavigator(countPerPage, pagePerGroup, page, total);
		logger.info("네비에 현재 변수들로 생성, 페이지: {}", page);
		ArrayList<HashMap<String, Object>> list = service.selectUserList(searchText, navi.getStartRecord(), navi.getCountPerPage());
		
		model.addAttribute("list",list);
		model.addAttribute("searchText",searchText);
		model.addAttribute("navi", navi);
		
		return "/manager/searchForm";
	}


}
