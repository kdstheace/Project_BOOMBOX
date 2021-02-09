package com.boom.box.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Locale;
import java.util.concurrent.TimeUnit;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.boom.box.service.MembershipService;
import com.boom.box.vo.MembershipVO;
import com.boom.box.vo.UserVO;

@Controller
@RequestMapping(value = "/membership")
public class MembershipViewController {

	@Autowired
	private HttpSession session;
	@Autowired
	private MembershipService service;
	
	@RequestMapping(value = "/membershipForm" ,method = RequestMethod.GET)
	public String membershipForm(Model model) {

		int id= 33;

		//sysdate
		Calendar mon = Calendar.getInstance();
		mon.add(Calendar.MONTH , +1);
		String beforeMonth = new
				java.text.SimpleDateFormat("yyyy-MM-dd").format(mon.getTime());

		String[] array2 = beforeMonth.split("-");
		String sysdate = array2[0]+array2[1]+array2[2];
		System.out.println(sysdate);



		MembershipVO vo =	service.selectMembershipOne(id);
		System.out.println(vo);
		model.addAttribute("vo", vo);
		model.addAttribute("indate", vo.getMembership_indate());

		String str=vo.getMembership_indate();

		String[] array = str.split("-");
		String paydate = array[0]+array[1]+array[2];
		System.out.println(paydate);


		if(vo!=null) {


			try {
				String a = paydate;
				String b = sysdate;
				String format = "yyyyMMdd";
				SimpleDateFormat sdf = new SimpleDateFormat(format, Locale.ENGLISH);
				java.util.Date firstDate = sdf.parse(a);
				java.util.Date secondDate = sdf.parse(b);
				long diffInMillies = Math.abs(secondDate.getTime() - firstDate.getTime());
				long diff = TimeUnit.DAYS.convert(diffInMillies, TimeUnit.MILLISECONDS);
				System.out.println(String.format("A %s , B %s Diff %s Days", a, b, diff));

				model.addAttribute("diff", diff);

			}
			catch
			(Exception e) { e.printStackTrace();
			}
		}

		return "membership/membershipForm";
	}





	@RequestMapping(value = "/payForm" ,method = RequestMethod.GET)
	public String payForm(Model model) {

		int id= 33;

		UserVO user = service.selectMemberUser(id);
		System.out.println(user);

		model.addAttribute("user", user);



		return "membership/payForm";
	}


	@RequestMapping(value = "/payCheckForm" ,method = RequestMethod.GET)
	public String payCheckForm() {


		return "membership/payCheckForm";
	}

}
