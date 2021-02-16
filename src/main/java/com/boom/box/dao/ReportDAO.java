package com.boom.box.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.boom.box.vo.ReportVO;



@Repository
public class ReportDAO {

	@Autowired
	private SqlSession session;

	public int insertReport(ReportVO reportVO) {
		int cnt= 0;


		try {
			ReportMapper mapper = session.getMapper(ReportMapper.class);
			cnt = mapper.insertReport(reportVO);
		}catch (Exception e) {
			e.printStackTrace();
		}

		return cnt;
	}




	public ArrayList<HashMap<String, Object>> selectReportone(int id){

		 ArrayList<HashMap<String, Object>> list = null;


		try {
			ReportMapper mapper = session.getMapper(ReportMapper.class);
			list = mapper.selectReportone(id);
		}catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}








}
