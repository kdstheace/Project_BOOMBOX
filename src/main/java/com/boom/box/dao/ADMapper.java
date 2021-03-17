package com.boom.box.dao;

import java.util.ArrayList;

import com.boom.box.vo.ADVO;

public interface ADMapper {


	public int insertADHomeBanner(ADVO vo);
	public ArrayList<ADVO> selectBanner();
}
