package com.boom.box.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;

import com.boom.box.vo.VideoVO;

public interface VideoMapper {
	public int insertVideo(VideoVO video);
	public int insertVideoInterest(VideoVO video);
	public ArrayList<HashMap<String, Object>> selectVideoList(RowBounds rb, String searchText);
	public VideoVO selectVideoById(int video_id);
	public HashMap<String, Object> selectVideoOne(int video_id);
	public int selectVideoCount(String searchText);
	public int deleteVideo(int video_id);
	public VideoVO selectVideoClass(int video_id);
}
