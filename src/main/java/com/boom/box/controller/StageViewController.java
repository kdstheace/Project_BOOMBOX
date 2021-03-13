package com.boom.box.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.math.BigDecimal;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.boom.box.service.MyStageService;
import com.boom.box.service.UserService;
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
	private UserService userService;
	@Autowired
	private VideoService videoService;
	@Autowired
	private HttpSession session;

	private String uploadPath = "/uploadFile/Boombox";

	@RequestMapping(value="/myStageForm", method=RequestMethod.GET)
	public String MyStageForm(Model model, @RequestParam(defaultValue = "0")int stage_user_id) {

		//아이디 처리(결국엔 id가 나오게 됨.)
		int id = 0;
		String url = null;
		int loginId = (int)session.getAttribute("loginId");	
		if(stage_user_id == 0) {
			stage_user_id = loginId;
		}
		if(stage_user_id == loginId) {
			id = loginId;
		}else {
			id = stage_user_id;
		}
		
		//팔로우 숫자
		int countFollow = service.countFollow(id);
		model.addAttribute("countFollow", countFollow);
		
		//팔로우 실행 여부 확인
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("follow_user_id", loginId);
		map.put("follow_stage_id", id);
		boolean flag = service.isFollow(map);
		model.addAttribute("flag",flag);
		
		//프로필 사진 
		url = userService.selectGoogleImg(id);
		model.addAttribute("url", url);
		
		ArrayList<HashMap<String, Object>> list = videoService.selectVideoListById(id);

		model.addAttribute("list", list);
		MyStageVO myStage = service.selectMyStageOne(id);
		model.addAttribute("myStage",myStage);
		return "stage/myStageForm";
	}
	//1. Follow 하기
	@RequestMapping(value="/insertFollow", method = RequestMethod.GET)
	public String insertFollow(int stage_user_id, HttpSession session) {
		int follow_user_id = (int)session.getAttribute("loginId");		
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("follow_user_id", follow_user_id);
		map.put("follow_stage_id", stage_user_id);
		service.insertFollow(map);
		return "redirect:/stage/myStageForm?stage_user_id="+stage_user_id;
	}
	//2. Follow 해제
	@RequestMapping(value="/deleteFollow", method = RequestMethod.GET)
	public String deleteFollow(int stage_user_id, HttpSession session) {
		int follow_user_id = (int)session.getAttribute("loginId");		
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("follow_user_id", follow_user_id);
		map.put("follow_stage_id", stage_user_id);
		service.deleteFollow(map);
		return "redirect:/stage/myStageForm?stage_user_id="+stage_user_id;
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

		int cnt = service.updateStage(vo);

		if(cnt > 0) {

		}else {
			return "/stage/updateStageForm";
		}

		return "/stage/close";

	}


	@RequestMapping(value = "/banner")
	public void banner(HttpServletResponse response, @RequestParam(defaultValue = "0")int stage_user_id) {

		
		int id = 0;
		int loginId = (int)session.getAttribute("loginId");	
		if(stage_user_id == 0) {
			stage_user_id = loginId;
		}
		
		if(stage_user_id == loginId) {
			id = loginId;
		}else {
			id = stage_user_id;
		}

		MyStageVO stage = service.selectMyStageOne(id);

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
					e.printStackTrace();
				}
			}
		}

	}

	
	@RequestMapping(value = "/profile")
	public void profile(HttpServletResponse response, @RequestParam(defaultValue = "0")int video_user_id) {
		int id = 0;
		int loginId = (int)session.getAttribute("loginId");	
		if(video_user_id == 0) {
			video_user_id = loginId;
		}
		
		if(video_user_id == loginId) {
			id = loginId;
		}else {
			id = video_user_id;
		}

		MyStageVO stage = service.selectMyStageOne(id);

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
					e.printStackTrace();
				}
			}
		}

	}

	@RequestMapping(value = "/updateStageForm" ,method = RequestMethod.GET)
	public String updateStageForm(Model  model) {

		int id = (int)session.getAttribute("loginId");
		MyStageVO stage = service.selectMyStageOne(id);

		model.addAttribute("stage", stage);


		return"stage/updateStageForm";
	}


	@RequestMapping(value = "/deleteBanner" )
	public String deleteBanner(Model  model) {

		int id = (int)session.getAttribute("loginId");
		MyStageVO stage = service.selectMyStageOne(id);
		System.out.println(stage);

		stage.setStage_bannerImgO("");
		stage.setStage_bannerImgS("");
		System.out.println(stage);


		int cnt = service.deleteBanner(stage);

		if(cnt > 0) {
			System.out.println("삭제성공");
		}else {

			return"redirect:/stage/updateStageForm";
		}

		return"redirect:/stage/updateStageForm";
	}


	@RequestMapping(value = "/deleteProfile")
	public String deleteProfile(Model  model) {


		int id = (int)session.getAttribute("loginId");
		MyStageVO stage = service.selectMyStageOne(id);
		System.out.println(stage);

		stage.setStage_profileImgO("");
		stage.setStage_profileImgS("");
		System.out.println(stage);


		int cnt = service.deleteProfile(stage);

		if(cnt > 0) {
			System.out.println("삭제성공");
		}else {
			return"redirect:/stage/updateStageForm";
		}
		return"redirect:/stage/updateStageForm";
	}


}
