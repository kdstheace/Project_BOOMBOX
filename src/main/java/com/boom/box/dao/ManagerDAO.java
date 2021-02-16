package com.boom.box.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ManagerDAO {
	
	@Autowired
	private SqlSession session;
	private static final Logger logger = LoggerFactory.getLogger(ManagerDAO.class);


	public int selectUserCount(String searchText) {
		int count = 0;
		try {
			ManagerMapper mapper = session.getMapper(ManagerMapper.class);
			count = mapper.selectUserCount(searchText);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}


	public ArrayList<HashMap<String, Object>> selectUserList(String searchText, int startRecord, int countPerPage){
		ArrayList<HashMap<String, Object>> list = null;
		RowBounds rb = new RowBounds(startRecord, countPerPage);
		try {
			ManagerMapper mapper = session.getMapper(ManagerMapper.class);
			list = mapper.selectUserList(rb, searchText);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

}
