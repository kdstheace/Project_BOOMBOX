package com.boom.box.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.boom.box.service.BoomMasterService;
import com.boom.box.service.UserService;
import com.boom.box.util.FileService;
import com.boom.box.vo.BoomMasterVO;

@Controller
@RequestMapping(value = "/boomMaster")
public class BoomMasterViewController {

	private static final Logger logger = LoggerFactory.getLogger(BoomMasterViewController.class);

	@Autowired
	private BoomMasterService service;
	private String uploadPath = "/uploadFile/Boombox";
	private final int countPerPage = 10;
	private final int pagePerGroup = 5;

	// 붐마스터 홈
	@RequestMapping(value = "/bmHome", method = RequestMethod.GET)
	public String bmHome() {
		return "boomMaster/bmHome";
	}

	// 붐마스터 관리 폼
	@RequestMapping(value = "/bmApplyForm", method = RequestMethod.GET)
	public String bmApplyForm() {
		return "boomMaster/bmApplyForm";
	}

	// 붐마 등록하기
	@RequestMapping(value = "/bmApply", method = RequestMethod.POST)
	public String insertBoomMaster(BoomMasterVO boomMaster, MultipartFile boommaster_cardImg,
			MultipartFile boommaster_sampleVideo, MultipartFile boommaster_careerImg, HttpSession session) {

		// 로그인 아이디 값 세션에 넣기
		logger.info("{}", session.getAttribute("loginId"));
		int id = (int) session.getAttribute("loginId");
		// 붐마스터 VO에 아이디값 삽입
		boomMaster.setBoommaster_user_id(id);

		// 카드이미지 S, O나누는 작업
		if (!boommaster_cardImg.isEmpty()) {
			String boommaster_cardImgS = boommaster_cardImg.getOriginalFilename();
			String boommaster_cardImgO = FileService.saveFile(boommaster_cardImg, uploadPath);
			boomMaster.setBoommaster_cardImgS(boommaster_cardImgS);
			boomMaster.setBoommaster_cardImgO(boommaster_cardImgO);
			logger.info("카드 SO부여");
		}

		// 샘플 비디오 S, O나누는 작업
		if (!boommaster_sampleVideo.isEmpty()) {
			String boommaster_sampleVideoS = boommaster_sampleVideo.getOriginalFilename();
			String boommaster_sampleVideoO = FileService.saveFile(boommaster_sampleVideo, uploadPath);
			boomMaster.setBoommaster_sampleVideoO(boommaster_sampleVideoO);
			boomMaster.setBoommaster_sampleVideoS(boommaster_sampleVideoS);
			logger.info("샘플비디오 이미지 SO부여");
		}

		logger.info("{}", boommaster_careerImg);

		// 커리어 이미지 S, O나누는 작업
		if (!boommaster_careerImg.isEmpty()) {
			String boommaster_careerImgS = boommaster_careerImg.getOriginalFilename();
			String boommaster_careerImgO = FileService.saveFile(boommaster_careerImg, uploadPath);
			boomMaster.setBoommaster_careerImgO(boommaster_careerImgO);
			boomMaster.setBoommaster_careerImgS(boommaster_careerImgS);
			logger.info("커리어 이미지 SO부여");
		}


		boomMaster.setBoommaster_confirm(0);

		logger.info("{}", boomMaster);
		int cnt = service.insertBoomMaster(boomMaster);
		logger.info("데이터 넣고 돌아옴");

		if (cnt > 0) {
			logger.info("붐마등록 최종 성공!");
			return "boomMaster/close";
		} else {
			logger.info("실패");
			return "boomMaster/close";
		}
	}
	
	// 붐마스터 캔슬 폼
	@RequestMapping(value = "/bmCancelForm", method = RequestMethod.GET)
	public String bmCancelForm() {
		logger.info("붐마스터 취소 폼 들어옴");
		return "boomMaster/bmCancelForm";
	}

	// 붐마스터 캔슬
	@RequestMapping(value = "/bmCancel", method = RequestMethod.POST)
	public String deleteBoomMaster(int boomMaster_User_Id) {

		logger.info("{}", boomMaster_User_Id);
		int cnt;
		cnt = service.deleteBoomMaster(boomMaster_User_Id);
		logger.info("데이터 넣고 돌아옴");

		if (cnt > 0) {
			logger.info("붐마삭제 최종 성공!");
			return "boomMaster/close";
		} else {
			logger.info("실패");
			return "boomMaster/close";
		}
	}

	// 붐마스터 관리 폼
	@RequestMapping(value = "/bmMotionApplyForm", method = RequestMethod.GET)
	public String bmMotionApplyForm() {
		return "boomMaster/bmMotionApplyForm";
	}

	@RequestMapping(value = "/closeForm", method = RequestMethod.GET)
	public String closeForm() {
		return "boomMaster/close";
	}
}
