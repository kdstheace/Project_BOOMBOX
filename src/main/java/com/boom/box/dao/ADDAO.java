package com.boom.box.dao;


import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.boom.box.vo.ADVO;

@Repository
public class ADDAO {
	@Autowired
	private SqlSession session;

	public int insertADHomeBanner(ADVO vo) {
		int count= 0;

		try {
			ADMapper mapper = session.getMapper(ADMapper.class);
			count=mapper.insertADHomeBanner(vo);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return count;
	}


	public ArrayList<ADVO> selectBanner(){
		 ArrayList<ADVO> list =null;

		 try {
				ADMapper mapper = session.getMapper(ADMapper.class);
				list=mapper.selectBanner();

			} catch (Exception e) {
				e.printStackTrace();
			}



		return list;
	}


}
