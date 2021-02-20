package com.boom.box.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.boom.box.vo.BoomMasterVO;
import com.boom.box.vo.VideoVO;

public interface BoomMasterMapper {
	public int insertBoomMaster(BoomMasterVO boomMaster);
	ArrayList<HashMap<String, Object>> selectBoomMasterList();

}
