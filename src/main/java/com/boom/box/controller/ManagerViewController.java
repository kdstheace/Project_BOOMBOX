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
	
	//고객센터 폼
	@RequestMapping(value = "/crmForm", method = RequestMethod.GET)
	public String crmForm() {
		System.out.println("고객센터 폼 들어감");
		return "manager/crmForm";
	}
	
	//고객센터 전달하기
	@RequestMapping(value = "/crmSend", method = RequestMethod.POST)
	public String crmSend() {
		System.out.println("고객센터 내용 전달 시작");
		return "manager/crmSend";
	}
	

}
