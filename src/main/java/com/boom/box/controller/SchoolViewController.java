package com.boom.box.controller;

import java.util.Calendar;import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.boom.box.service.BoomMasterService;
import com.boom.box.service.MembershipService;
import com.boom.box.vo.MembershipVO;

@Controller
@RequestMapping(value = "/school")
public class SchoolViewController {
	@Autowired
	private BoomMasterService bmService;
	private static final Logger logger = LoggerFactory.getLogger(SchoolViewController.class);

	@Autowired
	private HttpSession session;
	@Autowired
	private MembershipService service;

	@RequestMapping(value = "/schoolForm", method = RequestMethod.GET)
	public String schoolForm(Model model) {

		int id = (int) session.getAttribute("loginId");

		MembershipVO vo = service.selectMembershipOne(id);
		System.out.println("vo =" + vo);
		/*
		 * ArrayList<HashMap<String, Object>> list = bmService.selectBoomMasterList();
		 * model.addAttribute("list", list);
		 */
		// ���� ��¥
		Calendar mon = Calendar.getInstance();
		mon.add(Calendar.DATE, +0);
		String beforeMonth = new java.text.SimpleDateFormat("yyyy-MM-dd").format(mon.getTime());
		String[] array2 = beforeMonth.split("-");
		String today = array2[0] + array2[1] + array2[2];

		if (vo == null) {
			service.insertStartMembership(id);
			MembershipVO vo2 = service.selectMembershipOne(id);

			String outdate = vo2.getMembership_outdate();
			String[] array21 = outdate.split("-");
			String payEnd = array21[0] + array21[1] + array21[2];
			System.out.println("payEand �ɹ��� �����³� :" + payEnd);

			// ��Ʈ������ ġȯ
			int payEnd_int = Integer.parseInt(payEnd);
			int today_int = Integer.parseInt(today);

			// �ɹ����� ���
			if (payEnd_int > today_int) {

				return "/school/schoolForm";
			} else {
				// �ɹ����� �ƴѰ汸

				return "redirect:/school/schoolDeniedForm";

			}
		} else {
			// ��������.
			String outdate = vo.getMembership_outdate();
			String[] array21 = outdate.split("-");
			String payEnd = array21[0] + array21[1] + array21[2];

			// ��Ʈ������ ġȯ
			int payEnd_int = Integer.parseInt(payEnd);
			int today_int = Integer.parseInt(today);

			// �ɹ����� ���
			if (payEnd_int > today_int) {


				return "/school/schoolForm";
			} else {
				// �ɹ����� �ƴѰ汸
				System.out.println("�ƴѰ汸");

				return "redirect:/school/schoolDeniedForm";
			}

		}


	}

	 @RequestMapping(value = "/schoolDeniedForm" , method = RequestMethod.GET)
	 public String schoolDeniedForm() {

	  return "/school/schoolDeniedForm";

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
