package com.boom.box.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.boom.box.vo.MyStageVO;

public interface MyStageMapper {
	public MyStageVO selectMyStageone(int id);
	public int updateStage(MyStageVO vo);
	public int deleteBanner(MyStageVO vo);
	public int deleteProfile(MyStageVO vo);
	public ArrayList<HashMap<String, Object>> selectVideoListMystage(int id);
}
