package com.boom.box.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;

public interface SchoolMapper {
	public ArrayList<HashMap<String, Object>> selectSchoolVideoList(RowBounds rb);
	public ArrayList<HashMap<String, Object>> selectVideoListbyCategory(RowBounds rb, String videointerest_category);
	public ArrayList<HashMap<String, Object>> selectMySchoolList(int follow_user_id);
}
