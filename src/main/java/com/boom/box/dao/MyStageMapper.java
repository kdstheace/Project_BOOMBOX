package com.boom.box.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.boom.box.vo.MyStageVO;

public interface MyStageMapper {

	//스테이지 vo 가져오기
	public MyStageVO selectMyStageone(int id);
	public int insertStage(MyStageVO vo);
	public ArrayList<HashMap<String, Object>> selectVideoListMystage(int id);
}
