package com.boom.box.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.boom.box.service.VideoService;
import com.boom.box.util.FileService;
import com.boom.box.vo.VideoVO;

@Controller
@RequestMapping(value="/video")
public class VideoViewController {
	private static final Logger logger = LoggerFactory.getLogger(VideoViewController.class);
	@Autowired
	private VideoService service;
	private String uploadPath = "/uploadFile/Boombox";
	
	@RequestMapping(value="/uploadForm", method=RequestMethod.GET)
	public String uploadEditForm() {
		return "video/uploadForm";
	}
	
	@RequestMapping(value="/upload", method=RequestMethod.POST)
	public String upload(VideoVO video, MultipartFile uploadVideo, MultipartFile uploadThumbnail, HttpSession session
						,boolean video_motion, boolean video_copyright, boolean video_ageLimit, boolean video_public) {
		/*
		 * String id = (String)session.getAttribute("loginId");
		 * logger.info("세션에 들어간 아이디 정체:{}", id);
		 */
		video.setVideo_user_id(28);
		logger.info("임시 아이디 부여");
		if(!uploadVideo.isEmpty()) {
			String video_urlS = uploadVideo.getOriginalFilename();
			String video_urlO = FileService.saveFile(uploadVideo, uploadPath);
			video.setVideo_urlO(video_urlO);
			video.setVideo_urlS(video_urlS);
			logger.info("비디오 SO부여");
		}
		if(!uploadThumbnail.isEmpty()) {
			String video_thumbnailO = uploadThumbnail.getOriginalFilename();
			String video_thumbnailS = FileService.saveFile(uploadThumbnail, uploadPath);
			video.setVideo_thumbnailO(video_thumbnailO);
			video.setVideo_thumbnailS(video_thumbnailS);
			logger.info("섬네일 SO부여");
		}
		if(video_motion) {
			video.setVideo_motion("1");
		}else {
			video.setVideo_motion("2");
		}
		if(video_copyright) {
			video.setVideo_copyright("1");
		}else {
			video.setVideo_copyright("2");
		}
		if(video_ageLimit) {
			video.setVideo_ageLimit("1");
		}else {
			video.setVideo_ageLimit("2");
		}
		if(video_public) {
			video.setVideo_public("1");
		}else {
			video.setVideo_public("2");
		}
		logger.info("체크도 다 전달됨.");
		logger.info("{}",video);
		
		int cnt = service.insertVideo(video);
		logger.info("데이터 넣고 돌아옴");	
		
		if(cnt > 0) {
			logger.info("비디오 업로드 최종 성공!");
		}else {
			System.out.println(video.getVideo_id());
			logger.info("실패패패패패패");
			return "redirect:/video/uploadForm";
		}

		return "redirect:/stage/myStageForm";
	}
	
	@RequestMapping(value="/search", method=RequestMethod.GET)
	public String search() {
		return "";
	}
	
	@RequestMapping(value="/watchForm", method=RequestMethod.GET)
	public String watchForm() {
		logger.info("동영상 시청하러 이동.");
		return "video/watchForm";
	}
	
}
