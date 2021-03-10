package com.boom.box.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;

import com.boom.box.vo.MembershipVO;
import com.boom.box.vo.MyStageVO;

@Repository
public class MyStageDAO {
	@Autowired
	private SqlSession session;

	public MyStageVO selectMyStageOne(int id) {
		MyStageVO vo= null;
		try {
			MyStageMapper mapper = session.getMapper(MyStageMapper.class);
			vo = mapper.selectMyStageOne(id);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return vo;
	}

	public int updateStage(MyStageVO vo) {
		int cnt= 0;
		try {
			MyStageMapper mapper = session.getMapper(MyStageMapper.class);
			cnt = mapper.updateStage(vo);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return cnt;
	}

	public ArrayList<HashMap<String, Object>> selectVideoListMystage(int id){
		ArrayList<HashMap<String, Object>> list = null;
		try {
			MyStageMapper mapper = session.getMapper(MyStageMapper.class);
			list = mapper.selectVideoListMystage(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public int deleteBanner(MyStageVO vo) {
		int cnt= 0;
		try {
			MyStageMapper mapper = session.getMapper(MyStageMapper.class);
			cnt = mapper.deleteBanner(vo);
		}catch (Exception e) {
			e.printStackTrace();
		}
	
		return cnt;
	}

	public int deleteProfile(MyStageVO vo) {
		int cnt= 0;
		try {
			MyStageMapper mapper = session.getMapper(MyStageMapper.class);
			cnt = mapper.deleteProfile(vo);
		}catch (Exception e) {
			e.printStackTrace();
		}
	
		return cnt;
	}

	public ArrayList<HashMap<String, Object>> selectMyStageReport(int id) {
		ArrayList<HashMap<String, Object>> vo= null;
		try {
			MyStageMapper mapper = session.getMapper(MyStageMapper.class);
		    vo = mapper.selectMyStageReport(id);
		}catch (Exception e) {
		    e.printStackTrace();
		}
		return vo;
	}
	
	public int insertFollow(HashMap<String, Integer> map) {
		int count = 0;
		try {
			MyStageMapper mapper = session.getMapper(MyStageMapper.class);
			count = mapper.insertFollow(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	} 
	
	public int deleteFollow(HashMap<String, Integer> map) {
		int count = 0;
		try {
			MyStageMapper mapper = session.getMapper(MyStageMapper.class);
			count = mapper.deleteFollow(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}
	
	public Integer isFollow(HashMap<String, Integer> map) {
		Integer follow_id = 0;
		try {
			MyStageMapper mapper = session.getMapper(MyStageMapper.class);
			follow_id = mapper.isFollow(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return follow_id;
	}
	
	public int countFollow(int follow_stage_id) {
		int count = 0;
		try {
			MyStageMapper mapper = session.getMapper(MyStageMapper.class);
			count = mapper.countFollow(follow_stage_id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}
	public int countFollowByVideoId(int video_id) {
		int count = 0;
		try {
			MyStageMapper mapper = session.getMapper(MyStageMapper.class);
			count = mapper.countFollowByVideoId(video_id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}
	public ArrayList<Integer> selectFollowById(int follow_user_id){
		ArrayList<Integer> list = null;
		try {
			MyStageMapper mapper = session.getMapper(MyStageMapper.class);
			list = mapper.selectFollowById(follow_user_id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}
