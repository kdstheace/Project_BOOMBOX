package com.boom.box.controller;

import java.sql.Date;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.Locale;
import java.util.concurrent.TimeUnit;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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
	private static final Logger logger = LoggerFactory.getLogger(MembershipViewController.class);
	@Autowired
	private HttpSession session;
	@Autowired
	private MembershipService service;

	@RequestMapping(value = "/membershipForm", method = RequestMethod.GET)
	public String membershipForm(Model model) {

		int id = (int) session.getAttribute("loginId");


		// 오늘 날짜
		Calendar mon = Calendar.getInstance();
		mon.add(Calendar.DATE, +0);
		String beforeMonth = new java.text.SimpleDateFormat("yyyy-MM-dd").format(mon.getTime());
		String[] array2 = beforeMonth.split("-");
		String sysdate = array2[0] + array2[1] + array2[2];
		System.out.println(sysdate);

		MembershipVO vo = service.selectMembershipOne(id);
		System.out.println(vo);

		model.addAttribute("vo", vo);

		if (vo != null) {

			try {
				// 인데이트
				String intdate = vo.getMembership_indate();
				String[] array = intdate.split("-");
				String payStart = array[0] + array[1] + array[2];

				// 아웃데이트
				String outdate = vo.getMembership_outdate();

				if (outdate != null) {
					String[] array21 = outdate.split("-");
					String payEnd = array21[0] + array21[1] + array21[2];
					System.out.println(payEnd);

					int year = Integer.parseInt(array[0]);

					if ((year % 4 == 0 && year % 100 != 0) || year % 400 == 0) {
						// 29일 있음
						System.out.println(year + "년은 윤년");

						String today = sysdate;

						String format = "yyyyMMdd";
						SimpleDateFormat sdf = new SimpleDateFormat(format, Locale.ENGLISH);
						java.util.Date firstDate = sdf.parse(payEnd);
						java.util.Date secondDate = sdf.parse(today);

						long diffInMillies = Math.abs((firstDate.getTime() - secondDate.getTime()));
						long diff = TimeUnit.DAYS.convert(diffInMillies, TimeUnit.MILLISECONDS);
						System.out.println(String.format("A %s , B %s Diff %s Days", payEnd, today, diff));
						long result = 0;
						int payEnd_int = Integer.parseInt(payEnd);
						int today_int = Integer.parseInt(today);
						int payStart_int = Integer.parseInt(payStart);

						System.out.println("payEnd_int :" + payEnd_int);
						System.out.println("today_int :" + today_int);
						System.out.println("payStart_int: " + payStart_int);

						if (payStart_int <= today_int) {
							if (payEnd_int <= today_int) {
								result = 0;
							} else {
								result = diff;
							}

						} else {
							if (payEnd_int < today_int) {
								result = 30;
							} else {
								result = diff + 30;
							}

						}

						String year1 = payEnd.substring(0, 4);
						String mm = payEnd.substring(4, 6);
						String dd = payEnd.substring(6, 8);

						model.addAttribute("indate", payEnd);
						model.addAttribute("year", year1);
						model.addAttribute("mm", mm);
						model.addAttribute("dd", dd);
						model.addAttribute("diff", result);

					} else {
						System.out.println(year + "년은 평년");
						// 28일 있음
						String outSecond = service.selectSecondOut(id);
						logger.info("outSecond:{}",outSecond);

						String today = sysdate;

						String format = "yyyyMMdd";
						SimpleDateFormat sdf = new SimpleDateFormat(format, Locale.ENGLISH);
						java.util.Date firstDate = sdf.parse(payEnd);
						java.util.Date secondDate = sdf.parse(today);

						long diffInMillies = Math.abs((firstDate.getTime() - secondDate.getTime()));
						long diff = TimeUnit.DAYS.convert(diffInMillies, TimeUnit.MILLISECONDS);
						System.out.println(String.format("A %s , B %s Diff %s Days", payEnd, today, diff));
						long result = 0;
						int payEnd_int = Integer.parseInt(payEnd);
						int today_int = Integer.parseInt(today);
						int payStart_int = Integer.parseInt(payStart);

						System.out.println("payEnd_int :" + payEnd_int);
						System.out.println("today_int :" + today_int);
						System.out.println("payStart_int: " + payStart_int);

						if (payStart_int <= today_int) {
							if (payEnd_int <= today_int) {
								result = 0;
							} else {
								result = diff;
							}

						} else {
							if (payEnd_int < today_int) {
								result = 30;
							} else {
								result = diff + 30;
							}

						}

						String year1 = payEnd.substring(0, 4);
						String mm = payEnd.substring(4, 6);
						String dd = payEnd.substring(6, 8);

						model.addAttribute("indate", payEnd);
						model.addAttribute("year", year1);
						model.addAttribute("mm", mm);
						model.addAttribute("dd", dd);
						model.addAttribute("diff", result);

					}

				}

			} catch (Exception e) {
				e.printStackTrace();
			}

		} else if (vo == null) {
			service.insertStartMembership(id);
			MembershipVO vo2 = service.selectMembershipOne(id);
			System.out.println("vo2 :" + vo2);

			try {
				// 인데이트
				String indate = vo2.getMembership_indate();
				String[] array = indate.split("-");
				String payStart = array[0] + array[1] + array[2];

				// 아웃데이트
				String outdate = vo2.getMembership_outdate();

				if (outdate != null) {
					String[] array21 = outdate.split("-");
					String payEnd = array21[0] + array21[1] + array21[2];
					System.out.println(payEnd);

					int year = Integer.parseInt(array[0]);

					if ((year % 4 == 0 && year % 100 != 0) || year % 400 == 0) {
						// 29일 있음
						System.out.println(year + "년은 윤년");

						String today = sysdate;

						String format = "yyyyMMdd";
						SimpleDateFormat sdf = new SimpleDateFormat(format, Locale.ENGLISH);
						java.util.Date firstDate = sdf.parse(payEnd);
						java.util.Date secondDate = sdf.parse(today);

						long diffInMillies = Math.abs((firstDate.getTime() - secondDate.getTime()));
						long diff = TimeUnit.DAYS.convert(diffInMillies, TimeUnit.MILLISECONDS);
						System.out.println(String.format("A %s , B %s Diff %s Days", payEnd, today, diff));
						long result = 0;
						int payEnd_int = Integer.parseInt(payEnd);
						int today_int = Integer.parseInt(today);
						int payStart_int = Integer.parseInt(payStart);

						System.out.println("payEnd_int :" + payEnd_int);
						System.out.println("today_int :" + today_int);
						System.out.println("payStart_int: " + payStart_int);

						if (payStart_int <= today_int) {
							if (payEnd_int <= today_int) {
								result = 0;
							} else {
								result = diff;
							}

						} else {
							if (payEnd_int < today_int) {
								result = 30;
							} else {
								result = diff + 30;
							}

						}

						String year1 = payEnd.substring(0, 4);
						String mm = payEnd.substring(4, 6);
						String dd = payEnd.substring(6, 8);

						model.addAttribute("indate", payEnd);
						model.addAttribute("year", year1);
						model.addAttribute("mm", mm);
						model.addAttribute("dd", dd);
						model.addAttribute("diff", result);

					} else {
						System.out.println(year + "년은 평년");
						// 28일 있음

						String today = sysdate;

						String format = "yyyyMMdd";
						SimpleDateFormat sdf = new SimpleDateFormat(format, Locale.ENGLISH);
						java.util.Date firstDate = sdf.parse(payEnd);
						java.util.Date secondDate = sdf.parse(today);

						long diffInMillies = Math.abs((firstDate.getTime() - secondDate.getTime()));
						long diff = TimeUnit.DAYS.convert(diffInMillies, TimeUnit.MILLISECONDS);
						System.out.println(String.format("A %s , B %s Diff %s Days", payEnd, today, diff));
						long result = 0;
						int payEnd_int = Integer.parseInt(payEnd);
						int today_int = Integer.parseInt(today);
						int payStart_int = Integer.parseInt(payStart);

						System.out.println("payEnd_int :" + payEnd_int);
						System.out.println("today_int :" + today_int);
						System.out.println("payStart_int: " + payStart_int);

						if (payStart_int <= today_int) {
							if (payEnd_int <= today_int) {
								result = 0;
							} else {
								result = diff;
							}

						} else {
							if (payEnd_int < today_int) {
								result = 30;
							} else {
								result = diff + 30;
							}

						}

						String year1 = payEnd.substring(0, 4);
						String mm = payEnd.substring(4, 6);
						String dd = payEnd.substring(6, 8);

						model.addAttribute("indate", payEnd);
						model.addAttribute("year", year1);
						model.addAttribute("mm", mm);
						model.addAttribute("dd", dd);
						model.addAttribute("diff", result);

					}

				}

			} catch (Exception e) {
				e.printStackTrace();
			}

		}

		return "membership/membershipForm";
	}

	@RequestMapping(value = "/payForm", method = RequestMethod.GET)
	public String payForm(Model model) {

		int id = (int) session.getAttribute("loginId");

		UserVO user = service.selectMemberUser(id);
		System.out.println(user);

		model.addAttribute("user", user);

		return "membership/payForm";
	}

	@RequestMapping(value = "/payCheckForm", method = RequestMethod.GET)
	public String payCheckForm() {

		return "membership/payCheckForm";
	}

	@RequestMapping(value = "/paySuccessForm")
	public String paySuccessForm(Model model, int membership_price) {

		MembershipVO vo = new MembershipVO();

		int membership_user_id = (int) session.getAttribute("loginId");
		vo.setMembership_user_id(membership_user_id);
		vo.setMembership_price(membership_price);

		System.out.println(vo);
		service.insertMembership(vo);

		return "membership/paySuccessForm";
	}

}