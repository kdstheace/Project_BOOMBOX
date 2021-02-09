package com.boom.box.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.boom.box.vo.VideoVO;

public interface VideoMapper {
	public int insertVideo(VideoVO video);
	public int insertVideoInterest(VideoVO video);
	public ArrayList<HashMap<String, Object>> selectVideoList();
	public VideoVO selectVideoById(int video_id);
	public HashMap<String, Object> selectVideoOne(int video_id);
}
