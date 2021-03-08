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
	public ArrayList<HashMap<String, Object>> selectMyStageReport(int id);
	public int insertFollow(HashMap<String, Integer> map); 
	public int deleteFollow(HashMap<String, Integer> map);
	public Integer isFollow(HashMap<String, Integer> map);
	public int countFollow(int follow_stage_id);
	public int countFollowByVideoId(int video_id);
	public ArrayList<Integer> selectFollowById(int follow_user_id);

}
