package com.boom.box.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boom.box.dao.ADDAO;
import com.boom.box.vo.ADVO;

@Service
public class ADService {

	@Autowired
	private ADDAO dao;

	public int insertADHomeBanner(ADVO vo) {
		return dao.insertADHomeBanner(vo);
	}
	public ArrayList<ADVO> selectBanner(){
		return dao.selectBanner();
	}
}
