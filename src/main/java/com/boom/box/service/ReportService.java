package com.boom.box.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boom.box.dao.ReportDAO;
import com.boom.box.vo.ReportVO;

@Service
public class ReportService {

	@Autowired
	private ReportDAO dao;


	public int insertReport(ReportVO reportVO) {
		return dao.insertReport(reportVO);

	}

	public ArrayList<HashMap<String, Object>> selectReportone(int id){

		return dao.selectReportone(id);

	}


}
