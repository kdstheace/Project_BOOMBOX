package com.boom.box.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;

public interface ManagerMapper {

	public int selectUserCount(String searchText);
	public ArrayList<HashMap<String, Object>> selectUserList(RowBounds rb, String searchText);

}
