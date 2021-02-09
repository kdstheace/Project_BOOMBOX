package com.boom.box.vo;

import lombok.Data;

@Data
public class MembershipVO {

	private int membership_id;
	private int membership_user_id;
	private String membership_indate;
	private String membership_outdate;
	private int membership_price;

}
