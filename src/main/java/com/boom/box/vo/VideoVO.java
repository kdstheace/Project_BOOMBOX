package com.boom.box.vo;

import lombok.Data;

@Data
public class VideoVO {
	private int video_id;
	private int video_user_id;
	private String video_title;
	private String video_content;
	private int video_hit;
	private String video_urlS;
	private String video_urlO;
	private String video_inDate;
	private String video_class;
	private String video_public;
	private String video_ageLimit;
	private String video_thumbnailS;
	private String video_thumbnailO;
	private String video_copyright;
	private String video_motion;
	private String[] videoInterest_interest;
}
