package com.boom.box.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boom.box.dao.SchoolDAO;

@Service
public class SchoolService {
	
	@Autowired
	private SchoolDAO dao;
	
	
	public ArrayList<HashMap<String, Object>> selectSchoolVideoList(int startRecord, int countPerPage){
		ArrayList<HashMap<String, Object>> list = dao.selectSchoolVideoList(startRecord, countPerPage);
		return list;
	}
	public ArrayList<HashMap<String, Object>> selectVideoListbyCategory(String videointerest_category, int startRecord, int countPerPage){
		ArrayList<HashMap<String, Object>> list = dao.selectVideoListbyCategory(videointerest_category, startRecord, countPerPage);
		return list;
	}
}
