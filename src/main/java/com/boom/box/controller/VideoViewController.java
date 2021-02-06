package com.boom.box.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.boom.box.vo.VideoVO;

@Controller
@RequestMapping(value="/video")
public class VideoViewController {
	private static final Logger logger = LoggerFactory.getLogger(VideoViewController.class);
	
	@RequestMapping(value="/uploadEditForm", method=RequestMethod.GET)
	public String uploadEditForm() {
		return "video/uploadForm";
	}
	
	@RequestMapping(value="/upload", method=RequestMethod.POST)
	public String upload(VideoVO video) {
		logger.info("비디오 카테고리 전달값{}");
		return "";
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
