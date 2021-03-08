package com.boom.box.controller;

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

import com.boom.box.service.UserService;
import com.boom.box.service.VideoService;

@Controller
@RequestMapping(value = "/sidebar")
public class SidebarViewController {
	
	  private static final Logger logger = LoggerFactory.getLogger(SidebarViewController.class);
	  
	  @Autowired
	  private VideoService service; 
	  @Autowired
	  private UserService userService;
	  
	  @RequestMapping(value="/likeForm", method = RequestMethod.GET) 
	  public String likeForm(Model model, HttpSession session) {
		  logger.info("좋아요 폼으로 이동"); 
		  int id = (int)session.getAttribute("loginId");
		  ArrayList<HashMap<String, Object>> list = service.selectVideoListByLike(0, 8, id); 
		  model.addAttribute("list", list);
		  return "leftBar/likeForm"; 
	  }
	  
	  @RequestMapping(value="/followForm", method = RequestMethod.GET)
	  public String followForm(Model model, HttpSession session) {
		  logger.info("팔로우 폼으로 이동");
		  int id = (int)session.getAttribute("loginId");
		  return "leftBar/followForm"; 
		  
	  }
	  
	  @RequestMapping(value="/interestForm", method = RequestMethod.GET)
	  public String interestForm(Model model, HttpSession session) {
		  logger.info("interest 폼으로 이동");
		  int id = (int)session.getAttribute("loginId");
		  ArrayList<HashMap<String, Object>> list = service.selectVideoByInterest(id);
		  ArrayList<String> listInterest = userService.selectInterest(id);
		  model.addAttribute("listInterest", listInterest);
		  model.addAttribute("list", list);
		  return "leftBar/interestForm";   
	  }
}
