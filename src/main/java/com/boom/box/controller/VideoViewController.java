package com.boom.box.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.math.BigDecimal;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.boom.box.service.BoomMasterService;
import com.boom.box.service.MembershipService;
import com.boom.box.service.MyStageService;
import com.boom.box.service.UserService;
import com.boom.box.service.VideoService;
import com.boom.box.util.FileService;
import com.boom.box.util.PageNavigator;
import com.boom.box.vo.CommentVO;
import com.boom.box.vo.VideoVO;

@Controller
@RequestMapping(value="/video")
public class VideoViewController {
	private static final Logger logger = LoggerFactory.getLogger(VideoViewController.class);
	@Autowired
	private VideoService service;
	@Autowired
	private MyStageService myStageService;
	@Autowired
	private BoomMasterService boomMasterService;
	@Autowired
	private UserService userService;
	@Autowired
	private MembershipService membershipService;
	
	private String uploadPath = "/uploadFile/Boombox";
	private final int countPerPage = 10;
	private final int pagePerGroup = 5;
	
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
			logger.info("실패");
			return "redirect:/video/uploadForm";
		}

		return "redirect:/stage/myStageForm";
	}
	
	/*
	 * @RequestMapping(value="/search", method=RequestMethod.GET) public String
	 * search() { return ""; }
	 */
	
	@RequestMapping(value="/watchForm", method=RequestMethod.GET)
	public String watchForm(int video_id, Model model, HttpSession session) {
		logger.info("동영상 시청하러 이동.");
		int loginId = (int)session.getAttribute("loginId");
		

		//좋아요 실행 여부 확인.
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("like_user_id", loginId);
		map.put("like_video_id", video_id);
		boolean flag = service.isLike(map);
		model.addAttribute("flag", flag);
		
		//팔로우 실행 여부 확인
		HashMap<String, Integer> map_follow = new HashMap<String, Integer>();
		map.put("follow_user_id", loginId);
		int follow_stage_id = service.selectVideoById(video_id).getVideo_user_id();
		map.put("follow_stage_id", follow_stage_id);
		boolean flag_follow = myStageService.isFollow(map);
		model.addAttribute("flag_follow",flag_follow);
		
		//팔로우 카운트 보내기
		int countFollow = myStageService.countFollowByVideoId(video_id);
		model.addAttribute("countFollow", countFollow);
		
		int count = service.countLike(video_id);

		HashMap<String, Object> video = service.selectVideoOne(video_id);
		
		//유저가 비디오를 볼 자격이 있는지 확인
		if(boomMasterService.selectBoomMasterOne(((BigDecimal)video.get("VIDEO_USER_ID")).intValue()) != null && (video.get("VIDEO_CLASS").equals("2"))) {
			if(userService.canIWatch(loginId) != null) {
				model.addAttribute("video", video);
			}else {
				membershipService.insertStartMembership(loginId);
				return "/membership/membershipForm";
			}
		}else {
			model.addAttribute("video", video);
		}
		
		
		ArrayList<HashMap<String, Object>> commentList = service.selectComment(video_id);
		model.addAttribute("commentList", commentList);

		ArrayList<HashMap<String, Object>> list = service.selectVideoList("", 0, 8);
		
		/* int count2 = 0; */
		ArrayList<HashMap<String, Object>> list2 = new ArrayList<HashMap<String,Object>>();
		for(HashMap<String, Object> vo : list) {
			if(!vo.equals(video)) {
				/* count2 = service.countLike((int)vo.get("VIDEO_ID")); */
				list2.add(vo);
			}
		}

		model.addAttribute("list", list2);
		model.addAttribute("count",count);
		service.updateVideoHits(video_id);
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
	@RequestMapping(value="/searchForm", method = RequestMethod.GET)
	public String searchForm(Model model, @RequestParam(defaultValue = "")String searchText
							, @RequestParam(defaultValue = "1")int page) {
		logger.info("검색어:{}", searchText);
		logger.info("검색결과 이동");
		int total = service.selectVideoCount(searchText);
		logger.info("서비스 제대로 확인");
		PageNavigator navi = new PageNavigator(countPerPage, pagePerGroup, page, total);
		logger.info("네비에 현재 변수들로 생성, 페이지: {}", page);
		ArrayList<HashMap<String, Object>> list = service.selectVideoList(searchText, navi.getStartRecord(), navi.getCountPerPage());
		
		//추가
		for(HashMap<String, Object> map : list) { 
			int countFollow = myStageService.countFollow(((BigDecimal)(map.get("VIDEO_USER_ID"))).intValue());
			map.put("countFollow",countFollow );
		}
		//추가 끝
		
		model.addAttribute("list",list);
		model.addAttribute("searchText",searchText);
		model.addAttribute("navi", navi);
		
		return "video/searchForm";
	}
	
	@RequestMapping(value="/deleteVideo")
	public String deleteVideo(int video_id) {
		service.deleteVideo(video_id);
		return "redirect:/";

	}
	
	@RequestMapping(value="/like")
	public String like(int video_id, HttpSession session) {
		VideoVO vo = new VideoVO();
		int user_id = (int)session.getAttribute("loginId");
		vo.setVideo_user_id(user_id);
		vo.setVideo_id(video_id);;
		service.insertLike(vo);
		logger.info("좋아요 성공!");
		
		return "redirect:/video/watchForm?video_id="+video_id;
	}
	
	@RequestMapping(value="/unlike")
	public String unlike(int video_id, HttpSession session) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		int user_id = (int)session.getAttribute("loginId");
		map.put("like_user_id", user_id);
		map.put("like_video_id", video_id);
		service.deleteLike(map);
		logger.info("좋아요 해제!");
		
		return "redirect:/video/watchForm?video_id="+video_id;
	}
	
	//Comments
	@RequestMapping(value="/insertComment", method= RequestMethod.POST)
	public String insertComment(CommentVO comment, HttpSession session) {
		String path = null;
		int loginId = (int)session.getAttribute("loginId");
		logger.info("{}",comment.getComment_video_id());
		comment.setComment_user_id(loginId);
		logger.info("세팅 완료");
		ArrayList<HashMap<String, Object>> list = service.selectComment(comment.getComment_video_id());
		logger.info("전체 리스트 가져옴{}", list);
		if(list.size() == 0) {
			service.insertComment(comment);
		}
		for(HashMap<String, Object> vo : list) {
			logger.info("반복");
			if(((BigDecimal)vo.get("COMMENT_USER_ID")).intValue() == loginId) {
				service.updateComment(comment);
				logger.info("댓글 저장 성공!1");
				break;
			}else {
				service.insertComment(comment);
				logger.info("댓글 저장 성공!2");
				break;
			}
		}
		return "redirect:/video/watchForm?video_id="+comment.getComment_video_id();
	}
	
	
}
