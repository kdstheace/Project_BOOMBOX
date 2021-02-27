package com.boom.box.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boom.box.dao.ManagerDAO;

@Service
public class ManagerService {
	private static final Logger logger = LoggerFactory.getLogger(ManagerService.class);

	@Autowired
	private ManagerDAO dao;
	
	public int selectUserCount(String searchText) {
		int count = dao.selectUserCount(searchText);
		return count;
	}

	public ArrayList<HashMap<String, Object>> selectUserList(String searchText, int startRecord, int countPerPage){
		ArrayList<HashMap<String, Object>> list = dao.selectUserList(searchText, startRecord, countPerPage);
		return list;
	}

	public ArrayList<HashMap<String, Object>> selectCrmList() {
		ArrayList<HashMap<String, Object>> list = dao.selectCrmList();
		return list;
	}


}
