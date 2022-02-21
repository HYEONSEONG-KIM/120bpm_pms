package kr.or.ddit.work.vo;

import java.io.Serializable;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class WorkFileVO implements Serializable { 
	//private MultipartFile workFiles;
	
	private String workFileNm;
	private String workFileRgsde;
	private String workFileSavedNm;//fileSavedNm
	private String workFileCode; 
	private String workCode; //file
	private String workFileDelAt;
	private String ctgryCode;
	private String prjctNo;
	private String workFiletempAt; //기존의 테이블에는 없습니다만 처리를 위해 추가해주세요  temp여부를 체크할 수 있도록 처리되어있습니다.
}
