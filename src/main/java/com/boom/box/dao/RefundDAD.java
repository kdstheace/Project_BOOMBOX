package com.boom.box.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.boom.box.vo.FollowVO;
import com.boom.box.vo.RefundVO;

@Repository
public class RefundDAD {

	@Autowired
	private SqlSession session;


	public int insertRefund(RefundVO vo) {
		int count = 0;
		try {
			RefundMapper mapper = session.getMapper(RefundMapper.class);
			count = mapper.insertRefund(vo);


		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}

}
