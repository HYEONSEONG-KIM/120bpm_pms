package kr.or.ddit.mypage.vo;

import lombok.Data;

@Data
public class MyWorkBkmkVO {
	private String workBkmkCode;
	private Integer prjctNo;
	private String memId;
	private String workCode;
	private String ctgryCode;
	
	//즐겨찾기 일감 삭제 (즐겨찾기 해제)
	private String[] delWorkCodes;
	
}
