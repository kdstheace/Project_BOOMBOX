


CREATE TABLE user_tb (
	user_id			NUMBER  		PRIMARY key,
	user_name		VARCHAR2(20) 	unique	   NOT NULL,
	user_googleId	VARCHAR2(20) 	unique	   NOT NULL,
	user_phone		VARCHAR2(20)	NOT NULL,
	user_address	VARCHAR2(300)	NOT NULL,
	user_zip		NUMBER			NOT NULL,
	user_email		VARCHAR2(50)	NOT NULL,
	user_gender		VARCHAR2(50)	NOT NULL,
	user_bday		DATE 			NOT NULL,
	user_inDate		DATE DEFAULT sysdate			NOT NULL,
	user_manager    VARCHAR2(5) 	DEFAULT 1	NOT NULL,
	user_pending		VARCHAR2(5) 	DEFAULT 1	NOT NULL
);
drop table user_tb;

CREATE TABLE video_tb (
	video_id			NUMBER			 PRIMARY key,
	video_user_id		NUMBER			 references user_tb(user_id) on DELETE CASCADE NOT NULL,
	video_title			VARCHAR2(200)	 NOT NULL,
	video_content		VARCHAR2(3000)		NOT NULL,
	video_hit			NUMBER				NOT NULL,
	video_urlS			VARCHAR2(300)		NOT NULL,
	video_urlO			VARCHAR2(300)		NOT NULL,
	video_ad			VARCHAR2(300),
	video_inDate		DATE DEFAULT sysdate			NOT NULL,
	video_class			VARCHAR2(5) DEFAULT 1	NOT NULL,
	video_public		VARCHAR2(5) DEFAULT 1	NOT NULL,
	video_ageLimit		VARCHAR2(5) DEFAULT 1	NOT NULL,
	video_thumbnailS	VARCHAR2(300)			NOT NULL,
	video_thumbnailO	VARCHAR2(300)			NOT NULL,
	video_copyright		VARCHAR2(5)DEFAULT 1	NOT NULL,
	video_motion		VARCHAR2(5)DEFAULT 2	NOT NULL
);
drop table video_tb;

CREATE TABLE stage_tb (
	stage_id			NUMBER			PRIMARY key,
	stage_user_id		NUMBER			references user_tb(user_id) on DELETE CASCADE NOT NULL,
	stage_bannerImgS	VARCHAR2(300)	NOT NULL,
	stage_bannerImgO	VARCHAR2(300)	NOT NULL,
	stage_profileImgS	VARCHAR2(300)	NOT NULL,
	stage_profileImgO	VARCHAR2(300)	NOT NULL,
	stage_intro			VARCHAR2(3000)	NOT NULL
);
drop table stage_tb;

CREATE TABLE boommaster_tb (
	boommaster_id			NUMBER  PRIMARY key	,
	boommaster_user_id		NUMBER		references user_tb(user_id) on DELETE CASCADE	NOT NULL,
	boommaster_inDate		date	DEFAULT sysdate		NOT NULL,
	boommaster_outDate		DATE    DEFAULT sysdate  	NOT NULL,
	boommaster_cardImgS		VARCHAR2(300)	NOT NULL,
	boommaster_cardImgO		VARCHAR2(300)	NOT NULL,
	boommaster_careerImgS   VARCHAR2(300)	NOT NULL,
	boommaster_careerImgO	VARCHAR2(300)	NOT NULL,
	boommaster_sampleVideoS	VARCHAR2(300)	NOT NULL,
	boommaster_sampleVideoO	VARCHAR2(300)	NOT NULL,
	boommaster_intro		VARCHAR2(3000)	NOT NULL,
	boommaster_major1		VARCHAR2(20)	NOT NULL,
	boommaster_major2		VARCHAR2(20)	NOT NULL
);
drop table boommaster_tb;

CREATE TABLE userPending_tb (
	userPending_id			number  PRIMARY key,
	userPending_user_id		NUMBER	references user_tb(user_id) on DELETE CASCADE NOT NULL,
	userPending_content		DATE	NOT NULL,
	userPending_inDate 		DATE DEFAULT sysdate	NOT NULL
);
drop table userPending_tb;

CREATE TABLE ad_tb (
	ad_id  				number 				PRIMARY key,
	ad_category			VARCHAR2(300)		NOT NULL,
	ad_name				VARCHAR2(300)		NOT NULL,
	adt_title			VARCHAR2(300)	NOT NULL,
	ad_image			VARCHAR2(300)	NOT NULL,
	ad_width			VARCHAR2(300)	NOT NULL,
	ad_heigth			VARCHAR2(300)		NOT NULL,
	ad_statDate			DATE DEFAULT sysdate		NOT NULL,
	ad_endDate			DATE  DEFAULT sysdate		NOT NULL,
	ad_redirect_URL		VARCHAR2(100)	NOT NULL,
	ad_active		VARCHAR2(100)	NOT NULL,
	ad_videoS		VARCHAR2(100)	NOT NULL,
	ad_videoO		VARCHAR2(100)	NOT NULL,
	ad_context		VARCHAR2(100)	NOT NULL,
	ad_weight		VARCHAR2(100)	NOT NULL
);

drop table ad_tb;

CREATE TABLE income_tb (
	income_id				number					PRIMARY key,
	income_boommaster_id	NUMBER	references boommaster_tb(boommaster_id) on DELETE CASCADE NOT NULL,
	income_month			DATE DEFAULT sysdate	NOT NULL,
	income_amount			NUMBER					NOT NULL
);
drop table income_tb;

CREATE TABLE like_tb (
	like_id			NUMBER			PRIMARY key,
	like_user_id	NUMBER 	 references user_tb(user_id) on DELETE CASCADE NOT NULL ,
	like_video_id	NUMBER 	 references video_tb(video_id) on DELETE CASCADE NOT NULL
);
drop table like_tb;

CREATE TABLE follow_tb (
	follow_id			NUMBER	PRIMARY key,
	follow_user_id	NUMBER	 references user_tb(user_id) 	on DELETE CASCADE NOT NULL,
	follow_stage_id	NUMBER	 references stage_tb(stage_id)  on DELETE CASCADE NOT NULL
);
drop table follow_tb;

CREATE TABLE membership_tb (
	membership_id		number	PRIMARY key,
	membership_user_id	NUMBER  references user_tb(user_id) on DELETE CASCADE	NOT NULL,
	membership_inDate	DATE 	DEFAULT sysdate				NOT NULL,
	membership_outDate	DATE 	DEFAULT sysdate				NOT NULL,
	membership_price	NUMBER	 DEFAULT 5000               NULL
);

drop table membership_tb;

CREATE TABLE motion_tb (
	motion_id				NUMBER						PRIMARY key,
	motion_video_id			NUMBER						references   video_tb(video_id) on DELETE CASCADE	NOT NULL,
	motion_class			VARCHAR2(5)	 	DEFAULT 1	NOT NULL,
	motion_intro			VARCHAR2(3000)				NOT NULL,
	motion_jasonS			VARCHAR2(300)				NOT NULL,
	motion_jasonO			VARCHAR2(300)				NOT NULL,
	motion_sampleImgS		VARCHAR2(300)				NOT NULL,
	motion_sampleImgO		VARCHAR2(300)				NOT NULL,
	motion_title			VARCHAR2(300)				NOT NULL,
	motion_url				VARCHAR2(300)				NOT NULL,
	motion_inDate			DATE DEFAULT sysdate		NOT NULL


);
drop table motion_tb;

CREATE TABLE comment_tb (
	comment_id			NUMBER					PRIMARY key,
	comment_user_id		NUMBER					references user_tb(user_id) on DELETE CASCADE		NOT NULL,
	comment_video_id	NUMBER					references video_tb(video_id) on DELETE CASCADE	    NOT NULL,
	comment_content		VARCHAR2(3000)			NOT NULL,
	comment_inDate		DATE DEFAULT sysdate	NOT NULL
);
drop table comment_tb;

CREATE TABLE userInterest_tb (
	userInterest_id			NUMBER					PRIMARY key,
	userInterest_user_id	NUMBER					references user_tb(user_id) on DELETE CASCADE	NOT NULL,
	userInterest_interest	VARCHAR2(20)			NOT NULL
);
drop table userInterest_tb;

CREATE TABLE videoInterest_tb (
	videoInterest_id		NUMBER				PRIMARY key,
	videoInterest_video_id	NUMBER				references video_tb(video_id) on DELETE CASCADE		NOT NULL,
	videoInterest_interest	VARCHAR2(20)		NOT NULL
);
drop table videoInterest_tb;

CREATE TABLE payList_tb (
	payList_id				NUMBER					PRIMARY key,
	payList_user_id			NUMBER					references user_tb(user_id)  ON DELETE 	 CASCADE		NOT NULL,
	payList_payId			VARCHAR2(50)			NOT NULL,
	payList_payStore		VARCHAR2(50)			NOT NULL,
	payList_payPrice		NUMBER					NOT NULL,
	payList_payNum			NUMBER					NOT NULL,
	payList_payDate			DATE DEFAULT sysdate	NOT NULL,
	payList_payHome			VARCHAR2(50)			NOT NULL
);
drop table payList_tb;


