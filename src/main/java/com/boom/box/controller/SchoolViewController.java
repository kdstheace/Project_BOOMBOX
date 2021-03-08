package com.boom.box.controller;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.boom.box.service.BoomMasterService;
import com.boom.box.service.VideoService;
import com.boom.box.service.MembershipService;
import com.boom.box.vo.BoomMasterVO;
import com.boom.box.vo.MembershipVO;
import com.boom.box.vo.VideoVO;

@Controller
@RequestMapping(value = "/school")
public class SchoolViewController {

	private static final Logger logger = LoggerFactory.getLogger(SchoolViewController.class);

	@Autowired
	private HttpSession session;
	@Autowired
	private MembershipService service;
	@Autowired
	private BoomMasterService boomService;
	@Autowired
	private VideoService videoService;

	@RequestMapping(value = "/schoolForm", method = RequestMethod.GET)
	public String schoolForm(Model model) {
		
		//스쿨에 표시될 비디오들 가져오기 가져오기
		ArrayList<HashMap<String, Object>> list  = videoService.selectVideoList(null, 1, 8);
		model.addAttribute("list", list);
		
		//오늘날짜
		Calendar mon = Calendar.getInstance();
		mon.add(Calendar.DATE, +0);
		String beforeMonth = new java.text.SimpleDateFormat("yyyy-MM-dd").format(mon.getTime());
		String[] array2 = beforeMonth.split("-");
		String today = array2[0] + array2[1] + array2[2]; //오늘날짜 String
		int today_int = Integer.parseInt(today);//오늘 날짜 int
		

		//(자격확인)현재 세션의 아이디가 멤버십에 있는지 확인.
		int id = (int) session.getAttribute("loginId");
		MembershipVO membership = service.selectMembershipOne(id);
		BoomMasterVO boomMaster = boomService.selectBoomasterOne(id);

		if (membership == null) {					//1.멤버십에 가입된 적이 없는 경우
			if(boomMaster == null) {  				//	1-1. 멤버십 가입경험 X && 붐마스터 X
				return "redirect:/school/schoolDeniedForm";
			}else {									//	1-2. 멤버십 가입경험 X && 붐마스터 O
				return "/school/schoolForm";
			}
		}else {										//2. 멤버십에 가입된 적이 있는 경우
			//멤버십 가입자의 멤버십 종료일 int로 뽑아내기
			String outdate = membership.getMembership_outdate();
			String[] array21 = outdate.split("-");
			String payEnd = array21[0] + array21[1] + array21[2];
			int payEnd_int = Integer.parseInt(payEnd);
			
			if (payEnd_int >= today_int) { 			//	2-1. 멤버십 만기 이전인 경우.
				return "/school/schoolForm";	
			} else {								//	2-2. 멤버십이 만기된 경우
				if(boomMaster == null) {  			//		2-2-1. 멤버십 만기 && 붐마스터 X
					return "redirect:/school/schoolDeniedForm";
				}else {								//		2-2-2. 멤버십 만기 && 붐마스터 O
					return "school/schoolForm";
				}
			}
		}
	}

		
	@RequestMapping(value = "/schoolDeniedForm" , method = RequestMethod.GET)
	public String schoolDeniedForm() {
		int id = (int) session.getAttribute("loginId");
		service.insertStartMembership(id);
		return "school/schoolDeniedForm";
	}

	//My School로 이동
	@RequestMapping(value="/mySchoolForm", method=RequestMethod.GET)
	public String mySchoolForm() {
		logger.info("My School로 이동");
		return "school/mySchoolForm";
	}
		
	//홈트레이닝으로 이동
	@RequestMapping(value="/homeTrainingForm", method=RequestMethod.GET)
	public String homeTrainingForm() {
		logger.info("홈트레이닝으로 이동");
		return "school/homeTrainingForm";
	}
		
	//Kids로 이동
	@RequestMapping(value="/kidsForm", method=RequestMethod.GET)
	public String kidsForm() {
		logger.info("Kids로 이동");
		return "school/kidsForm";
	}
		
	//방송댄스로 이동
	@RequestMapping(value="/broadcastDanceForm", method=RequestMethod.GET)
	public String broadcastDanceForm() {
		logger.info("방송댄스로 이동");
		return "school/broadcastDanceForm";
	}
		
		//클럽댄스로 이동
		@RequestMapping(value="/clubDanceForm", method=RequestMethod.GET)
		public String clubDanceForm() {
			logger.info("클럽댄스로 이동");
			return "school/clubDanceForm";
		}
		
		//힙합으로 이동
		@RequestMapping(value="/hiphopForm", method=RequestMethod.GET)
		public String hiphopForm() {
			logger.info("힙합으로 이동");
			return "school/hiphopForm";
		}
		
		//Others로 이동
		@RequestMapping(value="/othersForm", method=RequestMethod.GET)
		public String othersForm() {
			logger.info("Others로 이동");
			return "school/othersForm";
		}


}
