package com.boom.box.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
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
import org.springframework.web.multipart.MultipartFile;

import com.boom.box.service.MotionService;
import com.boom.box.util.FileService2;
import com.boom.box.vo.MotionVO;

@Controller
@RequestMapping(value="/motion")
public class MotionViewController {

	private static final Logger logger = LoggerFactory.getLogger(MotionViewController.class);

	private String uploadPath = "/spring/workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/BOOMBOX/resources/motionAi";
	@Autowired
	private MotionService service;
	@Autowired
	private HttpServletRequest request;

	@RequestMapping(value="/motionSelect", method=RequestMethod.GET)
	public String motionSelect(int motion_video_id, Model model) {
		logger.info("모션 선택창으로 이동");
		model.addAttribute("motion_video_id", motion_video_id);
		return "school/motionAi/motionSelect";
	}
	
	@RequestMapping(value="/count", method=RequestMethod.GET)
	public String count(int motion_video_id, Model model) {

		MotionVO motion = service.selectMotionOne(motion_video_id);
		model.addAttribute("motion", motion);
		logger.info("카운트 창으로 이동");
		return "school/motionAi/motionCountForm";
	}
	
	@RequestMapping(value="/upload", method=RequestMethod.POST)
	public String upload(MotionVO motion, MultipartFile uploadMetadata, MultipartFile uploadModel, HttpSession session) {
		uploadPath = uploadPath + "/" + motion.getMotion_video_id() + "/" + motion.getMotion_class() + "/" + motion.getMotion_title();
		if(!uploadMetadata.isEmpty()) {
			String motion_metaS = uploadMetadata.getOriginalFilename();
			String motion_metaO = FileService2.saveFile(uploadMetadata, uploadPath);
			motion.setMotion_metaO(motion_metaO);
			motion.setMotion_metaS(motion_metaS);
		}
		
		if(!uploadModel.isEmpty()) {
			String motion_modelS = uploadModel.getOriginalFilename();
			String motion_modelO = FileService2.saveFile(uploadModel, uploadPath);
			motion.setMotion_modelO(motion_modelO);
			motion.setMotion_modelS(motion_modelS);
		}
		String path = service.insertMotion(motion);
		return path;
	}
	
	@RequestMapping(value="/metadata", method=RequestMethod.GET)
	public void metadata(int motion_video_id, HttpServletResponse response) {
		
		MotionVO motion = service.selectMotionOne(motion_video_id);
		uploadPath = uploadPath + "/" + motion.getMotion_video_id() + "/" + motion.getMotion_class() + "/" + motion.getMotion_title();
		String original_file = motion.getMotion_metaO();
		try {
			response.setHeader("Content-Disposition", "attachment;filename=" + URLEncoder.encode(original_file,"UTF-8"));
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		String fullPath = uploadPath + "/" + motion.getMotion_metaS();
		FileInputStream fis = null;
		ServletOutputStream sos = null;
		logger.info(fullPath);
		try {
			fis = new FileInputStream(fullPath); //읽어옴
			sos = response.getOutputStream();//서버에서 클라이언트로 나감
			//스프링에서 파일 전달에 사용할 유틸 제공해줌.
			FileCopyUtils.copy(fis, sos);
			
		} catch (Exception e) {

		} finally {  //아래는 통로를 다쓰면 통로를 닫아줘야한다.
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
