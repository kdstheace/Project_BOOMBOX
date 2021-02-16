package com.boom.box.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.boom.box.service.MyStageService;
import com.boom.box.service.ReportService;
import com.boom.box.vo.MyStageVO;
import com.boom.box.vo.ReportVO;

@Controller
@RequestMapping(value = "/report")
public class ReportViewController {

	@Autowired
	private MyStageService service;
	@Autowired
	private ReportService reportService;



	@RequestMapping(value = "/reportForm" ,method = RequestMethod.GET)
	public String reportForm(Model model ,HttpSession session) {

		int id = (int)session.getAttribute("loginId");
		ArrayList<HashMap<String, Object>> list =service.selectVideoListMystage(id);

		System.out.println(list.get(0));

		model.addAttribute("stageVO", list);


		return "/manager/reportForm";
	}




	@RequestMapping(value = "/insertReport" ,method = RequestMethod.POST)
	public String insertReport(ReportVO reportVO, HttpSession session) {


		System.out.println(reportVO);


		 int cnt = reportService.insertReport(reportVO);

		  if(cnt>0) {

			  System.out.println("성공");

		  }else {
			 System.out.println("실패");
			 return "/report/reportForm";
			 }

		return "redirect:/report/closeForm";

	}

	@RequestMapping(value = "/closeForm" ,method = RequestMethod.GET)
	public String close() {


		return "/manager/closeForm";

	}




}
