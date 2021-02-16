package com.boom.box.dao;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.boom.box.vo.UserVO;

@Repository
public class UserDAO {
	@Autowired
	private SqlSession session;
	private static final Logger logger = LoggerFactory.getLogger(UserDAO.class);

	public UserVO selectGoogleId(String id) {
		UserVO vo = null;
		
		try {
			UserMapper mapper = session.getMapper(UserMapper.class);
			vo = mapper.selectGoogleId(id);
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return vo;
	}

	@Transactional(rollbackFor = {Exception.class})
	public int insertUser(UserVO user) throws Exception{
		int count1 = 0;
		int count2 = 0;
		int count3 = 0;
		logger.info("다오까지는 들어왔다잉");
		try {
			UserMapper mapper = session.getMapper(UserMapper.class);
			count1 = mapper.insertUser(user);
			logger.info("유저 디비에 삽입 완료!");
			count2 = mapper.insertUserInterest(user);
			logger.info("유저 흥미 디비에 삽입완료!");
			count3 = mapper.insertStage(user);
			logger.info("스테이지 디비에 삽입완료!");
			
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception();
		}
		return count1;
	}
	
	
	
	public UserVO selectUserOne(UserVO user) {
		UserVO one = null;
		try {
			UserMapper mapper = session.getMapper(UserMapper.class);
			one = mapper.selectUserOne(user);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return one;
	}
	
	
	public UserVO selectUserEmail(UserVO user) {
		UserVO one = null;
		try {
			UserMapper mapper = session.getMapper(UserMapper.class);
			one = mapper.selectUserEmail(user);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return one;
	}

	@Transactional(rollbackFor = {Exception.class})
	public int updateInfo(UserVO user)  throws Exception{
		logger.info("다오까지 들어옴");
		int count1 = 0;
		int count2 = 0;
		int count3 = 0;
		try {
			UserMapper mapper = session.getMapper(UserMapper.class);
			System.out.println("update Info 들어감");
			count1 = mapper.updateInfo(user);
//			System.out.println("deleteUserInterest 들어감");
			count2 = mapper.deleteUserInterest(user); 
//			System.out.println("insertUserInterest 들어감");
			count3 = mapper.insertUserInterest(user);
			logger.info("유저 디비에 삽입");
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception();
		}
		return count1;
	}
}
