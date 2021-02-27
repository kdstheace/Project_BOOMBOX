package com.boom.box.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boom.box.dao.CrmDAO;
import com.boom.box.vo.CrmVO;

@Service
public class CrmService {
	private static final Logger logger = LoggerFactory.getLogger(CrmService.class);

	@Autowired
	private CrmDAO dao;

	// insert 고객센터
	public int insertCrm(CrmVO crm) {
		logger.info("고객센터 등록, 서비스로 데이터 받아서 서비스 동작 시작");
		int count = dao.insertCrm(crm);
		return count;
	}

}
