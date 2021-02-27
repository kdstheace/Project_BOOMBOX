package com.boom.box.dao;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.boom.box.vo.CrmVO;

@Repository
public class CrmDAO {

	@Autowired
	private SqlSession session;

	private static final Logger logger = LoggerFactory.getLogger(CrmDAO.class);

	public int insertCrm(CrmVO crm) {
		logger.info("붐마스터 등록 다오까지 들어옴 ㅇㅇ");
		// 오토와이어드 안될 때 this.dao = null 로 뜬다.
		int count = 0;
		try {
			CrmMapper mapper = session.getMapper(CrmMapper.class);
			count = mapper.insertCrm(crm);

			logger.info("디비 들어갔다 막 나옴");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}

}
