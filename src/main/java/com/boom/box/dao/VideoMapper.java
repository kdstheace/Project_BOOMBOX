package com.boom.box.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;

import com.boom.box.vo.CommentVO;
import com.boom.box.vo.VideoVO;

public interface VideoMapper {
	public int insertVideo(VideoVO video);
	public int insertVideoInterest(VideoVO video);
	public ArrayList<HashMap<String, Object>> selectVideoList(RowBounds rb, String searchText);
	public ArrayList<HashMap<String, Object>> selectVideoListByLike(RowBounds rb, int user_id);
	public ArrayList<HashMap<String, Object>> selectVideoListById(int user_id);
	public VideoVO selectVideoById(int video_id);
	public HashMap<String, Object> selectVideoOne(int video_id);
	public int selectVideoCount(String searchText);
	public int deleteVideo(int video_id);
	public VideoVO selectVideoClass(int video_id);
	public void updateVideoHits(int video_id);
	public int insertLike(VideoVO video);
	public int countLike(int like_video_id);
	public Integer isLike(HashMap<String, Integer> map);
	public int deleteLike(HashMap<String, Integer> map);
	public ArrayList<HashMap<String, Object>> selectVideoByInterest(int user_id);
	public ArrayList<HashMap<String, Object>> selectVideoByFollow(RowBounds rb, int follow_user_id);
	
	//comment
	public int insertComment(CommentVO comment);
	public ArrayList<HashMap<String, Object>> selectComment(int comment_video_id);
	public int updateComment(CommentVO comment);
}
