package com.boom.box.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller
@RequestMapping(value="/user")
public class UserViewController {
	@Autowired
	private SqlSession session;
	private String uploadPath="/uploadFile";
	
}
