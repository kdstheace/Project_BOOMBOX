package com.boom.box.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.boom.box.service.BoomMasterService;
import com.boom.box.service.UserService;

@Controller
@RequestMapping(value = "/boomMaster")
public class BoomMasterViewController {

	private static final Logger logger = LoggerFactory.getLogger(BoomMasterViewController.class);
	@Autowired
	private BoomMasterService service;
	
	//붐마스터 관리 폼
	@RequestMapping(value = "/bmApplyForm", method = RequestMethod.GET)
	public String bmApplyForm() {
		return "boomMaster/bmApplyForm";
	}
	

}
