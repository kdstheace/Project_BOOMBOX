package com.boom.box.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value="/stage")
public class StageViewController {
	private static final Logger logger = LoggerFactory.getLogger(StageViewController.class);
	
	@RequestMapping(value="/myStageForm", method=RequestMethod.GET)
	public String MyStageForm() {
		logger.info("마이스테이지로 이동");
		return "stage/myStageForm";
	}
}
