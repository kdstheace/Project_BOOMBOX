package com.boom.box.vo;

import lombok.Data;

@Data
public class UserVO {
	private int user_id;
	private String user_name;
	private String user_googleId;
	private String user_phone;
	private String user_address;
	private String user_zip;
	private String user_email;
	private String user_gender;
	private String user_bday;
	private String user_inDate;
	private String user_manager;
	private String user_pending;
}
