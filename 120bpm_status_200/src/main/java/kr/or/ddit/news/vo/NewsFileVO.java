package kr.or.ddit.news.vo;

import java.io.Serializable;

import lombok.Data;

@Data
public class NewsFileVO implements Serializable{
	private String boFileNm;
	private String boFileRgsde;
	private String boFileSavedNm;
	private String boFileCode;
	private Integer prjctNo;
	private Integer boNo;
	private String menuClCode;
	private String boFileDelAt;
	private String boFileTempAt;
}
