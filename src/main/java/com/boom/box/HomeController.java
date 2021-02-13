package com.boom.box;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.boom.box.service.VideoService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	@Autowired
	private VideoService service;
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	private String uploadPath = "/uploadFile/Boombox";

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(HttpSession session, Model model) {
		logger.info("홈으로 이동");
		ArrayList<HashMap<String, Object>> list = service.selectVideoList(null, 1, 8);
		model.addAttribute("list", list);
		model.addAttribute("uploadPath", uploadPath);
		return "home";
	}
	
	
	
}
