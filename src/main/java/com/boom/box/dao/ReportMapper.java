package com.boom.box.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.boom.box.vo.ReportVO;

public interface ReportMapper {



	public int insertReport(ReportVO vo) ;

	public ArrayList<HashMap<String, Object>> selectReportone(int id);



}
