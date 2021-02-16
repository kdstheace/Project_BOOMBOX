package com.boom.box.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value="/school")
public class SchoolViewController {
	
	private static final Logger logger = LoggerFactory.getLogger(SchoolViewController.class);
	
	@RequestMapping(value="/schoolForm", method=RequestMethod.GET)
	public String schoolForm() {
		logger.info("스쿨 메인으로 이동");
		return "school/schoolForm";
	}
	
	

}
