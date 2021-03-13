package com.boom.box.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;

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
import com.boom.box.util.FileService;
import com.boom.box.util.FileService2;
import com.boom.box.vo.MotionVO;

@Controller
@RequestMapping(value = "/motion")
public class MotionViewController {

	private static final Logger logger = LoggerFactory.getLogger(MotionViewController.class);

	@Autowired
	private MotionService service;
	@Autowired
	private HttpServletRequest request;
	
	@Autowired
	private HttpSession session;
	
	private String uploadPath = "/uploadFile/Boombox";

	@RequestMapping(value = "/motionSelect", method = RequestMethod.GET)
	public String motionSelect(int motion_video_id, Model model) {
		logger.info("모션 선택창으로 이동");
		MotionVO vo1 = new MotionVO();
		MotionVO vo2 = new MotionVO();
		vo1.setMotion_video_id(motion_video_id);
		vo1.setMotion_class("1");
		vo2.setMotion_video_id(motion_video_id);
		vo2.setMotion_class("2");

		ArrayList<MotionVO> list1 = service.selectMotionListByClass(vo1);
		ArrayList<MotionVO> list2 = service.selectMotionListByClass(vo2);
		model.addAttribute("motion_video_id", motion_video_id);
		model.addAttribute("list1", list1);
		model.addAttribute("list2", list2);
		return "school/motionAi/motionSelect";
	}

	@RequestMapping(value = "/pose", method = RequestMethod.GET)
	public String pose(MotionVO motion, Model model, int view_start) {
		
		
		
		//
		int motion_video_id = motion.getMotion_video_id();
		MotionVO vo1 = new MotionVO();
		MotionVO vo2 = new MotionVO();
		vo1.setMotion_video_id(motion_video_id);
		vo1.setMotion_class("1");
		vo2.setMotion_video_id(motion_video_id);
		vo2.setMotion_class("2");

		ArrayList<MotionVO> list1 = service.selectMotionListByClass(vo1);
		ArrayList<MotionVO> list2 = service.selectMotionListByClass(vo2);
		model.addAttribute("motion_video_id", motion_video_id);
		model.addAttribute("list1", list1);
		model.addAttribute("list2", list2);
		model.addAttribute("view_start", view_start);

		MotionVO vo = service.selectMotionOne(motion);
		logger.info("{}", vo);
		model.addAttribute("motion", vo);
		logger.info("포즈 창으로 이동");
		return "school/motionAi/motionPoseForm";
	}

	@RequestMapping(value = "/count", method = RequestMethod.GET)
	public String count(MotionVO motion, Model model, int view_start) {
		int motion_video_id = motion.getMotion_video_id();
		MotionVO vo1 = new MotionVO();
		MotionVO vo2 = new MotionVO();
		vo1.setMotion_video_id(motion_video_id);
		vo1.setMotion_class("1");
		vo2.setMotion_video_id(motion_video_id);
		vo2.setMotion_class("2");

		ArrayList<MotionVO> list1 = service.selectMotionListByClass(vo1);
		ArrayList<MotionVO> list2 = service.selectMotionListByClass(vo2);
		model.addAttribute("motion_video_id", motion_video_id);
		model.addAttribute("list1", list1);
		model.addAttribute("list2", list2);
		model.addAttribute("view_start", view_start);

		MotionVO vo = service.selectMotionOne(motion);
		String motionClass=vo.getMotion_class();
		int numClass=Integer.parseInt(motionClass);
		
		model.addAttribute("numClass", numClass);
		
		
		logger.info("{}", vo);
		model.addAttribute("motion", vo);
		logger.info("카운트 창으로 이동");
		return "school/motionAi/motionCountForm";
	}

	@RequestMapping(value = "/upload", method = RequestMethod.POST)
	public String upload(HttpServletRequest request, MotionVO motion, String motion_title, String uploadInfo,
			MultipartFile uploadMetadata, MultipartFile uploadModel, MultipartFile uploadweight,
			MultipartFile uploadInfoPhoto, HttpSession session) {
		logger.info("모션 등록 클릭 해서 컨트롤러 들어옴");

		motion.setMotion_info(uploadInfo);

//		String uploadPath = "/spring/workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/BOOMBOX/resources/motionAi";
		String rootPath = request.getSession().getServletContext().getRealPath("/resources");
		String uploadPath2 = rootPath + "/motionAi";
		System.out.println(uploadPath2);

		String title = null;
		if (motion.getMotion_class().equals("1")) {
			title = "(pose)" + motion_title;
		} else {
			title = "(count)" + motion_title;
		}
		motion.setMotion_title(title);

		uploadPath2 = uploadPath2 + "/" + motion.getMotion_video_id() + "/" + motion.getMotion_class() + "/"
				+ motion.getMotion_title();
		if (!uploadMetadata.isEmpty()) {
			String motion_metaS = uploadMetadata.getOriginalFilename();
			String motion_metaO = FileService2.saveFile(uploadMetadata, uploadPath2);
			motion.setMotion_metaO(motion_metaO);
			motion.setMotion_metaS(motion_metaS);
		}

		if (!uploadModel.isEmpty()) {
			String motion_modelS = uploadModel.getOriginalFilename();
			String motion_modelO = FileService2.saveFile(uploadModel, uploadPath2);
			motion.setMotion_modelO(motion_modelO);
			motion.setMotion_modelS(motion_modelS);
		}

		if (!uploadweight.isEmpty()) {
			String motion_modelS = uploadweight.getOriginalFilename();
			String motion_modelO = FileService2.saveFile(uploadweight, uploadPath2);
		}

		logger.info("옴?1");

		System.out.println(uploadInfoPhoto);
		
		//샘플사진 업로드 되는 곳
		if (!uploadInfoPhoto.isEmpty()) {
			String motion_infoPhotoS = uploadInfoPhoto.getOriginalFilename();
			String motion_infoPhotoO = FileService.saveFile(uploadInfoPhoto, uploadPath);
			motion.setMotion_infoPhotoO(motion_infoPhotoO);
			motion.setMotion_infoPhotoS(motion_infoPhotoS);
			
			System.out.println(uploadInfoPhoto);
		}

		logger.info("이제 서비스로 이동");
		logger.info("{}", motion);
		String path = service.insertMotion(motion);
		return path;
	}
	
	/*
	 * @RequestMapping(value="/sameplePic") public void
	 * samplePic(HttpServletResponse response, int motion_id, int motion_video_id,
	 * String motion_class) {
	 * 
	 * 
	 * 
	 * MotionVO vo = service.selectMotionOnePic(motion_id, motion_video_id,
	 * motion_class); String original_file = vo.getMotion_infoPhotoO();
	 * 
	 * logger.info("샘플픽{}",vo);
	 * 
	 * try { response.setHeader("Content-Disposition", "attachment;filename="+
	 * URLEncoder.encode(original_file,"UTF-8"));
	 * 
	 * } catch (UnsupportedEncodingException e) { // TODO Auto-generated catch block
	 * e.printStackTrace(); } String fullPath = uploadPath + "/" + original_file;
	 * 
	 * System.out.println(fullPath);
	 * 
	 * FileInputStream fis = null; ServletOutputStream sos = null; try { fis = new
	 * FileInputStream(fullPath); sos = response.getOutputStream();
	 * 
	 * FileCopyUtils.copy(fis, sos);
	 * 
	 * } catch (Exception e) {
	 * 
	 * }finally { if(fis != null) { try { fis.close(); } catch (IOException e) {
	 * e.printStackTrace(); } } if(sos != null) { try { sos.close(); } catch
	 * (IOException e) { e.printStackTrace(); } } }
	 * 
	 * }
	 */	
	
	@RequestMapping(value = "/profile")
	public void profile(HttpServletResponse response,  int motion_id, int motion_video_id, String motion_class ) {
		
		MotionVO vo = new MotionVO();
		
		vo.setMotion_id(motion_id);
		vo.setMotion_video_id(motion_video_id);
		vo.setMotion_class(motion_class);
		
		MotionVO result = service.selectMotionOnePic(vo);
		
		System.out.println(result);
		
		String original_file = result.getMotion_infoPhotoO();
		System.out.println(original_file);
		
		try {
			response.setHeader("Content-Disposition", "attachment;filename="+
			URLEncoder.encode(original_file,"UTF-8"));

		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String fullPath = uploadPath + "/" +original_file;
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
	
	

}
