package com.boom.box.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

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
		
		logger.info("{}",session.getAttribute("loginId"));
		int id = (int)session.getAttribute("loginId");

		video.setVideo_user_id(id);
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
	public String watchForm(int video_id, Model model) {
		logger.info("동영상 시청하러 이동.");
		HashMap<String, Object> list = service.selectVideoOne(video_id);
		model.addAttribute("video", list);
		return "video/watchForm";
	}
	
	@RequestMapping(value="/watch", method=RequestMethod.GET)
	public void watch(int video_id, HttpServletResponse response, HttpServletRequest request) {
		HashMap<String, Object> list = service.selectVideoOne(video_id);
		String original_file = (String)list.get("VIDEO_URLO");
		StreamView st = new StreamView();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("movieName", original_file);
		try {
			st.renderMergedOutputModel(map, request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	
//	@RequestMapping(value="/watch", method=RequestMethod.GET)
//	public void watch(int video_id, HttpServletResponse response) {
//		HashMap<String, Object> list = service.selectVideoOne(video_id);
//		String original_file = (String)list.get("VIDEO_URLO");
//		logger.info(original_file);
//		try {
//			response.setHeader("Content-Disposition", "attachment;filename="+
//			URLEncoder.encode(original_file,"UTF-8"));
//		} catch (UnsupportedEncodingException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		String fullPath = uploadPath + "/" + (String)list.get("VIDEO_URLS");
//		FileInputStream fis = null;
//		ServletOutputStream sos = null;
//		
//		try {
//			fis = new FileInputStream(fullPath); //읽어옴
//			sos = response.getOutputStream();//서버에서 클라이언트로 나감
//			
//			//스프링에서 파일 전달에 사용할 유틸 제공해줌.
//			FileCopyUtils.copy(fis, sos);
//			
//		} catch (Exception e) {
//
//		} finally { 
//			if(fis != null) {
//				try {
//					fis.close();
//				} catch (IOException e) {
//					e.printStackTrace();
//				}
//			}
//			if(sos != null) {
//				try {
//					sos.close();
//				} catch (IOException e) {
//					// TODO Auto-generated catch block
//					e.printStackTrace();
//				}
//			}
//		}
//		
//	}
	
	
	@RequestMapping(value="/thumbnail", method=RequestMethod.GET)
	public void thumbnail(int video_id, HttpServletResponse response) {
		VideoVO video = service.selectVideoById(video_id);
		String original_file = video.getVideo_thumbnailO();
		try {
			response.setHeader("Content-Disposition", "attachment;filename="+
			URLEncoder.encode(original_file,"UTF-8"));

		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String fullPath = uploadPath + "/" + video.getVideo_thumbnailS();
		FileInputStream fis = null;
		ServletOutputStream sos = null;
		
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
