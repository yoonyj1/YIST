package com.kh.yist.student.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString
public class Video {

	private int videoNo;
	private String videoTitle;
	private String videoWriter;
	private String videoContent;
	private String videoSrc;
	private String createDate;
}