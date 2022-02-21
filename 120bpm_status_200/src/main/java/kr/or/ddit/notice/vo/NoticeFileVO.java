package kr.or.ddit.notice.vo;

import java.io.Serializable;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class NoticeFileVO implements Serializable { 
	//private MultipartFile noticeFiles;
	
	private String noticeFileNm;
	private String noticeFileRgsde;
	private String noticeFileSavedNm;//fileSavedNm
	private String noticeFileCode; 
	private String noticeCode; //file
	private String noticeFileDelAt;
	private String noticeFiletempAt; //기존의 테이블에는 없습니다만 처리를 위해 추가해주세요  temp여부를 체크할 수 있도록 처리되어있습니다.
}
