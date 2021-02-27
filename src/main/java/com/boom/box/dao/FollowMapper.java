package com.boom.box.dao;

import com.boom.box.vo.FollowVO;

public interface FollowMapper {


	public int insertFollow(FollowVO vo);
	public int deleteFollow(int user_id );
	public FollowVO seleteFollowUser(int user_id );
}
