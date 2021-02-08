package com.boom.box.dao;

import com.boom.box.vo.VideoVO;

public interface VideoMapper {
	public int insertVideo(VideoVO video);
	public int insertVideoInterest(VideoVO video);
}
