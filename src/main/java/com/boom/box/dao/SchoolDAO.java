package com.boom.box.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class SchoolDAO {

	@Autowired
	private SqlSession session;
	
	public ArrayList<HashMap<String, Object>> selectSchoolVideoList(int startRecord, int countPerPage){
		ArrayList<HashMap<String, Object>> list = null;
		RowBounds rb = new RowBounds(startRecord, countPerPage);
		try {
			SchoolMapper mapper = session.getMapper(SchoolMapper.class);
			list = mapper.selectSchoolVideoList(rb);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
		
	}
	
	public ArrayList<HashMap<String, Object>> selectVideoListbyCategory(String videointerest_category, int startRecord, int countPerPage){
		ArrayList<HashMap<String, Object>> list = null;
		RowBounds rb = new RowBounds(startRecord, countPerPage);
		try {
			SchoolMapper mapper = session.getMapper(SchoolMapper.class);
			list = mapper.selectVideoListbyCategory(rb, videointerest_category);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;		
	}
}
