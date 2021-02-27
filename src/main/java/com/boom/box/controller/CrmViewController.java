package com.boom.box.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.boom.box.service.CrmService;
import com.boom.box.vo.CrmVO;

@Controller
@RequestMapping(value = "/crm")
public class CrmViewController {

	private static final Logger logger = LoggerFactory.getLogger(CrmViewController.class);

	@Autowired
	private CrmService service;

	// 고객센터 폼
	@RequestMapping(value = "/crmForm", method = RequestMethod.GET)
	public String crmForm() {
		System.out.println("고객센터 폼 들어감");
		return "crm/crmForm";
	}

	// 고객센터 전달하기
	@RequestMapping(value = "/crmSend", method = RequestMethod.POST)
	public String insertCrm(CrmVO crm, HttpSession session) {
		

		int id = (int) session.getAttribute("loginId");
		
		logger.info("고객센터 값 확인");
		logger.info("{}", crm);
		
		System.out.println("고객센터 내용 전달 시작");
		int cnt = service.insertCrm(crm);

		if (cnt > 0) {
			logger.info("고객센터 등록 최종 성공!");
			return "redirect:/report/closeForm";
		} else {
			logger.info("실패");
			return "redirect:/";

		}
	}
}
