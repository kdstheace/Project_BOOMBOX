package com.boom.box.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.boom.box.vo.BoomMasterVO;
import com.boom.box.vo.CrmVO;
import com.boom.box.vo.VideoVO;

public interface BoomMasterMapper {
	// 붐마스터 신청 받기
	public int insertBoomMaster(BoomMasterVO boomMaster);

	// 붐마스터 전체 검색
	ArrayList<HashMap<String, Object>> selectBoomMasterApplyList();

	// 중요 체크 
	public void changeBoomMaster(BoomMasterVO boomMaster);
	
	public BoomMasterVO selectBoomasterOne(int id);
	
	public int deleteBoomMasterOne(int boomMaster_User_Id);

	public int insertCrm(CrmVO crm);

	
	
	
}
