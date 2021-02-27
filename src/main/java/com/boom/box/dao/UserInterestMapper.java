package com.boom.box.dao;

import java.util.ArrayList;

import com.boom.box.vo.UserInterestVO;

public interface UserInterestMapper {


	public ArrayList<UserInterestVO> selectInterest(int user_id);

}
