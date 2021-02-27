package com.boom.box.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boom.box.dao.RefundDAD;
import com.boom.box.vo.RefundVO;

@Service
public class RefundService {

	@Autowired
	private RefundDAD dao;

	public int insertRefund(RefundVO vo) {
		return dao.insertRefund(vo);
	}

}
