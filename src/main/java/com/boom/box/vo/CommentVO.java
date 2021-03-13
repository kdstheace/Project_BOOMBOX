package com.boom.box.vo;

import lombok.Data;

@Data
public class CommentVO {
    private int comment_id;
    private int comment_user_id;
    private int comment_video_id;
    private String comment_content;
    private String comment_inDate;
}
