package com.boom.box.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mybatis.spring.MyBatisSystemException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.boom.box.service.MyStageService;
import com.boom.box.service.VideoService;
import com.boom.box.util.FileService;
import com.boom.box.vo.MyStageVO;

@Controller
@RequestMapping(value="/stage")
public class StageViewController {
	private static final Logger logger = LoggerFactory.getLogger(StageViewController.class);

	@Autowired
	private MyStageService service;



	@Autowired
	private HttpSession session;

	private String uploadPath = "/uploadFile/Boombox";

	@RequestMapping(value="/myStageForm", method=RequestMethod.GET)
	public String MyStageForm(Model model) {

		int id = (int)session.getAttribute("loginId");
		ArrayList<HashMap<String, Object>> list = service.selectVideoListMystage(id);
		model.addAttribute("list", list);
		model.addAttribute("uploadPath", uploadPath);
		System.out.println("list="+list);



		MyStageVO vo = service.selectMyStageone(id);
		System.out.println("vo="+vo);
		if(vo==null) {
		model.addAttribute("vo", "null");
		}
		else {
		model.addAttribute("myStage", vo);

		}

		return "stage/myStageForm";
	}

	@RequestMapping(value = "/uploadStage" ,method = RequestMethod.POST)
	public String uploadBanner(MultipartFile uploadBanner ,MultipartFile profileImg, String stage_intro) {



		int id = (int)session.getAttribute("loginId");
		MyStageVO vo = new MyStageVO();
		vo.setStage_user_id(id);
		System.out.println(vo);

		if(!uploadBanner.isEmpty()) {
			String stage_bannerImgS = uploadBanner.getOriginalFilename();
			String stage_bannerImgO = FileService.saveFile(uploadBanner, uploadPath);
			vo.setStage_bannerImgO(stage_bannerImgO);
			vo.setStage_bannerImgS(stage_bannerImgS);

		}
		if(!profileImg.isEmpty()) {
			String stage_profileImgS = profileImg.getOriginalFilename();
			String stage_profileImgO = FileService.saveFile(profileImg, uploadPath);
			vo.setStage_profileImgO(stage_profileImgO);
			vo.setStage_profileImgS(stage_profileImgS);

		}
		if(!stage_intro.isEmpty()) {
			vo.setStage_intro(stage_intro);


		};
		System.out.println(vo);


		int cnt = service.insertStage(vo);

		if(cnt > 0) {

		}else {


			System.out.println("실패");
			return "redirect:/";
		}
		System.out.println("성공");
		return "redirect:/stage/myStageForm";



	}


	@RequestMapping(value = "/banner")
	public void banner(HttpServletResponse response) {

		int id = (int)session.getAttribute("loginId");
		MyStageVO stage = service.selectMyStageone(id);

		String original_file = stage.getStage_bannerImgO();
		try {
			response.setHeader("Content-Disposition", "attachment;filename="+
			URLEncoder.encode(original_file,"UTF-8"));

		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String fullPath = uploadPath + "/" +stage.getStage_bannerImgO();
		FileInputStream fis = null;
		ServletOutputStream sos = null;
		try {
			fis = new FileInputStream(fullPath);
			sos = response.getOutputStream();

			FileCopyUtils.copy(fis, sos);

		} catch (Exception e) {

		}finally {
			if(fis != null) {
				try {
					fis.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			if(sos != null) {
				try {
					sos.close();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}

	}


	@RequestMapping(value = "/profile")
	public void profile(HttpServletResponse response) {

		int id = (int)session.getAttribute("loginId");
		MyStageVO stage = service.selectMyStageone(id);

		String original_file = stage.getStage_profileImgO();
		try {
			response.setHeader("Content-Disposition", "attachment;filename="+
			URLEncoder.encode(original_file,"UTF-8"));

		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String fullPath = uploadPath + "/" +stage.getStage_profileImgO();
		FileInputStream fis = null;
		ServletOutputStream sos = null;
		try {
			fis = new FileInputStream(fullPath);
			sos = response.getOutputStream();

			FileCopyUtils.copy(fis, sos);

		} catch (Exception e) {

		}finally {
			if(fis != null) {
				try {
					fis.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			if(sos != null) {
				try {
					sos.close();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}

	}











}
