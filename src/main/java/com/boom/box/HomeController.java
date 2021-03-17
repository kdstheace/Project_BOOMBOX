package com.boom.box;

import java.math.BigDecimal;
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

import com.boom.box.service.ADService;
import com.boom.box.service.MyStageService;
import com.boom.box.service.VideoService;
import com.boom.box.vo.ADVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	@Autowired
	private VideoService service;
	@Autowired
	private MyStageService stageService;
	@Autowired
	private ADService adService;
	private String uploadPath = "/uploadFile/Boombox";

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(HttpSession session, Model model) {
		logger.info("홈으로 이동");
		int loginId = (int)session.getAttribute("loginId");
		ArrayList<HashMap<String, Object>> list = service.selectVideoList("", 0, 8);
		ArrayList<HashMap<String, Object>> listFollow = service.selectVideoByFollow(0, 8, loginId);
		
		for(HashMap<String, Object> map : list) { 
			int countFollow = stageService.countFollow(((BigDecimal)(map.get("VIDEO_USER_ID"))).intValue());
			map.put("countFollow",countFollow );
		}
		
		for(HashMap<String, Object> mapFollow : listFollow) { 
			int countFollow = stageService.countFollow(((BigDecimal)(mapFollow.get("VIDEO_USER_ID"))).intValue());
			mapFollow.put("countFollow",countFollow );
		}
	      ArrayList<ADVO> adlist = adService.selectBanner();

	      ADVO advo = adlist.get(0);

	      model.addAttribute("advo", advo);
		model.addAttribute("list", list);
		model.addAttribute("listFollow", listFollow);
		model.addAttribute("uploadPath", uploadPath);
		return "home";
	}
	
}
